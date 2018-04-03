FROM ubuntu

RUN apt update && apt install curl git apt-transport-https zsh nodejs curl vim vim-gnome build-essential cmake python-dev python3-dev tmux silversearcher-ag wget -y

RUN wget -qO- https://get.docker.com/ | sh
RUN bash -c 'curl -L "https://github.com/docker/compose/releases/download/1.19.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose'
RUN chmod +x /usr/local/bin/docker-compose

# Change git commits to vim
RUN git config --global core.editor "vim"

#change default shell
RUN chsh -s $(which zsh)
#install oh my zsh
RUN wget -qO- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

ADD vimrc /root/.vimrc
ADD tmux.conf /root/.tmux.conf

WORKDIR /root

CMD ["zsh"]
