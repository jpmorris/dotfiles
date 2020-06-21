# TO RUN:
# download install_manjaro.sh from github and run on newly installed manjaro machine

# for surface go

cd ~
sudo pacman-mirrors --fasttrack
sudo pacman --noconfirm -S yay

yay --noconfirm -Syyu

echo '-----------------INSTALLING COMMON PACKAGES----------------------------'
yay --noconfirm -S google-chrome arandr neovim vlc numlockx thunderbird freerdp remmina \
xfce4-notes-plugin teamviewer meld redshift firefox spotify \
flameshot xclip veracrypt synology-cloud-station-drive slack-desktop anydesk skypeforlinux \
zoom powertop solaar xidlehook rofi terminator pavucontrol

# dotfiles
echo '-----------------INSTALLING DOTFILES----------------------------'
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
git clone https://github.com/jpmorris/dotfiles.git

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

echo '-----------------CONFIGURING DEFAULT APPS----------------------------'
mv ~/.config/mimeapps.list ~/.config/mimeapps.list.old
ln -s ~/dotfiles/linuxfiles/home/jmorris/config/mimeapps.list ~/.config/
ln -s ~/dotfiles/linuxfiles/home/jmorris/local/share/applications/google-chrome-stable.desktop \
  ~/.local/share/applications/

#i3
echo '-----------------CONFIGURING COMMON i3----------------------------'
mkdir -p ~/.config/i3

#i3
echo '-----------------CONFIGURING LOCK AND SLEEP----------------------------'
sudo ln -s ~/dotfiles/linuxfiles/etc/systemd/system/resume\@jmorris.service /etc/systemd/system/
sudo ln -s ~/dotfiles/linuxfiles/etc/systemd/system/suspend\@jmorris.service /etc/systemd/system/


# redshift
sudo ln -s ~/dotfiles/linuxfiles/usr/bin/myredshift /usr/bin/myredshift


# SYSTEM SPECIFIC
if [ "$HOSTNAME" = ein ] || [ "$HOSTNAME" = edward] || [ "$HOSTNAME" = lin]; then
  echo '-----------------CONFIGURING BLUETOOTH----------------------------'
  yay -S pulseaudio-bluetooth
  # /etc/pulse/default.pa must be liked over; see respective system setup

fi


if [ "$HOSTNAME" = julia ]; then
  echo '-----------------CONFIGURING JULIA SPECIFIC----------------------------'
  # nitrogen (-background)
  rm -rf ~/.config/nitrogen/*
  ln -s ~/dotfiles/linuxfiles/home/jmorris/config/nitrogen/nitrogen.cfg ~/.config/nitrogen/
  ln -s ~/dotfiles/linuxfiles/home/jmorris/config/nitrogen/bg-saved.cfg ~/.config/nitrogen/
  ln -s ~/dotfiles/linuxfiles/home/jmorris/Pictures/brooklyn_bridge_at_night-wallpaper-7680x1440.jpg /home/jmorris/Pictures/
  # screen layout
  echo "~/dotfiles/linuxfiles/home/jmorris/screenlayout/default.sh" >> ~/.xprofile
  ln -s ~/dotfiles/linuxfiles/home/jmorris/config/i3/config.julia ~/.config/i3/config
fi

if [ "$HOSTNAME" = lin]; then
  echo '-----------------CONFIGURING LIN SPECIFIC----------------------------'
  ln -s ~/dotfiles/linuxfiles/home/jmorris/config/i3/config.lin ~/.config/i3/config
  mkdir ~/.config/i3status
  ln -s ~/dotfiles/linuxfiles/home/jmorris/config/i3status/config.lin ~/.config/i3status/config
  sudo ln -s ~/dotfiles/linuxfiles/etc/pulse/default.pa.lin /etc/pulse/default.pa
  # battery warning
  crontab -l > mycron
  echo "*/5 * * * * ~/dotfiles/linuxfiles/home/jmorris/scripts/low_batt_warn_and_hibernate.sh" >> mycron
  crontab mycron
  rm mycron

fi


if [ "$HOSTNAME" = ein]; then
  echo '-----------------CONFIGURING EIN SPECIFIC----------------------------'
  # fstab
  # TODO: these fstab files should be used as a reference or use APPENDS in case partioning changes
  #sudo cp dotfiles/linuxfiles/etc/fstab.ein /etc/fstab
  # polybar
  yay --noconfirm -S polybar siji nitrogen rofi weather-icons
  # specilized kernel
  yay -S linux-firmware-surface-go
  # bluetooth
  yay --noconfirm -S bluez-utils blueman pluseaudio-bluetooth
  # power
  yay --noconfirm -S gnome-power-statistics
  ln -s ~/dotfiles/linuxfiles/home/jmorris/config/i3/config.ein ~/.config/i3/config
fi

if [ "$HOSTNAME" = edward]; then
  echo "what is the bitlocker recovery password?"
  read bitlockerkey
  # touchpad
  yay --noconfirm -S xf86-input-libinput
  # optional
  yay --noconfirm -S virtualbox
  # video-nvidia
  sudo mhwd -i pci video-hybrid-intel-nvidia-430xx-bumblebee
  echo "~/commonDrive/dotfiles/linuxfiles/home/jmorris/screenlayout/default.sh" >> ~/.xprofile
  # audio
  ln -s ~/commonDrive/dotfiles/linuxfiles/etc/systemd/system/resume\@jmorris.service /etc/systemd/system/resume\@jmorris.service
  ln -s ~/commonDrive/dotfiles/linuxfiles/etc/systemd/system/suspend\@jmorris.service /etc/systemd/system/suspend\@jmorris.service
  yay --noconfirm -S pavucontrol
  # bluetooth
  yay --noconfirm -S bluez-utils blueman pluseaudio-bluetooth
  # power
  yay --noconfirm -S gnome-power-statistics
  # dislocker and mounts
  yay -S --noconfirm dislocker-git
  sudo sed -i "s/PASSWORDGOESHERE/$bitlockerkey/g" /etc/fstab
  sudo mkdir -p /mnt/dislocker
  sudo mkdir -p /mnt/commonDrive
  sudo mount /mnt/dislocker
  sudo mount /mnt/commonDrive
  # bright
  ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/config/i3/config.edward ~/.config/i3/config
  sudo ln -s ~/commonDrive/dotfiles/linuxfiles/home/jmorris/config/i3/bright /usr/bin/
  sudo chmod +x /usrkk/bin/bright
  ln -s ~/.vimrc ~/.config/nvim/init.vim
  # kernel parameter
  #sudo sed -e '/GRUB_CMDLINE_LINUX_DEFAULT/s/"$/ button.lid_init_state=open i915.edp_vswing=2"/' /etc/default/grub -i
  sudo sed -e '/GRUB_CMDLINE_LINUX_DEFAULT/s/"$/ button.lid_init_state=open i915.enable_rc6=0"/' /etc/default/grub -i
  sudo update-grub
fi

