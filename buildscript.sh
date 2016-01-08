# the following script is intended to be used for linux mint

#install essentials
sudo aptitude install zsh
sudo aptitude install emacs
sudo aptitude install git
sudo aptitude install sublime-text
sudo aptitude install steam
sudo aptitude install chromium-browser
sudo aptitude install deluge
sudo aptitude install htop

# create git repos folder
mkdir ~/repos

#clone personal config files
cd ~/repos
git clone https://github.com/dromi/Config-Files.git

#setup zsh with oh-my-zsh

chsh -s /bin/zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp ~/repos/Config-Files/zsh/.zshrc ~/

# bind caps lock to ctrl
# sign into firefox
# use AMD proprietary driver

# Cinnamon related
# remove workspace switcher sound

# Install Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
sudo apt-get update
sudo apt-get install spotify-client

sudo apt-get update
sudo apt-get upgrade