" __  ____   __  _   ___     _____ __  __ ____   ____
" "|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
" "| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
" "| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
" "|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
"
" " Author: @psyngw
" " Thanks: @theniceboy

" ===
" === Auto load for first time user
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" === System
" ===
" let &t_ut=''
" set autochdir

let g:python3_host_prog = '/usr/bin/python'

" ===
" === Editor behavior
" ===
set number
set relativenumber
set cursorline
set hidden
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
" set pastetoggle=<F9>
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=10
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast
set lazyredraw
set visualbell
"set clipboard+=unnamedplus
"silent !mkdir -p ~/.config/nvim/tmp/backup
"silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
"set backupdir=~/.config/nvim/tmp/backup,.
"set directory=~/.config/nvim/tmp/backup,.
"if has('persistent_undo')
"	set undofile
"	set undodir=~/.config/nvim/tmp/undo,.
"endif
set colorcolumn=80,100
set updatetime=100
set virtualedit=block
"
"au BufReadPost * if line("'\"") > 1 && line("'\"") <=line("$") | exe "normal! g'\"" | endif
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
"set enc=utf8
"set fencs=utf8,gbk,gb2312,gb18030

" ===
" " === Terminal Behaviors
" " ===
" let g:neoterm_autoscroll = 1
" autocmd TermOpen term://* startinsert
" tnoremap <C-N> <C-\><C-N>
" tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

" ===
" === Auto line
" ===
autocmd BufNewFile *.sh,*.py exec ":call SetTitle()"
func SetTitle()
if expand("%:e") == 'sh'
 call setline(1,"#!/bin/bash")
 call setline(2,"#")
 call setline(3,"#**************************************************")
 call setline(4,"# Author:         psyngw                          *")
 call setline(5,"# GitHub:         @psyngw                         *")
 call setline(6,"# Date:           ".strftime("%Y-%m-%d"). "                      *")
 call setline(7,"# Description:                                    *")
 call setline(8,"# Copyright ".strftime("%Y"). " by psyngw.All Rights Reserved    *")
 call setline(9,"#**************************************************")
 call setline(10,"")
 call setline(11,"")
endif
if expand("%:e") == 'py'
    call setline(1, "\#!/usr/bin/env python")
    call setline(2, "\# -*- coding: utf-8 -*-")
    call setline(3, "\# Author: psyngw")
    call setline(4, "\# Date: ".strftime("%Y-%m-%d"))
    normal G
    normal o
    normal o
endif
endfunc
autocmd BufNewFile * normal G


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" set current line to blank
noremap D 0D

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
" noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
"nnoremap <LEADER>tt :%s/    /\t/g
"vnoremap <LEADER>tt :s/    /\t/g

" Folding
noremap <silent> <LEADER>o za

" Open up lazygit
"noremap \g :Git
noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>

" paste system clipboard
noremap ,p "+p
noremap ,P "+P

" mark list
noremap mm :marks<CR>

" insert <++>
noremap <LEADER>,< a<++><ESC>

" insert date and time
inoremap ,da <c-r>=strftime('%Y-%m-%d')<CR>
inoremap ,ti <c-r>=strftime('%Y-%m-%d %H:%M:%S')<CR>

" ===
" === Cursor Move
" ===

" J/K keys for 5 times j/e
noremap <silent> J 5j
noremap <silent> K 5k

" H/L keys: go to the start/end of the line
noremap <silent> H ^
noremap <silent> L $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" Ctrl + J or K will move up/down the view port without moving the cursor
"noremap <C-J> 5<C-y>
"noremap <C-K> 5<C-e>

source $HOME/.config/nvim/cursor.vim

