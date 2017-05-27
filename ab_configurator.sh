#/bin/bash
cd ~/
	#LOGGING PURPOSES
#set x
#exec 3>&1 4>&2
#trap 'exec 2>&4 1>&3' 0 1 2 3
#exec 1>configurator.log 2>&1
#set -x

	#Removing (replacing) mirrorlist, as it's nicer not to have scattered files with the script
sudo rm /etc/pacman.d/mirrorlist
sudo touch /etc/pacman.d/mirrorlist
sleep 3

	#Placing new worldwide mirrors into the mirrorlist
echo "##		Worldwide		##"					>> /etc/pacman.d/mirrorlist
echo "Server	=	https://archlinux.surlyjake.com/archlinux/\$repo/os/\$arch"	>> /etc/pacman.d/mirrorlist
echo "Server	=	http://mirrors.evowise.com/archlinux/\$repo/os/\$arch"		>> /etc/pacman.d/mirrorlist
echo "Server	=	http://mirror.rackspace.com/archlinux/\$repo/os/\$arch"		>> /etc/pacman.d/mirrorlist
sleep 3

	#Init pacman keys
sudo pacman-key --init
sudo pacman-key --populate archlinux
sleep 3

	#Hope you're ready to update that system, buddy
	#Also adding in base-devel and binutils
	#...along with git, vim, and tcsh, for personal preference.
sudo pacman -Syyu git vim tcsh base-devel binutils
sleep 3

	#After all that, we'll load up Pacaur.
	#This uses someone else's script.
wget https://gist.github.com/ecronogist/1c6ba7ff10c0bf286d4de076a1d648df/raw/a552b5d8683279dac2ea2ebda2b3808f9c40693b/pacaurinstall.sh
$TERMINAL sh pacaurinstall.sh
sleep 3

	#Bring in my vimrc
rm ~/.vimrc && cd ~/ && wget https://gist.github.com/ecronogist/5f5902c7e1b56f2def2aacd01e043b95/raw/40bc07e3fc88cb28af3489a558924a906b8e9e1e/.vimrc
sleep 3

	#Should be good to go, now!
	#Will add more copying of dotfiles later.

	#Ask for log deletion.
#read -r -p "Delete log? [Y/n] " yeahnope
#sleep 3

	#Condensed to one line for laziness purposes, plus I like it better this way even if it lacks readability.
#case "$yeahnope" in [yY][eE]sS]|[yY])rm configurator.log;;*)mkdir /tmp/tmplogs && mv configurator.log /tmp/tmplogs;;esac

	#I should probably use read here but I'm too tired to fix
echo "Press any key to exit."

	#Read null value, then close term
read -p "							:~]" borp
exit
