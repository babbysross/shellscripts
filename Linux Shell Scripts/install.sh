#!/bin/sh

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

apt-get update -y && apt-get upgrade -y
apt-get -my install steam guake terminator neovim blender kdenlive powertop stacer gimp darktable emacs zsh i3 i3-wm i3status i3lock ntpdate wine winetricks inkscape krita qbittorrent qjackctl gparted bleachbit exfat-fuse exfat-utils neofetch
mkdir /tmp/deleteme && cd /tmp/deleteme
wget -P /tmp/deleteme https://pcaro.es/d/otf-hermit-1.21.tar.gz
tar -xvf /tmp/deleteme/otf-hermit-1.21.tar.gz 
cp Hermit-bold.otf /usr/share/fonts/truetype/
cp Hermit-light.otf /usr/share/fonts/truetype/
cp Hermit-medium.otf /usr/share/fonts/truetype/
cd ~ && rm -rf /tmp/deleteme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install spotify-client
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "alias zshconfig='nano ~/.zshrc'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias ohmyzsh='nano ~/.oh-my-zsh'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias x='startx'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias lock='i3lock -i ~/Pictures/Stars-at-night.png'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias checktemp='opt/vc/bin/vcgencmd measure_temp'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias ntp='sudo ntpdate uk.pool.ntp.org'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias vim='vi'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
git clone https://github.com/meetfranz/franz/releases/download/v5.0.0-beta.18/franz_5.0.0-beta.18_amd64.deb
dpkg -i franz_5.0.0-beta.18_amd64.deb
cp ~/Projects/configs/wallpapers/Stars-at-night.png ~/Pictures

