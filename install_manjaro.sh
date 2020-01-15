# TO RUN:
# download install_manjaro.sh from github and run on newly installed manjaro machine

# also manually:
# add 'button.lid_init_state=open' to /etc/default/grub and run update-grub

echo "what is the bitlocker recovery password?"
read bitlockerkey

sudo pacman -S yay

yay --noconfirm -Syyuu

yay --noconfirm -S google-chrome arandr neovim vlc numlockx thunderbird freerdp remmina xfce4-notes-plugin teamviewer meld polychromatic openrazer-meta redshift firefox spotify flameshot xclip veracrypt synology-cloud-station-drive slack-desktop anydesk

# polybar
yay --noconfirm -S polybar siji nitrogen rofi weather-icons

# optional
yay --noconfirm -S virtualbox

# video-nvidia
sudo mhwd -i pci video-hybrid-intel-nvidia-430xx-bumblebee
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/screenlayout/default.sh ~/.screenlayout/default.sh

# audio
ln -s ~/commonDrive/dotfiles/linuxfiles/etc/systemd/system/resume\@jmorris.service /etc/systemd/system/resume\@jmorris.service
ln -s ~/commonDrive/dotfiles/linuxfiles/etc/systemd/system/suspend\@jmorris.service /etc/systemd/system/suspend\@jmorris.service

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
mv ./dotfiles ~/commonDrive

rm -rf ~/.bashrc
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/bashrc ~/.bashrc
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/extend.bashrc ~/.extend.bashrc
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/vimrc ~/.vimrc
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/vim ~/.vim
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/ideavimrc ~/.ideavimrc
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

mkdir -p ~/.vimtmp/backup
mkdir -p ~/.vimtmp/swap
mkdir -p ~/.vimtmp/undo

sudo ln -s ~/commonDrive/dotfiles/linuxfiles/usr/bin/myredshift /usr/bin/myredshift

