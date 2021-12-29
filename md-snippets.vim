" autocmd Filetype markdown inoremap <buffer> ,w <Esc>/\| \+\|<CR>:nohlsearch<CR>a
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,u ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,t - [ ] 
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
" autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>
autocmd Filetype markdown imap <buffer> ,v <ESC>[\|}\|]\|i

autocmd Filetype markdown inoremap <buffer> ,f <details><Enter><summary>+</summary><Enter><Enter><++><Enter></details><ESC>3kcl
" autocmd Filetype markdown imap <buffer> ,m [[todo]] -> [todo](todo)<ESC>^/todo<CR>;nohl<CR>
autocmd Filetype markdown imap <buffer> ,m [[todo]] -> <a href="todo">todo</a><ESC>^/todo<CR>;nohl<CR>

" function TapAllColumn(...)
"   echo "get count: " a:1
"   let b_count = printf('normal %s,v', a:1)
"   exec b_count
" endfunction
" command! -nargs=* TapTap call TapAllColumn(<f-args>)
" noremap ,b :call TapAllColumn(2)
" noremap ,c :TapTap 
" autocmd Filetype markdown noremap <buffer> ,v i<++><ESC>}|
" nmap ,v i<++><Esc>}|
