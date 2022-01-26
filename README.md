# My Dotfiles

Clone this repo to `~/.dotfiles`: `git clone https://github.com/idlidev/.dotfiles ~/.dotfiles`

### Setup

`chmod +x ~/.dotfiles/*.sh`

Install packages and symlink configs:
`~/.dotfiles/01-install-pkgs-arch.sh`

Copy configs:
`~/.dotfiles/02-copy-configs.sh`

Symlink configs (requires stow):
`~/.dotfiles/03-symlink-configs.sh`

Inspired from [ShinyZenith's dotfiles](https://github.com/shinyzenith/old-xorg-dotfiles)

### Setup NeoVim config

Copy `.config/nvim` to `~/.config/nvim`

Install vim-plug from [here](https://github.com/junegunn/vim-plug)

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Copy `~/.dotfiles/.config/nvim` to `~/.config/nvim`

Open NeoVim and do `:PlugInstall`

### Screenshots

#### DWM

![Alt text](./.assets/screenshots/ss2.png "Screenshot 1")

#### BSPWM

![Alt text](./.assets/screenshots/ss1.png "Screenshot 1")

#### NeoVim

![Alt text](./.assets/screenshots/ss3.png "Screenshot 1")
