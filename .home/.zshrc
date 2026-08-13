eval "$(fnm env --use-on-cd --shell zsh)"
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
alias zpr='nvim ~/.zprofile'
alias recordcam='ffmpeg -f v4l2 -framerate 60 -i /dev/video0 cam-out.mp4'
alias takephoto='ffmpeg -f video4linux2 -i /dev/video0 -vframes 1  test.png'
alias qsession='pkill -KILL -u $USER'
alias q='exit'
alias cat='bat --theme Nord -p'
alias l='eza -lahF --color=always --icons --sort=size --group-directories-first'
alias ls='ls -lahF --color=always'
alias c='clear'
alias gst='git status'
alias gm='git commit -S'
alias ga='git add .'
alias gma='git commit -aS'
alias gp='git push'
alias gpull='git pull'
alias swhkdrc='nvim ~/.config/swhkd/swhkdrc'
alias loadnvm='export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.config/nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'
alias pm="passmenu"
alias py="python"
alias ta="tmux attach"

cda() {
    local dir
    dir=$(fd --type d --exclude extras/Games -H | fzf --preview 'tree -C {} | head -n 200')
    
    if [[ -n "$dir" ]]; then
        cd "$dir"
    fi
}

op() {
    local file
    file=$(fd --type f -H --exclude .git | fzf --preview 'bat --theme=Nord --style=numbers --color=always --line-range :500 {}')
    
    if [[ -n "$file" ]]; then
        nvim "$file"
    fi
}

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
source ~/.zsh/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null
# END opam configuration
