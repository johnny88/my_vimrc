# install curl 
sudo apt update && sudo apt install curl apt-transport-https -y

#install node
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -

# Install curl and vim
sudo apt update && sudo apt install zsh nodejs curl vim vim-gnome build-essential cmake python-dev python3-dev tmux silversearcher-ag sublime-text spotify-client -y

# Link vimrc and install plugins
rm ~/.vimrc
ln -s $PWD/vimrc ~/.vimrc

# Installs tmux and links conf
ln -s $PWD/tmux.conf ~/.tmux.conf

#install docker and docker compose
wget -qO- https://get.docker.com/ | sh
sudo bash -c 'curl -L "https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose'
sudo chmod +x /usr/local/bin/docker-compose
#Add the docker group if it doesn't already exist:
sudo groupadd docker
#Add the connected user "${USER}" to the docker group. Change the user name to match your preferred user:
sudo gpasswd -a ${USER} docker
#Restart the Docker daemon:
sudo service docker restart

# Change git commits to vim
git config --global core.editor "vim"

#install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn -y

#change default shell
chsh -s $(which zsh)
#install oh my zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Add docker zsh completion
mkdir -p ~/.zsh/completion
curl -L https://raw.githubusercontent.com/docker/compose/1.19.0/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose

