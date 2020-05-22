# TO RUN:
# download install_manjaro.sh from github and run on newly installed manjaro machine

# for surface go

cd ~
sudo pacman --noconfirm -S yay

yay --noconfirm -Syyu

echo '-----------------INSTALLING PACKAGES----------------------------'
yay --noconfirm -S google-chrome arandr neovim vlc numlockx thunderbird freerdp remmina \
xfce4-notes-plugin teamviewer meld redshift firefox spotify \
flameshot xclip veracrypt synology-cloud-station-drive slack-desktop anydesk skypeforlinux \
zoom powertop solaar xidlehook rofi terminator pavucontrol

# dotfiles
echo '-----------------INSTALLING DOTFILES----------------------------'
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
git clone https://github.com/jpmorris/dotfiles.git
#sudo cp dotfiles/linuxfiles/etc/fstab.julia /etc/fstab

# vim
echo '-----------------INSTALLING VIM----------------------------'
yay --noconfirm -S python-pip
yay --noconfirm -S python2-pip
sudo pip install neovim
sudo pip2 install neovim
ln -s ~/dotfiles/linuxfiles/home/jmorris/vimrc ~/.vimrc
ln -s ~/dotfiles/linuxfiles/home/jmorris/vim ~/.vim
ln -s ~/dotfiles/linuxfiles/home/jmorris/ideavimrc ~/.ideavimrc
ln -s ~/dotfiles/linuxfiles/home/jmorris/vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
mkdir -p ~/.vimtmp/backup
mkdir -p ~/.vimtmp/swap
mkdir -p ~/.vimtmp/undo

#bash
echo '-----------------CONFIGURING BASH----------------------------'
rm -rf ~/.bashrc
ln -s ~/dotfiles/linuxfiles/home/jmorris/bashrc ~/.bashrc
ln -s ~/dotfiles/linuxfiles/home/jmorris/extend.bashrc ~/.extend.bashrc

#i3
echo '-----------------CONFIGURING i3----------------------------'
mkdir -p ~/.config/i3
ln -s ~/dotfiles/linuxfiles/home/jmorris/config/i3/config.julia ~/.config/i3/config


# redshift
echo '-----------------CONFIGURING REDSHIFT----------------------------'
sudo ln -s ~/dotfiles/linuxfiles/usr/bin/myredshift /usr/bin/myredshift

echo '-----------------CONFIGURING NITROGEN----------------------------'
# nitrogen (-background)
rm -rf ~/.config/nitrogen/*
ln -s ~/dotfiles/linuxfiles/home/jmorris/config/nitrogen/nitrogen.cfg ~/.config/nitrogen/
ln -s ~/dotfiles/linuxfiles/home/jmorris/config/nitrogen/bg-saved.cfg ~/.config/nitrogen/
ln -s ~/dotfiles/linuxfiles/home/jmorris/Pictures/brooklyn_bridge_at_night-wallpaper-7680x1440.jpg /home/jmorris/Pictures/

# screen layout
echo "~/dotfiles/linuxfiles/home/jmorris/screenlayout/default.sh" >> ~/.xprofile


