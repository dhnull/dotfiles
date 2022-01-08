#!/bin/bash

# Colors
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
cyan="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

mkdir ~/Environment
cd ~/Environment
# BSPWM - SXHKD
apt remove --purge xboard libreoffice* codium -y
apt install bspwm sxhkd -y
cp -r ~/dotfiles/sxhkd ~/.config/
º
cp -r ~/dotfiles/bspwm ~/.config/
#Alacritty dependencies
apt cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y
apt remove --purge rustc -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
git clone https://github.com/jwilm/alacritty
cd alacritty
cargo build --release && cp target/release/alacritty /usr/local/bin
cd ..
# Rofi - thunar - flameshot - feh - scrub - firejail - ranger
apt install rofi thunar flameshot feh scrub firejail ranger -y
# Picom
cp -r ~/dotfiles/picom ~/.config/
apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev -y
git clone https://github.com/ibhagwan/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ..
# Polybar
apt install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev -y
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install
cd ../..
# lsd - bat
wget "https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_amd64.deb"
dpkg -i lsd*
wget "https://github.com/sharkdp/bat/releases/download/v0.19.0/bat_0.19.0_amd64.deb"
dpkg -i bat*
# fonts
#firacode
wget "https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip"
mv Fira* /usr/local/share/fonts
unzip /usr/local/share/fonts/Fira*
# saucecode
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip"
mv Source* /usr/local/share/fonts
unzip /usr/local/share/fonts/S*
# zsh
usermod -s /usr/bin/zsh neeffex
usermod -s /usr/bin/zsh root
rm ~/.zshrc
cp ~/dotfiles/zshrc ~/.zshrc

