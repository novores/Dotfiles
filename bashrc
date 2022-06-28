#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='sexy'

# Some themes can show whether `sudo` has a current token or not.
# Set `$THEME_CHECK_SUDO` to `true` to check every prompt:
THEME_CHECK_SUDO='true'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# (Advanced): Change this to the name of the main development branch if
# you renamed it or if it was changed for some reason
# export BASH_IT_DEVELOPMENT_BRANCH='master'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to the location of your work or project folders
#BASH_IT_PROJECT_PATHS="${HOME}/Projects:/Volumes/work/src"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true
# Set to actual location of gitstatus directory if installed
#export SCM_GIT_GITSTATUS_DIR="$HOME/gitstatus"
# per default gitstatus uses 2 times as many threads as CPU cores, you can change this here if you must
#export GITSTATUS_NUM_THREADS=8

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# If your theme use command duration, uncomment this to
# enable display of last command duration.
#export BASH_IT_COMMAND_DURATION=true
# You can choose the minimum time in seconds before
# command duration is displayed.
#export COMMAND_DURATION_MIN_SECONDS=1

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
# enable fzf tab-completion (edit this path)
# export FZF_DEFAULT_OPTS='
#   --color fg:#646a76
#   --color bg+:#7797b7,fg+:#2c2f30,hl:#D8DEE9,hl+:#26292a,gutter:#3a404c
#   --color pointer:#373d49,info:#606672
#   --border
#   --color border:#646a76'
#
# source ~/Git/fzf-tab-completion/bash/fzf-bash-completion.sh
# bind -x '"\t": fzf_bash_completion'

#env
export EDITOR='nvim'
export VISUAL='nvim'
export PATH="/home/novores/.local/bin:$PATH"

#aliases
alias wsh="wiki-search-html"
alias ws='wiki-search'
alias zshconf="nvim $HOME/.zshrc"
alias awconf="nvim $HOME/.config/awesome/rc.lua"
alias aw-themeconf="nvim $HOME/.config/awesome/themes/powerarrow-dark/theme.lua"
alias roficonf="nvim $HOME/.config/rofi/config.rasi"
alias urxvtconf="nvim $HOME/.Xresources"
alias picomconf="nvim $HOME/.config/picom/picom.conf"
alias nvimconf="nvim $HOME/.config/nvim/init.vim"
alias vifmconf="nvim $HOME/.config/vifm/vifmrc"
alias bspconf="nvim $HOME/.config/bspwm/bspwmrc"
alias sxconf="nvim $HOME/.config/sxhkd/sxhkdrc"
alias polyconf="nvim $HOME/.config/polybar/config.ini"
alias wws="wormhole-william send"
alias wwr="wormhole-william receive"
# alias pomo="bspc node --to-desktop ^6 --follow -t pseudo_tiled | pomo"
# alias nvim="bspc node --to-desktop ^3 --follow | nvim"
# alias ncmpcpp="bspc node --to-desktop ^4 --follow -t pseudo_tiled && ncmpcpp"
# alias nmtui="bspc node --to-desktop ^6 --follow -t pseudo_tiled| nmtui"

alias mkdir="mkdir -p"
alias neo="neofetch"
alias cowsayf="cowsay $(fortune)"
alias pastel="pastel -m 8bit" # }}}
alias terjem="trans :id"
# jump
alias skripsi="cd ~/Documents/essay-project/template-skripsi"
#xbps
alias xi="sudo xbps-install"
alias xr="sudo xbps-remove"
alias xc="sudo xbps-reconfigure"
alias xq="sudo xbps-query"
