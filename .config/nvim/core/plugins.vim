let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'nord'
let g:airline_section_z = airline#section#create(['windowswap', 'obsession', 'linenr', 'maxlinenr'])

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusShowClean = 1 
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeWinSize = 20
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
let g:prettier#autoformat = 0
let g:smoothie_enabled = 1
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-rls',
  "\ 'coc-java',
  \ 'coc-go',
  \ 'coc-discord-rpc',
  \ 'coc-pairs',
  \ 'coc-prettier', 
  \ 'coc-json', 
  "\ 'coc-pyright'
  \ ]