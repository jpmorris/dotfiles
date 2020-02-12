# TO RUN:
# download install_manjaro.sh from github and run on newly installed manjaro machine

# for surface go



sudo pacman --noconfirm -S yay

yay --noconfirm -Syyu

yay --noconfirm -S google-chrome arandr neovim vlc numlockx thunderbird freerdp remmina xfce4-notes-plugin teamviewer meld polychromatic openrazer-meta redshift firefox spotify flameshot xclip veracrypt synology-cloud-station-drive slack-desktop anydesk skypeforlinux zoom python-notify2 powertop

# specilized kernel
yay -S linux-firmware-surface-go


# touchpad
#yay --noconfirm -S xf86-input-libinput

# polybar
yay --noconfirm -S polybar siji nitrogen rofi weather-icons


# vim
yay --noconfirm -S python-pip
yay --noconfirm -S python2-pip
sudo pip install neovim
sudo pip2 install neovim

# audio
#ln -s ~/commonDrive/dotfiles/linuxfiles/etc/systemd/system/resume\@jmorris.service /etc/systemd/system/resume\@jmorris.service
#ln -s ~/commonDrive/dotfiles/linuxfiles/etc/systemd/system/suspend\@jmorris.service /etc/systemd/system/suspend\@jmorris.service
#yay --noconfirm -S pavucontrol

# bluetooth
yay --noconfirm -S bluez-utils blueman pluseaudio-bluetooth

# power
yay --noconfirm -S gnome-power-statistics

# dotfiles
yay -S --noconfirm dislocker-git
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
git clone https://github.com/jpmorris/dotfiles.git
sudo cp dotfiles/linuxfiles/etc/fstab.ein /etc/fstab
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
mkdir ~/.config/polybar
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/config/polybar/config-edward ~/.config/polybar/config
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/config/polybar/openweathermap-simple-silverspring.sh ~/.config/polybar/
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/config/polybar/popup-calendar.sh ~/.config/polybar/
mkdir -p ~/.config/i3
ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/config/i3/config.edward ~/.config/i3/config
sudo ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/config/i3/bright /usr/bin/
sudo chmod +x /usrkk/bin/bright
ln -s ~/.vimrc ~/.config/nvim/init.vim

mkdir -p ~/.vimtmp/backup
mkdir -p ~/.vimtmp/swap
mkdir -p ~/.vimtmp/undo

sudo ln -s ~/commonDrive/dotfiles/linuxfiles/usr/bin/myredshift /usr/bin/myredshift


