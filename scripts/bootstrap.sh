#!/bin/bash

set -o errexit  # Exit immediately if a pipeline ... exits with a non-zero status
set -o pipefail # ... return value of a pipeline is the value of the last (rightmost) command to exit with a non-zero status
set -o nounset  # Treat unset variables ... as an error

function main() {
    local kube_context=""
    local env_name=""
    while getopts ":k:e:" option; do
        case $option in
            k) kube_context=$OPTARG;;
            e) env_name=$OPTARG;;
           \?) echo "Error: Invalid option"
               help $0
               exit;;
       esac
    done
    [[ ${kube_context} == "" || ${env_name} == "" ]] && { help $0; exit 1; }

    echo "=== About to bootstrap environment '${env_name}' using kubectl context '${kube_context}' ..."

    local kubectl_cmd="kubectl --context=${kube_context}"
    local state_path="$(git rev-parse --show-toplevel)/state/${env_name}"

    # apply manifests for crucial applications
    for app_file in \
        ${state_path}/system/argocd.yaml \
        ; do
        namespace=$(yq -e '.spec.destination.namespace' ${app_file})

        ${kubectl_cmd} create ns ${namespace} || true
        helm_render ${app_file} | ${kubectl_cmd} -n ${namespace} apply -f -
    done

    ${kubectl_cmd} apply -n argocd -R \
        -f ${state_path}/apps.yaml \
        -f ${state_path}/system.yaml

    # wait for argocd to create argocd-initial-admin-secret
    ${kubectl_cmd} -n argocd wait --timeout=300s \
        --for=condition=ready pod -l app.kubernetes.io/name=argocd-server

    local argocd_secret=$(${kubectl_cmd} \
        -n argocd get secret argocd-initial-admin-secret \
        -o jsonpath="{.data.password}" \
        | base64 -d \
    )
    echo Argocd admin password: ${argocd_secret}
}

function help() {
    local program_name=$1
    echo "Bootstrap system manifests."
    echo
    echo "Syntax: ${program_name} -k context -e env"
    echo "options:"
    echo "-k context     kubectl context to use."
    echo "-e env         environment: state directory name."
    echo
}

function helm_render() {
    local app_file=$1
    local values_file=${app_file%.yaml}-values.yaml

    if [ -f ${values_file} ]; then
      helm_render_from_sources "$@"
    else
      helm_render_from_source "$@"
    fi
}

function helm_render_from_source() {
    local app_file=$1
    local repo=$(yq -e '.spec.source.repoURL' ${app_file})
    local chart=$(yq -e '.spec.source.chart' ${app_file})
    local chart_version=$(yq -e '.spec.source.targetRevision' ${app_file})
    local release=$(yq -e '.spec.source.helm.releaseName' ${app_file})
    local namespace=$(yq -e '.spec.destination.namespace' ${app_file})
    local values_file=$(mktemp /tmp/${release}_${chart}_${chart_version}.yaml.XXXX)
    yq '.spec.source.helm.values // ""' ${app_file} > ${values_file}

    helm template ${release} ${chart} \
      --version ${chart_version} --repo ${repo} \
      --include-crds \
      --namespace ${namespace} --values ${values_file}
}

function helm_render_from_sources() {
    local app_file=$1
    local repo=$(yq -e '.spec.sources[0].repoURL' ${app_file})
    local chart=$(yq -e '.spec.sources[0].chart' ${app_file})
    local chart_version=$(yq -e '.spec.sources[0].targetRevision' ${app_file})
    local release=$(yq -e '.spec.sources[0].helm.releaseName' ${app_file})
    local namespace=$(yq -e '.spec.destination.namespace' ${app_file})
    local values_file=${app_file%.yaml}-values.yaml

    helm template ${release} ${chart} \
      --version ${chart_version} --repo ${repo} \
      --include-crds \
      --namespace ${namespace} --values ${values_file}
}

main "${@}"
