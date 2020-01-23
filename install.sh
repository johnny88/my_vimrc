#!/bin/bash
if [[ "$EUID" -ne 0 ]]
  then echo "Please run as root"
  exit
fi
shopt -s extglob

# Update and upgrade base app
apt update &>/dev/null 
apt upgrade -y &>/dev/null 

# Install newest vim
vers="$(vim --version)"
if [[ $vers == *"VIM - Vi IMproved 8.0"* ]]; then
  echo "Vim out of date, updating vim"
  echo "Adding ppa"
  add-apt-repository -y ppa:jonathonf/vim &>/dev/null
  echo "Updating apt"
  apt update &>/dev/null 
  echo "Upgrading apt"
  apt upgrade -y &>/dev/null 
fi

# Install zsh
if [[ ! -x "$(command -v zsh)" ]]; then
  echo "Zsh not not found, installing zsh"
  echo "Installing zsh"
  apt install zsh -y &>/dev/null
  
  echo "Linking zshrc"
  ln -s $PWD/zshrc ${HOME}/.zshrc &>/dev/null

  echo "Switching default shell to zsh"
  command -v zsh | sudo tee -a /etc/shells &>/dev/null
  chsh -s "$(command -v zsh)" "${SUDO_USER}" &>/dev/null
else
  echo "Zsh already installed... skipping"
fi

# Install nodejs
if [[ ! -x "$(command -v npm)" ]]; then
  echo "Node not not found, installing node"
  echo "Running node install script"
  curl -sL https://deb.nodesource.com/setup_12.x | bash - &>/dev/null
  echo "Installing node"
  apt install nodejs -y &>/dev/null
else
  echo "Node already installed... skipping"
fi

# Change git commits to vim
git config --global core.editor "vim"

if [[ ! -f ${HOME}/.tmux.conf ]]; then
  echo "Linking tmux file"
  ln -s $PWD/tmux.conf ${HOME}/.tmux.conf &>/dev/null
else
  echo "Tmux file already linked... skipping"
fi

# Install tpm
if [[ ! -d ${HOME}/.tmux/plugins/tpm ]]; then
  echo "Tpm not found, installing tpm"
  echo "Installing dependencies"
  apt install wl-clipboard
  echo "Cloning tpm repo"
  git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm &>/dev/null
  echo "Installing plugins"
  ${HOME}/.tmux/plugins/tpm/bin/install_plugins &>/dev/null
else
  echo "Tpm already installed... skipping"
fi

# Install vim plug
if [[ ! -f ${HOME}/.vim/autoload/plug.vim ]]; then
  echo "Vim plug not found, installing vim plug"
  echo "Installing dependencies"
  apt install python3-pip
  pip3 install --user pynvim
  echo "Downloading vim plug"
  curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &>/dev/null
  if [[ ! -f ${HOME}/.vimrc ]]; then
    echo "Linking the vimrc"
    ln -s $PWD/vimrc ${HOME}/.vimrc &>/dev/null
  fi
  echo "Installing vim plugins"
  vim +'PlugInstall --sync' +qa &>/dev/null
else
  echo "Vim plug already installed... skipping"
fi

# Install docker
if [[ ! -x "$(command -v docker)" ]]; then
  echo "Docker not found, installing docker"
  echo "Running docker install script"
  wget -qO- https://get.docker.com/ | sh &>/dev/null
  
  # Add the docker group if it doesn't already exist:
  echo "Adding the docker group"
  groupadd docker &>/dev/null

  # Add the connected user "${USER}" to the docker group. Change the user name to match your preferred user:
  echo "Adding the current user to the docker group"
  gpasswd -a $SUDO_USER docker &>/dev/null

  # Restart the Docker daemon:
  echo "Restarting docker"
  service docker restart &>/dev/null
else
  echo "Docker already installed... skipping"
fi

if [[ ! -x "$(command -v docker-compose)" ]]; then
  echo "Docker compose not found, installing docker compose"

  # Install docker compose
  echo "Installing docker compose"
  bash -c 'curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose' &>/dev/null
  chmod +x /usr/local/bin/docker-compose &>/dev/null
else
  echo "Docker-compose already installed... skipping"
fi

#install yarn
if [[ ! -x "$(command -v yarn)" ]]; then
  echo "Yarn not found, installing yarn"
  echo "Adding yarn pub key and apt"
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &>/dev/null
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
  echo "Updating apt"
  apt update  &>/dev/null
  echo "Installing yarn"
  apt-get install yarn -y &>/dev/null
else
  echo "Yarn already installed... skipping"
fi

echo Setting owner to $SUDO_USER
chown -R $SUDO_USER:$SUDO_USER $HOME/*
chown -R $SUDO_USER:$SUDO_USER $HOME/.*

echo "Done!"
