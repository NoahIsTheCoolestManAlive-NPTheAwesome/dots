[[ -d $HOME/bin ]] && export PATH=$PATH:$HOME/bin
[ -z "$PS1" ] && return

function __prompt_command() {
    local EXIT="$?"
    PS1=""

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'

    if [ $EXIT != 0 ]; then
        PS1+=" ${Red}$EXIT "
    fi

    PS1+=" ${BBlu}\u${RCol}  \W  "
}

export PROMPT_COMMAND=__prompt_command

alias rm='rm -iv'
alias l='ls -lh --color=always --group-directories-first --sort=size | coloredls'
alias ls='ls -h --color=auto'
alias v='vim'
alias sv='sudo vim'
alias gv='gvim'
alias sgv='sudo gvim'
alias m='mutt'
alias z='zathura'
alias pacman='sudo pacman --color always'
alias pac='pacman --color always'
alias pacs='sudo pacman -S'
alias pacss='pacman -Ss'
alias pacsi='pacman -Si'
alias pacssi='pacman -Ssi'
alias pacqs='pacman -Qs'
alias pacqi='pacman -Qi'
alias pacqsi='pacman -Qsi'
alias pacqssi='pacman -Qssi'
alias pacr='sudo pacman -Rscudn'
alias cower='cower -c --target=/home/luke/aur'
alias upmirrors='sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup; sudo reflector -l 5 --sort rate --save /etc/pacman.d/mirrorlist'
alias upterm='xrdb $HOME/.Xresources'
alias awrc='$EDITOR $HOME/.config/awesome/rc.lua'
alias awtheme='$EDITOR $HOME/.config/awesome/themes/copland/theme.lua'
alias awdir='cd $HOME/.config/awesome'
alias tmux='tmux -2uv'
alias usb='sudo mount -t vfat /dev/sdb /mnt/usb; cd /mnt/usb'
alias usb1='sudo mount -t vfat /dev/sdb1 /mnt/usb; cd /mnt/usb'
alias sudousb='sudo mount -o umask=0,uid=nobody,gid=nobody -t vfat /dev/sdc/ /mnt/usb; cd /mnt/usb'
alias sudousb1='sudo mount -o umask=0,uid=nobody,gid=nobody -t vfat /dev/sdb1/ /mnt/usb; cd /mnt/usb'
alias cdrom='sudo mount -t iso9660 -o ro /dev/cdrom /mnt/cdrom; cd /mnt/cdrom'
alias storage='sudo ntfs-3g /dev/sda3 /mnt/storage; cd /mnt/storage'
alias win='sudo ntfs-3g /dev/sda2 /mnt/win; cd /mnt/win/Users/Luke/Desktop'
alias showtrash='cd ~/.local/share/Trash; ranger'
alias emptytrash='sudo rm -r ~/.local/share/Trash; mkdir ~/.local/share/Trash'
alias ve='vim -u ~/.vimencrypt -x'
alias reboot='sudo reboot'
alias findname='sudo find / -name'
alias clearcache='echo "sync; echo 3 > /proc/sys/vm/drop_caches"'
alias homepage='cd $HOME/.homepage; rm *; homepage; cd'
alias mpvw="mpv --aspect=16:9"
alias pipupdate="pip-review --auto"
alias synctime="sudo ntpd -s"
alias commands='more $HOME/.bashrc | grep alias* | cut -d" " -f2- -s'

complete -cf sudo
complete -cf man

set -o posix

export EDITOR="vim"
export LANG="it_IT.UTF-8"
export LC_CTYPE="it_IT.UTF-8"

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=$PATH:$JAVA_HOME/bin

eval $(dircolors -b $HOME/.config/dir_colours)
