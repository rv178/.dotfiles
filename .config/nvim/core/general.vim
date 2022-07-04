syntax on
set completeopt=menuone,noselect
set relativenumber
set nu
set nowrap
set encoding=UTF-8
set smarttab
set smartindent
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=150
set cindent
set noerrorbells
set tabstop=4 softtabstop=4
set scrolloff=999
set shiftwidth=4
set background=dark
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes
set mouse=a
set window title
set title
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
colorscheme nord

command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

hi! Normal ctermbg=NONE guibg=NONE