" add , for current line's words
noremap <LEADER>r' :s/\(\w\+\)/'\1'/g<CR>:nohl<CR>
noremap <LEADER>r" :s/\(\w\+\)/"\1"/g<CR>:nohl<CR>
noremap <LEADER>r, :s/\(\w\+\)/\1,/g<CR>:nohl<CR>$x
nmap <LEADER>r) ^v$hS)
nmap <LEADER>r( ^v$hS(
nmap <LEADER>rr <SPACE>r,<SPACE>r'<SPACE>r)I

" ===
" === Insert Mode Cursor Movement
" ===

" move cursor to the begin/end of the line
" not useful: vim's <C-i> == TAB
" inoremap <C-a> <ESC>A
" inoremap <C-i> <ESC>I
inoremap <C-h> <C-\><C-o>^

" Fast to move visiual to midlle of the screen
inoremap ,z <ESC>zza

" TODO Press , + ? to jump to the next '<++>' and edit it
inoremap ,e <ESC>/<++><CR>:nohlsearch<CR>c4l

" jump to the begin/end of the line
" inoremap <C-l>l <ESC>A
" inoremap <C-l>h <ESC>I

" fix <C-o> with <C-l>
" inoremap <C-l> <C-\><C-o>

" jump to a new line to edit
" inoremap <C-o> <ESC>o

" delete privious word , use C-w if u like
inoremap ,b <ESC>bcw

" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
" cnoremap <C-d> <Backspace>
cnoremap <M-h> <S-Left>
cnoremap <M-l> <S-Right>

" ===
" === Searching
" ===
" noremap - N
" noremap = n


" ===
" === Window management
" ===
" Use <LEADER> + arror keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>l <C-w>l
noremap <LEADER>h <C-w>h

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical),right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap soj :res +5<CR>
noremap sok :res -5<CR>
" noremap sol :vertical resize-5<CR>
" noremap soh :vertical resize+5<CR>
noremap sol :vertical resize-
noremap soh :vertical resize+

" Place the two screens up and down
" noremap sh <C-w>t<C-w>K
" Place the two screens side by side
" noremap sv <C-w>t<C-w>H
"
" " Rotate screens
" noremap srh <C-w>b<C-w>K
" noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tn :tabe<CR>

" Move around tabs with th and tl
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>

" Move the tabs with tmh and tml
noremap toh :-tabmove<CR>
noremap tol :+tabmove<CR>


" ===
" === Markdown Settings TODO
" ===
" Snippets
source $HOME/.config/nvim/md-snippets.vim
" " auto spell
" autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Others
" ===
" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" find and replace
noremap \s :%s//g<left><left>

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Compile function
noremap ,r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        set splitbelow
        exec "!g++ -std=c++11 % -Wall -o %<"
        :sp
        :res -10
        :term ./%<
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :term python3 %
    elseif &filetype == 'html'
        silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'markdown'
        exec "InstantMarkdownPreview"
    elseif &filetype == 'tex'
        silent! exec "VimtexStop"
        silent! exec "VimtexCompile"
    elseif &filetype == 'dart'
        exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
        silent! exec "CocCommand flutter.dev.openDevLog"
    elseif &filetype == 'javascript'
        set splitbelow
        :sp
        :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run .
    endif
endfunc

noremap ,y :call YapfFIle()<CR>
func! YapfFIle()
    silent exec "!yapf -i %:p"
    " :term yapf -i %
endfunc

" ===
" === Install Plugins with Vim-Plug
" ===

" choose some Plug I need

call plug#begin('~/.config/nvim/plugged')

" Editor Enhancement
Plug 'gcmt/wildfire.vim' " Enter to select content.
Plug 'tpope/vim-surround' " Visual content and 'S' + 'surround char', or 'cs<now><to>' to change, 'ds<now>' to delete.
Plug 'mg979/vim-visual-multi' " select words with C-n, plus block visual with C-Down and C-Up
Plug 'ajmwagar/vim-deus' " 'color deus' to enable
" Plug 'sickill/vim-monokai' " 'color monokai' to enable
" Plug 'junegunn/seoul256.vim' " 'color monokai' to enable
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug '~/.fzf' " add fzf home
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
" Plug 'psyngw/eleline.vim'
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'ojroques/vim-scrollstatus'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'RRethy/vim-illuminate'
Plug 'honza/vim-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-repeat'

" Taglist
Plug 'liuchengxu/vista.vim'
" Plug 'preservim/tagbar'
" nmap <F8> :TagbarToggle<CR>

" Plug 'dense-analysis/ale'
" ranger
Plug 'kevinhwang91/rnvimr'

" subversive
Plug 'svermeulen/vim-subversive'

" vim-sneak'
Plug 'justinmk/vim-sneak'

" indent
Plug 'Yggdroot/indentLine'

" start index
Plug 'mhinz/vim-startify'

" Countbean
Plug 'nathangrigg/vim-beancount'

autocmd FileType beancount inoremap <c-l> <c-x><c-o>
" autocmd FileType beancount inoremap . .<C-\><C-O>:AlignCommodity<CR>
autocmd FileType beancount vnoremap <leader>= :AlignCommodity<CR>
autocmd FileType beancount nnoremap <leader>= :AlignCommodity<CR>

" ===
" === markdown
" ===
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

call plug#end()
" let g:ale_python_pylint_options = '--load-plugins pylint_django'
" let g:ale_fixers = {
"             \ 'python': ['yapf', 'isort'],
"             \ }
" let g:ale_fix_on_save = 1
" noremap <F2> :ALEFix<CR>

" ===
" === Optimize vim colorscheme
" ===
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" color deus
" color monokai
" color seoul256-white
" color seoul256
let g:tokyonight_style = "day"
color tokyonight
" set background=dark

" ================================= Plug Settings =======================================

" ===
" === vim-visul-multi
" ===
" TODO find keys to replace Ctrl
let g:VM_maps = {}
let g:VM_maps['Add Cursor Down'] = '<C-j>'
let g:VM_maps['Add Cursor Up'] = '<C-k>'

" ===
" === fzf
" ===
set rtp+=~/.fzf
set rtp+=/usr/bin/fzf
set rtp+=/usr/local/opt/fzf
" noremap <C-p> :Files<CR>
noremap <LEADER>ff :Files<CR>
noremap <LEADER>ft :BTags<CR>
" noremap <C-h> :Histor<CR>
noremap <LEADER>fh :Histor<CR>
noremap <LEADER>fr :Rg<CR>
noremap <LEADER>fs :BLines<CR>
noremap <LEADER>fb :Buffers<CR>
noremap <LEADER>fg :GFiles?<CR>
let g:fzf_preview_window = ['right:50%']
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" ===
" === eleline.vim
" ===
" powerline fonts powerline/fonts.git

" ===
" === lightline
" ===
let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'git_head' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'FugitivePath',
      \   'git_head': 'FugitiveHead',
      \   'near_func': 'NearestMethodOrFunction'
      \ },
      \ }

