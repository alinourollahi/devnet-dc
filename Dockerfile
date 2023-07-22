FROM debian:latest
RUN apt update
RUN apt install git -y
RUN apt install wget -y
RUN apt install python3 -y
RUN apt install python3-pip -y
RUN apt install curl -y
RUN apt install iproute2 -y
RUN apt install ansible -y
RUN apt install vim -y
RUN apt install python3-paramiko -y

RUN mkdir /root/devnet

# Uses "git", "ssh-agent" and "history-substring-search" bundled plugins
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
    -p git -p ssh-agent -p 'history-substring-search' \
    -a 'bindkey "\$terminfo[kcuu1]" history-substring-search-up' \
    -a 'bindkey "\$terminfo[kcud1]" history-substring-search-down'

RUN zsh
RUN chsh -s /usr/bin/zsh
