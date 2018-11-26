#!/bin/sh

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Install some useful software
apt-get update -y && apt-get upgrade -y
apt-get install -my guake terminator neovim emacs zsh i3lock ntpdate gparted exfat-fuse exfat-utils neofetch lxshortcut

# Setup a cron job to set the time on startup
(crontab -l 2>/dev/null; echo "@reboot ntpdate uk.pool.ntp.org") | crontab -

# Install the Hermit font for terminal use
mkdir /tmp/deleteme && cd /tmp/deleteme
wget -P /tmp/deleteme https://pcaro.es/d/otf-hermit-1.21.tar.gz
tar -xvf /tmp/deleteme/otf-hermit-1.21.tar.gz
cp Hermit-bold.otf /usr/share/fonts/truetype/
cp Hermit-light.otf /usr/share/fonts/truetype/
cp Hermit-medium.otf /usr/share/fonts/truetype/
cd ~ && rm -rf /tmp/deleteme

# Install some software addons
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
curl -sLf https://spacevim.org/install.sh | bash
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
git clone https://github.com/babbysross/configs ~/Projects/configs && cd ~/Projects/configs
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Add some aliases to the .zshrc file, as well as a source for zsh-syntax-highlighting
echo "alias zshconfig='nano ~/.zshrc'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias ohmyzsh='nano ~/.oh-my-zsh'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias x='startx'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias lock='i3lock -i ~/Pictures/Stars-at-night.png'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias checktemp='opt/vc/bin/vcgencmd measure_temp'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias ntp='sudo ntpdate uk.pool.ntp.org'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "alias vim='vi'" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Move image to correct directory and set as background
cp ~/Projects/configs/wallpapers/PiBackgroundITER.png /usr/share/rpd-wallpaper/
sed -i 's/cliff.jpg/PiBackgroundITER.png/g' ~/.config/pcmanfm/LXDE-pi/desktop-items-0.conf

# Place some premade files where they need to be
cp ~/Projects/configs/wallpapers/Stars-at-night.png ~/Pictures
cp ~/Projects/configs/terminator/config ~/.config/terminator/config
cp ~/Projects/configs/lxde/panel ~/.config/lxpanel/LXDE-pi/panels/panel
cp ~/Projects/configs/boot/config.txt /boot/config.txt
