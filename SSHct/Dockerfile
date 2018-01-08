FROM debian:9

VOLUME /home
EXPOSE 22
ENTRYPOINT ["/bin/entrypoint"]

ENV CTUSER me
ENV CTUSERID 1000
ENV CTUSERPWD 123qweASD
ENV CTTIMEZONE Asia/Novosibirsk
ENV CTLOCALE ru_RU.UTF-8
ENV PUBKEY none

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    openssh-server bash tmux curl sudo less vim \
    dialog locales man bash-completion wget apt-file telnet \
    dnsutils git pwgen python bc golang

ADD sshd_config /etc/ssh/sshd_config
ADD entrypoint.sh /bin/entrypoint
RUN chmod +x /bin/entrypoint

RUN mkdir /var/run/sshd
RUN echo '%sudo   ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
 
