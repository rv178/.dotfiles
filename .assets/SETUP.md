### Setup

Clone this repo to `~/.dotfiles`: `git clone https://github.com/rv178/.dotfiles ~/.dotfiles`

`chmod +x ~/.dotfiles/*.sh`

Install packages and symlink configs:
`~/.dotfiles/01-setup-arch.sh`

Symlink configs (requires stow):
`~/.dotfiles/02-configs.sh`

#### Neovim

Run `~/.dotfiles/.config/nvim/lsp.sh` to install LSP binaries.
