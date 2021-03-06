" Plugins                     =========
packadd minpac
call minpac#init()
call minpac#add('junegunn/fzf.vim')
call minpac#add('herrbischoff/cobalt2.vim')
call minpac#add('posva/vim-vue')
call minpac#add('oblitum/rainbow')
call minpac#add('sjl/gundo.vim')
call minpac#add('neoclide/coc.nvim')
"|||||||||||||||||||||||||||||---------

" Config                      =========

" gundo                       =========
" https://sjl.bitbucket.io/gundo.vim/
let g:gundo_width = 5
let g:gundo_preview_height = 5
"window
"derault
"w 45
"h 15"
let g:gundo_preview_bottom = 1
"The preview is show in bottom of the window"
let g:gundo_right = 1
let g:gundo_help  = 0
let g:gundo_close_on_revert = 1
"|||||||||||||||||||||||||||||---------

" Rainbow                     =========
let g:rainbow_active = 1
"|||||||||||||||||||||||||||||---------

" #### UI ######################### 
colorscheme lucius
set cmdheight=2
set showcmd  
" Better display for messages
set statusline=%.10t%\-{coc#status()}%{get(b:,'coc_current_function','')}\-%=%m[%02.2c[%03.3l\\%02.2p%%]
"Traduction.
"file(nim=0,max=10)-CocStatus-[column(min=2,max=2)[line(min=2,max=2)/percentOfFile(min=2,max=2)]
":h coc-status`

" always show signcolumns
set signcolumn=yes
set wildmenu                "Visual autocomplete for command menu
set nonumber                 
"No add line noumbers becasuse the space of the mobile screen is reduced,
"and the numbers is ofthen a distractor. If you need go to some line you can
"use <number>gg.

" #### Fold ####################### 
set foldenable              
set foldlevelstart=1        
set foldnestmax=3           
set foldmethod=indent       
" enable folding
" open 2 level of folds
" max folding level
" marker manual expr syntax diff

set showmatch               " highlight matching [{()}]
" if hidden is not set, TextEdit might fail.
set hidden
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
syntax enable
filetype indent on          "Auto indent depending on files in ./indent/[filetype].vim
" SPACES AND TABS #######
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set ignorecase              " case insensitive matching
set lazyredraw              " Redraw only when is nedded
"set the 'read mode'
set wrap
set linebreak
set nolist
set incsearch               " search as characters are entered
set hlsearch                " highlight search results
set autoread
"Set the <c-x> and <c-a> only use decimal
set nrformats=
" set backup
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set backupskip=/tmp/*,/private/tmp/*
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set writebackup
" Coc note: Some servers have issues with backup files, if a server fail
set nobackup
set nowritebackup
"|||||||||||||||||||||||||||||---------

" Conmands                    =========

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"|||||||||||||||||||||||||||||---------

" FUNCTIONS                   =========

" --CoC                       =========
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"|||||||||||||||||||||||||||||---------

" togle betwen relative and non relative number
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunction
"|||||||||||||||||||||||||||||---------

" AUTOCMD                     =========

" --CoC                       =========
augroup cocgroup
  autocmd!

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')

  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

augroup end
"|||||||||||||||||||||||||||||---------

augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd! VimEnter * hi Folded ctermbg=0
  autocmd filetype vim,zsh :set foldmethod=marker foldlevel=0 foldmarker==========,---------
  autocmd! BufWritePre *.{js,cjs,mjs,jsx} :CocCommand eslint.executeAutofix 
  au! BufNewFile,BufRead *.svelte set ft=html
augroup end
"|||||||||||||||||||||||||||||---------

" Keys                        =========

"Set leader at first
let g:mapleader = ','

" --CoC                       =========
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Rermap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)


" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR> coc

" Coc Snippets plugin        __________

"Open the snippets
nnoremap <leader>osnp :CocCommand snippets.editSnippets<CR>
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
"                            __________

"|||||||||||||||||||||||||||||---------

" --Gundo                     =========

nnoremap <leader>tu :GundoToggle<CR>
"|||||||||||||||||||||||||||||---------

" turn of search highlight
nnoremap <leader>nhl :nohlsearch<CR>

"togle folds map
nnoremap <leader>tf za

"move verticaly by visual line
nnoremap j gj
nnoremap k gk

"move to the begin/end of line
nnoremap B ^
nnoremap E $
nnoremap ^ <nop>
nnoremap $ <nop>

"highlight last inserted text
nnoremap <leader>hli `[v`]

"for open the file finder
nnoremap <C-p> :<C-u>FZF<CR>

"open vimrc
nnoremap <leader>ovrc :tabnew $MYVIMRC<CR>

"source vimrc
nnoremap <leader>svrc :source $MYVIMRC<CR>

"Tab_triggeropen javascript snippets
" @Dont Work use :coccommand snippets.editSnippets
nnoremap <leader>snip :vsp ~/.config/nvim/ultisnippets/javascript.snippets

" jk to exit inseat esc
inoremap jk <esc>
inoremap <esc> <nop>

" Save from insertMode
inoremap :w <ESC>:w<CR>

" Save the session - to restore needs nvim -S
nnoremap <leader>s :mksession<CR>

" inner word uppercase
nnoremap <leader>uiw viwU

" open a fold when press j
nnoremap <silent> l @=(foldlevel('.') ? 'zo' : 'l' )<CR>l
"|||||||||||||||||||||||||||||---------

" ABBREVIATIONS               =========
iabbrev cont const
iabbrev strenght strength
iabbrev nwe new
iabbrev hability ability
"|||||||||||||||||||||||||||||---------

