```
timedatectl set-ntp true
```
```
cfdisk
```
```
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3
```
```
mkswap /dev/sda4
swapon /dev/sda4
```
```
mount /dev/sda2 /mnt
mkdir /mnt/home
mount /dev/sda3 /mnt/home
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot # /dev/sda1 -> EFI partition
```
```
pacstrap /mnt base base-devel linux linux-firmware
```
```
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
```
```
arch-chroot /mnt
```
# Time Zone
```
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc
```
# Install NeoVim
```
pacman -S neovim
```
#
```
nvim /etc/locale.gen
# Uncomment
# en_US.UTF-8 UTF-8
# es_ES.UTF-8 UTF-8
locale-gen
```
```
echo "LANG=es_ES.UTF-8" > /etc/locale.conf
echo "KEYMAP=es" > /etc/vconsole.conf
```
```
echo "arch" > /etc/hostname
```
```
nvim /etc/hosts
# ADD
# 127.0.0.1     localhost
# ::1           localhost
# 127.0.1.1     arch.localhost arch
```
# ROOT PASSWORD
```
psswd
```
# Install NetworkManager Sudo
```
pacman -S networkmanager sudo
systemctl enable NetworkManager
```
# Install GRUB
```
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
```
# Add User
```
useradd -m username
```
# Password New User
```
passwd username
```
```
usermod -aG wheel,storage,audio,video username
nvim /etc/sudoers
# Uncomment
# Line 82
```
```
exit
umount -R /mnt
shutdown now
```

# Install YAY
```
cd /opt
su
pacman -S git
git clone https://aur.archlinux.org/yay-git.git
chown -R username:username yay-git/
exit
cd yay-git
makepkg -is
```
# Install Xorg
```
sudo pacman -S xorg xorg-xinit
```

# Install LightDM
```
yay -S lightdm-gtk-greeter
su
systemctl enable lightdm.service
exit
systemctl enable lightdm.service
```

# Install Qtile
```
sudo pacman -S qtile xterm
```
# Install
```
sudo pacman -S zsh lsd bat firejail flameshot unzip xf86-video-fbdev xclip thunar
```
```
sudo usermod -s /usr/bin/zsh username
sudo usermod -s /usr/bin/zsh root
```
```
sudo pacman -S kitty rofi
```
# Audio Drivers
```
sudo pacman -S pulseaudio pulseaudio-alsa
sudo pacman -S alsa-utils gst-plugins-base gst-plugins-base-libs
sudo pacman -S pavucontrol
```

# Wallpaper
```
sudo pacman -S feh
```
