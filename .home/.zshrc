#eval "$(starship init zsh)"
# The prompt
export PROMPT="%F{red}%n%f:%F{cyan}%m%f"$'\n'"%F{cyan} %B%30<..<%~%b %F{red}❯❯ "
# export PROMPT="%F{cyan} %B%30<..<%~%b %F{red}❯❯ "
~/.config/scripts/colors/zwaves

HISTFILE=~/.zsh/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000
setopt autocd
# zstyle :compinstall filename '~/.zshrc'

#autoload -Uz compinit
#zstyle ':completion:*' menu select
#zmodload zsh/complist
#compinit
#_comp_options+=(globdots)

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Aliases
alias zshrc='nvim ~/.zshrc'
alias recordcam='ffmpeg -f v4l2 -framerate 60 -i /dev/video0 cam-out.mp4'
alias takephoto='ffmpeg -f video4linux2 -i /dev/video0 -vframes 1  test.png'
alias qsession='pkill -KILL -u $USER'
alias q='exit'
alias cat='bat --theme Nord'
alias l='exa -lahF --color=always --icons --sort=size --group-directories-first'
alias ls='ls -lahF --color=always'
alias c='clear'
alias hst='history 1 -1 | cut -c 8- | sort | uniq | fzf | xclip -sel c'
alias gst='git status'
alias gm='git commit -S'
alias ga='git add .'
alias gma='git commit -aS'
alias gp='git push'
alias gpull='git pull'
alias fnd='findfile=$(find . | fzf) && nvim $findfile'
alias swhkdrc='nvim ~/.config/swhkd/swhkdrc'
alias loadnvm='export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.config/nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'

# Load on startup
_startup() {
  # Beam shape cursor
  echo -ne '\e[5 q'
  # Print an empty line on each new prompt
  echo ""
}

precmd_functions+=(_startup)

# Source plugins
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
