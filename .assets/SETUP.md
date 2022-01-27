### Setup

Clone this repo to `~/.dotfiles`: `git clone https://github.com/idlidev/.dotfiles ~/.dotfiles`

`chmod +x ~/.dotfiles/*.sh`

Install packages and symlink configs:
`~/.dotfiles/01-install-pkgs-arch.sh`

Copy configs:
`~/.dotfiles/02-copy-configs.sh`

Symlink configs (requires stow):
`~/.dotfiles/03-symlink-configs.sh`

### Setup NeoVim config

Copy `.config/nvim` to `~/.config/nvim`

Install vim-plug from [here](https://github.com/junegunn/vim-plug)

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Copy `~/.dotfiles/.config/nvim` to `~/.config/nvim`

Open NeoVim and do `:PlugInstall`
