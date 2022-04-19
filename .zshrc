export VISUAL=nvim;
export EDITOR=nvim;

source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.{{{
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle man
antigen bundle colored-man-pages

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell
 
# Tell Antigen that you're done.
antigen reset; antigen apply # }}}

#ALIASES {{{
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
#alias nvim="bspc node --to-desktop ^3 --follow | nvim"
#alias ncmpcpp="bspc node --to-desktop ^4 --follow | ncmpcpp"

alias mkdir="mkdir -p"
alias neo="neofetch"
alias cowsayf="cowsay $(fortune)"
alias pastel="pastel -m 8bit" # }}}
