sudo apt-get install gnome-terminal -y
sudo cp ./gnome-terminal.desktop /usr/share/applications/gnome-terminal.desktop
gsettings set org.gnome.desktop.default-applications.terminal exec gnome-terminal
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:philip.scott/elementary-tweaks
sudo add-apt-repository ppa:cybre/elementaryplus
sudo add-apt-repository ppa:webupd8team/indicator-kdeconnect
sudo apt update && sudo apt upgrade
sudo apt install elementary-tweaks elementaryplus kdeconnect indicator-kdeconnect -y
sudo apt install tlp -y

