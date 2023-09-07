#
# MIGRATE ALL THIS TO ANSIBLE
#
# TO RUN:
# download from github and run on newly installed manjaro machine

# AFTER (not yet part of this script):
# disable graphical login on display :0 'sudo systemctl set-default multi-user'
#
#


sudo apt-get update
sudo apt-get -y install git i3 zim terminator rofi xfce4-notes clipit awscli python3-venv docker-compose

# vim
sudo apt-get -y install neovim
sudo apt-get -y install python3-pip
sudo pip install neovim
sudo pip2 install neovim


# bash
mv ~/.bashrc ~/.bashrc.old
ln -s ~/dotfiles/linuxfiles/home/jmorris/bashrc.ubuntu ~/.bashrc
ln -s ~/dotfiles/linuxfiles/home/jmorris/extend.bashrc ~/.extend.bashrc

# vim
ln -s ~/dotfiles/linuxfiles/home/jmorris/vimrc ~/.vimrc
ln -s ~/dotfiles/linuxfiles/home/jmorris/vim/ ~/.vim
ln -s ~/dotfiles/linuxfiles/home/jmorris/ideavimrc ~/.ideavimrc
ln -s ~/dotfiles/linuxfiles/home/jmorris/vim/ ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
mkdir -p ~/.vimtmp/backup
mkdir -p ~/.vimtmp/swap
mkdir -p ~/.vimtmp/undo

# i3
mkdir -p ~/.config/i3
rm -rf ~/.config/i3/config
ln -s ~/dotfiles/linuxfiles/home/jmorris/config/i3/config.work ~/.config/i3/config


# proxy

echo 'export http_proxy=http://preproxy.uscis.dhs.gov:80' >> /etc/environment
echo 'export https_proxy=$http_proxy' >> /etc/environment
echo 'export HTTP_PROXY=$http_proxy' >> /etc/environment
echo 'export HTTPS_PROXY=$http_proxy' >> /etc/enviroment

echo 'export http_proxy=http://preproxy.uscis.dhs.gov:80' >> ~/.bashrc
echo 'export https_proxy=$http_proxy' >> ~/.bashrc
echo 'export HTTP_PROXY=$http_proxy' >>  ~/.bashrc
echo 'export HTTPS_PROXY=$http_proxy' >>  ~/.bashrc
