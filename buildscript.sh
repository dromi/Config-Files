# the following script is intended to be used for linux mint

#install essentials
sudo aptitude install zsh -y
sudo aptitude install emacs -y
sudo aptitude install git -y
sudo aptitude install sublime-text -y
sudo aptitude install steam -y
sudo aptitude install chromium-browser -y
sudo aptitude install deluge -y
sudo aptitude install htop -y

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
sudo apt-get install spotify-client -y

# Install f lux
sudo add-apt-repository ppa:kilian/f.lux
sudo apt-get update
sudo apt-get install fluxgui

sudo apt-get update
sudo apt-get upgrade