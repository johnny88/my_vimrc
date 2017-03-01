# some usefull bash things
sudo apt install gimp gimp-plugin-registry

# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get install spotify-client

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
