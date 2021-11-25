# eval "$(starship init zsh)"
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# The prompt
export PROMPT="%F{red}%n%f:%F{cyan}%m%f"$'\n'"%F{cyan} %B%30<..<%~%b %F{red}❯❯ "
# Default editor
export EDITOR=nvim
# Path to NVM
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

HISTFILE=~/.zsh-history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd

# zstyle :compinstall filename '~/.zshrc'

# autoload -Uz compinit
# compinit

# Aliases
alias bspwmrc='nvim ~/.config/bspwm/bspwmrc'
alias sxhkdrc='nvim ~/.config/sxhkd/sxhkdrc'
alias polycfg='nvim ~/.config/polybar/config'
alias picomcfg='nvim ~/.config/picom/picom.conf'
alias zshrc='nvim ~/.zshrc'

alias q='exit'
alias l='exa -lahF --color=always --icons --sort=size --group-directories-first'
alias c='clear'
alias loadnvm='export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'
# Load on startup
_startup() {
  # Beam shape cursor
  echo -ne '\e[5 q'
  # Print an empty line on each new prompt
  echo ""
}

precmd_functions+=(_startup)