" ===
" === airline.vim
" ===
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" let g:airline_section_x = '%{ScrollStatus()}'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = '  '
let g:airline_left_alt_sep = '  '
let g:airline_right_sep = '  '
let g:airline_right_alt_sep = '  '
let g:airline_symbols.branch = '  '
let g:airline_symbols.readonly = '  '
let g:airline_symbols.linenr = ' ☰ '
let g:airline_symbols.maxlinenr = '  '
let g:airline_symbols.dirty=' ⚡'
let g:airline#extensions#tabline#enabled = 1

" ===
" === GitGutter
" ===
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
" let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed = '▶'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap <LEADER>gh :GitGutterPreviewHunk<CR>
nnoremap <LEADER>gu :GitGutterUndoHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>

" ===
" === coc
" ===
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-prettier', 'coc-pyright', 'coc-actions', 'coc-explorer', 'coc-translator', 'coc-yank', 'coc-snippets', 'coc-go']

nmap tt :CocCommand explorer<CR>
nmap ts <Plug>(coc-translator-p)
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" TextEdit might fail if hidden is not set.
" set hidden

" Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <LEADER>w :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph TODO
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of selected region : seems like for flutter?
" function! s:cocActionsOpenFromSelected(type) abort
"   execute 'CocCommand actions.open ' . a:type
" endfunction
" xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' .visualmode()<CR>
" nmap <silent> <leader>a :<C-u>setoperatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" " Remap <C-f> and <C-b> for scroll float windows/popups.
" " Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
" nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
" inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" " NeoVim-only mapping for visual mode scroll
" " Useful on signatureHelp after jump placeholder of snippets expansion
" if has('nvim')
"   vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
"   vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
" endif

" " Use CTRL-S for selections ranges.
" " Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" " Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" ===
" === coc-snippets
" ===
imap <C-j> <Plug>(coc-snippets-expand)
" vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
" imap <C-j> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'wysgned'
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
" $HOME/.config/nvim/plugged/vim-snippets/UltiSnips/"

" ===
" === Vista
" ===
" noremap <LEADER>v :Vista!!<CR>
noremap T :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
" let g:vista_sidebar_keepalt = 1
let g:vista_echo_cursor = 1
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
        \   "function": "\uf794",
        \   "variable": "\uf71b",
        \  }
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:scrollstatus_size = 15

" ===
" === tcomment_vim
" ===
" nnoremap ci cl
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cn g>c
vmap <LEADER>cn g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<

" ===
" === rainbow
" ===
let g:rainbow_active = 1

" ===
" === Rnvimr
" ===
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]

" ===
" === vim-subversive
" ===
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)

" ===
" === vim-instant-markdown
" ===
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1
let g:mkdp_browser = 'google-chrome-stable'
let g:mkdp_browserfunc = 'open '
let g:instant_markdown_logfile = '/home/warren/test.log'

" ===
" === bullets.vim
" ===
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

" ===
" === vim-sneak
" ===
let g:sneak#label = 1
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S


" ===
" === vim-startify
" ===
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction
let g:startify_lists = [
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'files',     'header': ['   Files']            },
        \ { 'type': 'dir',       'header': ['   Directory '. getcwd()] },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
let g:startify_bookmarks = [
      \ { 'c': '~/.config/nvim/init.vim' },
      \ { 'rgem': '~/repo/gem_mtn' },
      \ { 'rgbp': '~/repo/gbp' },
      \ { 'ra': '~/repo' },
      \]
let g:startify_session_persistence = 1
let g:startify_session_dir = '~/.config/nvim/session'
" let g:startify_custon_header = 
" require vim-gitbranch -> itchyny/vim-gitbranch
" function! GetUniqueSessionName()
"   let path = fnamemodify(getcwd(), ':~:t')
"   let path = empty(path) ? 'no-project' : path
"   let branch = gitbranch#name()
"   let branch = empty(branch) ? '' : '-' . branch
"   return substitute(path . branch, '/', '-', 'g')
" endfunction
"
" autocmd User        StartifyReady silent execute 'SLoad '  . GetUniqueSessionName()
" autocmd VimLeavePre *             silent execute 'SSave! ' . GetUniqueSessionName()
