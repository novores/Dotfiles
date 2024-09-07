# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/novores/.zshrc'
zstyle ':completion:*' menu select

autoload -Uz compinit
compinit
# End of lines added by compinstall
# set nnn's environments
set nnn plugin env
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='l:launch;p:preview-tabbed;n:nuke;m:nmount'
export NNN_OPENER='nuke'

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


# set default text editor
export EDITOR='nvim'
export VISUAL='nvim'

# set PATH
export LC_COLLATE="C"

# generate zoxide
eval "$(zoxide init zsh)"
eval "$(mcfly init zsh)"
# enable terminal to use custom color

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

# autostart tmux
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    tmux attach || tmux >/dev/null 2>&1
fi


# ALIASES
alias nchat="TERM=xterm-256color nchat"
alias yt="ytfzf"
alias tgpt="tgpt --provider duckduckgo"
# alias vifm="vifmrun"
alias blue="bluetoothctl"
alias N='sudo -E nnn -dH'
alias ls="ls --color=auto"
alias wsh="wiki-search-html"
alias ws='wiki-search'
alias wws="wormhole-william send"
alias wwr="wormhole-william receive"
alias cowsayf="cowsay $(fortune)"
alias grep="grep --color=always"
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

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "nojhan/liquidprompt"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

source /home/novores/.config/broot/launcher/bash/br
