#eval "$(starship init zsh)"
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# The prompt
export PROMPT="%F{red}%n%f:%F{cyan}%m%f"$'\n'"%F{cyan} %B%30<..<%~%b %F{red}❯❯ "
# export PROMPT="%F{cyan} %B%30<..<%~%b %F{red}❯❯ "
~/.dwm/scripts/colors/zwaves

# Default editor
export EDITOR=nvim
# Path to NVM
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
# Customizing man theme with bat
export MANPAGER="sh -c 'col -bx | bat --theme Nord -l man -p'"

HISTFILE=~/.zsh-history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd

# zstyle :compinstall filename '~/.zshrc'

# autoload -Uz compinit
# compinit

# Aliases
alias zshrc='nvim ~/.zshrc'
alias nvimrc='nvim ~/.config/nvim/init.vim'

alias qsession='pkill -KILL -u $USER'
alias q='exit'
alias cat='bat --theme Nord'
alias l='exa -lahF --color=always --icons --sort=size --group-directories-first'
alias ls='ls -lahF --color=always'
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
