# Install curl and vim
sudo apt install curl vim -y

# Set up me some VUNDLE!!! and other vim/vim plugin dependancies
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo apt install build-essential cmake -y
sudo apt install python-dev python3-dev -y
~/.vim/bundle/youcompleteme/install.py --all

# Link vimrc and install plugins
rm ~/.vimrc
ln -s $PWD/vimrc ~/.vimrc
vim +PluginInstall +qall

# Installs tmux and links conf
sudo apt install tmux -y
ln -s $PWD/tmux.conf ~/.tmux.conf

#install docker and docker compose
wget -qO- https://get.docker.com/ | sh
sudo bash -c 'curl -L "https://github.com/docker/compose/releases/download/1.11.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose'
sudo chmod +x /usr/local/bin/docker-compose
#Add the docker group if it doesn't already exist:
sudo groupadd docker
#Add the connected user "${USER}" to the docker group. Change the user name to match your preferred user:
sudo gpasswd -a ${USER} docker
#Restart the Docker daemon:
sudo service docker restart

# Make sure git is installed
sudo apt install git -y
# Change git commits to vim
git config --global core.editor "vim"

#install node
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

#install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn -y

#install zsh
sudo apt install zsh -y
#change default shell
chsh -s $(which zsh)
#install oh my zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

