#!/bin/bash

# set default text editor
export EDITOR='nvim'
export VISUAL='nvim'

# set PATH
export LC_COLLATE="C"

# set nnn's environments
set nnn plugin env
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='l:launch;p:preview-tabbed;n:nuke;m:nmount'
export NNN_OPENER='nuke'

#set color-manpage. read: https://wiki.archlinux.org/index.php/Color_output_in_console#man
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export MANPAGER='less -s -M +Gg'

#Managing history
HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoredups
HISTSIZE=1000
HISTFILESIZE=1000

# generate zoxide
eval "$(zoxide init bash)"

# autostart tmux
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    tmux attach || tmux >/dev/null 2>&1
fi

#color variable
# blk='\[\033[01;30m\]'   # Black
# red='\[\033[01;31m\]'   # Red
# grn='\[\033[01;32m\]'   # Green
# ylw='\[\033[01;33m\]'   # Yellow
# blu='\[\033[01;34m\]'   # Blue
# pur='\[\033[01;35m\]'   # Purple
# cyn='\[\033[01;36m\]'   # Cyan
# wht='\[\033[01;37m\]'   # White
# clr='\[\033[00m\]'      # Reset

# FUNCTIONS
cam(){
  fswebcam -r 720x720 -F 20 "$HOME/Gambar/camshot/$(date +%s).jpg"
}
casts () {
  FILE=$HOME/Developments/blog-repo/content
  asciinema rec $FILE/$1$(date +%s).cast 
}

comp () {
  if [ -e config.h ]; then
    rm config.h
    sudo make install 
  else
    sudo make install 
  fi
}

find_largest_files() {
    du -h -x -s -- * | sort -r -h | head -20;
}

# nnn functions
n () {
    # Block nesting of nnn in subshells
    if [[ "${NNNLVL:-0}" -ge 1 ]]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The backslash allows one to alias n to nnn if desired without making an
    # infinitely recursive alias
    nnn -e "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# prompt(uncomment this if you. dont want use liquidpromt)
# my_prompt() {
#   PS1="$ylw$(whoami)$clr$wht at$clr $grn\w$clr $(git_branch)\n\$ "
#}

# ALIASES
alias blue="bluetoothctl"
alias N='sudo -E nnn -dH'
alias ls="ls --color=auto"
alias wsh="wiki-search-html"
alias ws='wiki-search'
alias wws="wormhole-william send"
alias wwr="wormhole-william receive"
# alias pomo="bspc node --to-desktop ^6 --follow -t pseudo_tiled | pomo"
# alias nvim="bspc node --to-desktop ^3 --follow | nvim"
# alias ncmpcpp="bspc node --to-desktop ^4 --follow -t pseudo_tiled && ncmpcpp"
# alias nmtui="bspc node --to-desktop ^6 --follow -t pseudo_tiled| nmtui"
alias neo="neofetch"
alias cowsayf="cowsay $(fortune)"
# alias pastel="pastel -m 8bit"
### Git ###
alias gst="git status"
alias ga="git add"
alias gr="git rm"
alias gp="git push"
alias gc="git commit"
alias gd="git diff"
alias gl="git log"
alias gch="git checkout"
alias gb="git branch"
### Navigation ###
alias ..='cd ..;pwd'
alias ...='cd ../..;pwd'
alias ....='cd ../../..;pwd'
alias tree='tree --dirsfirst -F'
alias mkdir='mkdir -p -v'
alias ll='ls -l'
alias la='ls -la'

# bash autocompletion like zsh
# bind 'TAB:menu-complete'
# bind '"\e[Z":menu-complete-backward'

###-begin-npm-completion-###{{{

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    if ! IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)); then
      local ret=$?
      IFS="$si"
      return $ret
    fi
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    if ! IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)); then

      local ret=$?
      IFS="$si"
      return $ret
    fi
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###}}}
LOCAL_RCFILE=$HOME/.config/liquidpromptrc
[ -f "$LOCAL_RCFILE" ] && source "$LOCAL_RCFILE"
source /usr/bin/liquidprompt

source /home/novores/.config/broot/launcher/bash/br
