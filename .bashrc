[[ $- != *i* ]] && return
[[ -d $HOME/bin ]] && export PATH=$PATH:$HOME/bin
[[ -d /usr/bin/vendor_perl ]] && export PATH=$PATH:/usr/bin/vendor_perl
[ -n "$WINDOWID" ] && transset-df -i $WINDOWID >/dev/null
[ -z "$PS1" ] && return

_PROMPT() {
  _EXIT_STATUS=$?
  [ $_EXIT_STATUS != 0 ] && _EXIT_STATUS_STR="\[\033[1;30m\][\[\033[1;31m\]$_EXIT_STATUS\[\033[1;30m\]] "
  PS1="\033[1;30m\]» \[\e[0;0m\]\u\033[1;30m\] $_EXIT_STATUS_STR\[\033[1;30m\][\[\033[0m\]\W\[\033[1;30m\]]\[\033[1;30m\]:\[\033[0m\] "
  unset _EXIT_STATUS_STR
}
                
PROMPT_COMMAND=_PROMPT

alias cower='cower -v --color=always -t /home/luke/aur'
alias rm='rm -iv'
alias l='ls -l | coloredls'
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
alias upmirrors='sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup; sudo reflector -l 5 --sort rate --save /etc/pacman.d/mirrorlist'
alias upterm='xrdb $HOME/.Xresources'
alias awrc='$EDITOR $HOME/.config/awesome/rc.lua'
alias awtheme='$EDITOR $HOME/.config/awesome/themes/copland/theme.lua'
alias awdir='cd $HOME/.config/awesome'
alias tmux='tmux -2uv'
alias usb='sudo mount -t vfat /dev/sdc /mnt/usb; cd /mnt/usb'
alias usb1='sudo mount -t vfat /dev/sdb /mnt/usb; cd /mnt/usb'
alias usb2='sudo mount -t vfat /dev/sdb1 /mnt/usb; cd /mnt/usb'
alias sudousb='sudo mount -o umask=0,uid=nobody,gid=nobody -t vfat /dev/sdc/ /mnt/usb; cd /mnt/usb'
alias sudousb1='sudo mount -o umask=0,uid=nobody,gid=nobody -t vfat /dev/sdb1/ /mnt/usb; cd /mnt/usb'
alias cdrom='sudo mount -t iso9660 -o ro /dev/cdrom /mnt/cdrom; cd /mnt/cdrom'
alias storage='sudo ntfs-3g /dev/sda4 /mnt/storage; cd /mnt/storage'
alias win='sudo ntfs-3g /dev/sda2 /mnt/win; cd /mnt/win/Users/luke/Desktop'
alias clean='find $HOME -name "\!*~*" -exec trash {} +; find $HOME -name "*.log" -exec trash {} +; find $HOME -name "*.class" -exec trash {} +; find $HOME -name ".*.swp" -exec trash {} +'
alias showtrash='cd ~/.local/share/Trash; ranger'
alias emptytrash='sudo rm -r ~/.local/share/Trash; mkdir ~/.local/share/Trash'
alias ve='vim -u ~/.vimencrypt -x'
alias starthome='sudo netctl start wlp0s20u1-home'
alias rehome='sudo netctl stop-all; sleep 2; sudo netctl start wlp0s20u9-home'
alias reboot='sudo reboot'
alias findname='sudo find / -name'
alias clearcache='echo "sync; echo 3 > /proc/sys/vm/drop_caches"'
alias homepage='cd $HOME/.homepage; rm *; homepage; cd'
alias so="scrot ~/screenshots/tmp.png && imgurbash ~/screenshots/tmp.png; rm ~/screenshots/tmp.png"
alias mpvw="mpv --aspect=16:9"
alias commands='more $HOME/.bashrc | grep alias* | cut -d" " -f2- -s'

complete -cf sudo
complete -cf man

set -o posix

export EDITOR="vim"
export LANG=it_IT.UTF-8
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'
export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel' 
export JAVA_FONTS=/usr/share/fonts/TTF

eval $(dircolors -b $HOME/.config/dir_colours)
