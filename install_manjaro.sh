# TO RUN:
# download install_manjaro.sh from github and run on newly installed manjaro machine
echo "what is the bitlocker recovery password?"
read bitlockerkey

sudo pacman -S yay

yay -Syyuu

yay -S google-chrome arandr neovim vlc numlockx thunderbird freerdp remmina xfce4-notes-plugin teamviewer meld polychromatic openrazer-meta redshift firefox spotify flameshot xclip veracrypt synology-cloud-station-drive slack-desktop anydesk

# polybar
yay -S polybar siji nitrogen rofi weather-icons

# optional
yay -S virtualbox 

# 

# dotfiles
yay -S --noconfirm dislocker-git
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
git clone https://github.com/jpmorris/dotfiles.git 
sudo cp dotfiles/linuxfiles/etc/fstab.edward /etc/fstab
sudo sed -i "s/PASSWORDGOESHERE/$bitlockerkey/g" /etc/fstab
sudo mkdir -p /mnt/dislocker
sudo mkdir -p /mnt/commonDrive
sudo mount /mnt/dislocker
sudo mount /mnt/commonDrive

ln -s /mnt/commonDrive ~/commonDrive
rm -rf ~/commonDrive/dotfiles
mv ~/dotfiles ~/commonDrive

ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/bashrc ~/.bashrc
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/extend.bashrc ~/.extend.bashrc
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/vimrc ~/.vimrc
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/vim ~/.vim
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/ideavimrc ~/.ideavimrc
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/ideavimrc ~/.ideavimrc
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

mkdir -p ~/.vimtmp/backup
mkdir -p ~/.vimtmp/swap
mkdir -p ~/.vimtmp/undo
