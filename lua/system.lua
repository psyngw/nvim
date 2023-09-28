local G = require('G')

-- python
-- let g:python3_host_prog = $PYTHON
G.cmd([[
    let g:python3_host_prog = '/usr/bin/python'
]])

G.g.mapleader = ' '

-- Base
G.command([[
    highlight Normal ctermfg=7 ctermbg=NONE cterm=NONE
    set termguicolors
    set number
    set relativenumber
    set cursorline
    set hidden
    set expandtab
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    set autoindent
    set smartindent
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
    set colorcolumn=80,100
    set updatetime=100
    set virtualedit=block
    set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
    autocmd InsertEnter * :set norelativenumber number
    autocmd InsertLeave * :set relativenumber
]])

-- Terminal Behaviors
G.command([[
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
]])

-- Auto line  TODO: optimize by lua
G.cmd([[
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
]])

-- Undofile
G.command([[
    set undofile
    set undodir=~/.config/nvim/tmp/undo
]])

G.cmd([[
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  set viminfo=!,'10000,<50,s10,h
]])

G.cmd([[
  func! ChangeWorkDirectory()
    exec "lcd ".expand('%:p:h')
  endfunc
]])


-- G.cmd([[
--     <++>
-- ]])
