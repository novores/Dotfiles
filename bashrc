# Run twolfson/sexy-bash-prompt
. ~/.bash_prompt

export EDITOR='nvim'
export VISUAL='nvim'
export PATH="/home/novores/.local/bin:$PATH"

#set color-manpage
# from: https://wiki.archlinux.org/index.php/Color_output_in_console#man
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
HISTSIZE=2000
HISTFILESIZE=2000
shopt -s histappend

# generate zoxide
eval "$(zoxide init bash)"

#color variable
blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

#functions
find_largest_files() {
    du -h -x -s -- * | sort -r -h | head -20;
}
#prompt
# my_prompt() {
#   PS1="$ylw$(whoami)$clr$wht at$clr $grn\w$clr $(git_branch)\n\$ "
# }

# my_prompt

#aliases#{{{
alias ls="ls --color=auto"
alias wsh="wiki-search-html"
alias ws='wiki-search'
alias wws="wormhole-william send"
alias wwr="wormhole-william receive"
# alias pomo="bspc node --to-desktop ^6 --follow -t pseudo_tiled | pomo"
# alias nvim="bspc node --to-desktop ^3 --follow | nvim"
# alias ncmpcpp="bspc node --to-desktop ^4 --follow -t pseudo_tiled && ncmpcpp"
# alias nmtui="bspc node --to-desktop ^6 --follow -t pseudo_tiled| nmtui"

alias comp="sudo make install"
alias neo="neofetch"
alias cowsayf="cowsay $(fortune)"
alias pastel="pastel -m 8bit" # 
### xbps ###
alias xi="sudo xbps-install"
alias xr="sudo xbps-remove"
alias xc="sudo xbps-reconfigure"
alias xq="xbps-query"
### Git ###
alias gst="git status"
alias ga="git add"
alias gr="git rm"
alias gp="git push"
alias gc="git commit"
### Navigation ###
alias ..='cd ..;pwd'
alias ...='cd ../..;pwd'
alias ....='cd ../../..;pwd'
alias tree='tree --dirsfirst -F'
alias mkdir='mkdir -p -v'
alias ll='ls -l'
alias la='ls -la'#}}}

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
