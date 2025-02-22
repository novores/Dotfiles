export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
export COLORTERM="truecolor"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt beep
bindkey -e
zstyle :compinstall filename '/home/novores/.zshrc'
zstyle ':completion:*' menu select

autoload -Uz compinit
compinit
# End of lines added by compinstall

# set default text editor
export EDITOR='nvim'
export VISUAL='nvim'

# set PATH
export LC_COLLATE="C"

# generate zoxide
eval "$(zoxide init zsh)"
eval "$(mcfly init zsh)"

# FUNCTIONS
cam(){
  fswebcam -r 720x720 -F 20 "$HOME/Gambar/camshot/$(date +%s).jpg"
}
casts () {
  FILE=$HOME/Developments/blog-repo/content
  asciinema rec $FILE/$1$(date +%s).cast 
}

suckless () {
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

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
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
alias ls="eza"
alias grep="rg"
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
