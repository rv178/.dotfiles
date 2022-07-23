local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')

Plug 'kyazdani42/nvim-web-devicons'
Plug 'psliwka/vim-smoothie'
Plug 'nvim-telescope/telescope.nvim'
Plug 'honza/vim-snippets'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug('neoclide/coc.nvim', {['branch'] = 'release'})
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug('prettier/vim-prettier', {['do'] = 'yarn install'})
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'github/copilot.vim'
Plug 'ziglang/zig.vim'

vim.call('plug#end')
