# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fishy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux nyan)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl

# Added by Dromi
export EDITOR='/usr/bin/emacs -nw'

alias update='sudo pacman -Syuq --noconfirm;sudo pacman -Rns $(pacman -Qqtd) --noconfirm'

alias ls='ls --color=auto'

alias temacs='emacs -nw'

alias ffs='sudo'

# Define aliases for launching config-files
alias .emacs='emacs -nw ~/.emacs'
alias .zshrc='emacs -nw ~/.zshrc'
alias .Xdefaults='emacs -nw ~/.Xdefaults'
alias .i3='emacs -nw ~/.i3/config'
alias .i3status='emacs -nw ~/.i3/i3status.conf'

alias maple='echo "drop det"'

alias dikussh='ssh -XY dromi@ask.diku.dk'
alias dikussh_noX='ssh dromi@ask.diku.dk'

alias mm6='cd /home/dromi/.wine/drive_c/Program\ Files\ \(x86\)/Might\ and\ Magic\ VI; wine mm6.exe; cd'

alias connect_home='xrandr --output VGA1 --mode 1920x1080 --right-of LVDS1; feh --bg-scale /home/dromi/wallpapers/duck.jpg'

# Define aliases for filetypes
alias -s tex=emacs
alias -s cpp=emacs
alias -s h=emacs
alias -s pdf=evince
alias -s png=feh
alias -s jpg=feh
alias -s html=firefox
alias -s txt=less
alias -s sh=sh
alias -s doc=libreoffice
alias -s docx=libreoffice
alias -s mp4=mplayer
alias -s mkv=mplayer
alias -s py=python2

# Start X (if not already running)
[[ -z $DISPLAY && XDG_VTNR -eq 1 ]] && exec startx
