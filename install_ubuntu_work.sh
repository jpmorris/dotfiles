# TO RUN:
# download from github and run on newly installed manjaro machine

sudo apt-get update
sudo apt-get -y install git neovim i3

# vim
sudo apt-get -y install python3-pip
sudo apt-get -y install python-pip
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
ln -s ~/dotfiles/linuxfiles/home/jmorris/config/i3/config.work ~/.config/i3/config



