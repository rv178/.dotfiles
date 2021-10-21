eval "$(starship init zsh)"
# export PROMPT="%F{078}%."$'\n'" ❯ %f"
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh-history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
# End of lines configured by zsh-newuser-install
zstyle :compinstall filename '/home/rv/.zshrc'

export EDITOR=nvim
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

autoload -Uz compinit
compinit
# End of lines added by compinstall
source /home/rv/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/rv/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

_fix_cursor() {
  echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)
