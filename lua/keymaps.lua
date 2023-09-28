local G = require('G')

local nore = { noremap = true }

G.map({
  { 'n', ';',            ':',                              nore },
  { 'v', ';',            ':',                              nore },
  { 'n', 'Q',            ':q<CR>',                         nore },
  { 'n', '<c-q>',        ':q!<CR>',                        nore },
  -- ":noautocmd w" to save without autocmd like formatOnSave
  { 'n', '<leader>S',    ':w<CR>',                         nore },
  { 'n', 'S',            ':noa w<CR>',                     nore },
  -- { 'n', 's',           '<nop>',   {} },
  { 'v', '<leader>y',    ':w! ~/.cache/.tt<CR>',           nore },
  { 'n', '<leader>y',    ':r ~/.cache/.tt<CR>',            nore },
  { 'n', '<LEADER>rc',   ':e ~/.config/nvim/init.lua<CR>', nore },
  { 'n', 'Y',            'y$',                             nore },
  { 'v', 'Y',            '"+y',                            nore },
  { 'n', '<',            '<<',                             nore },
  { 'n', '>',            '>>',                             nore },
  { 'n', '<LEADER><CR>', ':nohlsearch<CR>',                nore },
  { 'n', '<LEADER>fw',   '/\\<\\><left><left>',            nore },
  { 'i', '<c-f>',        '<Esc>gUiw`]a',                   nore },
  { 'n', '<leader>mm', ":<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>",
    nore },

  -- " translate using crow-translate
  { 'n', '<LEADER>tr',       ':!crow <c-r><c-w> -t zh-CN -l zh-CN<CR>',                   nore },
  { 'n', '<LEADER>ts',       ':!crow -l zh-CN',                                           nore },

  -- Navigate
  { 'n', 'J',                '5j',                                                        nore },
  { 'n', 'K',                '5k',                                                        nore },
  { 'v', 'J',                '5j',                                                        nore },
  { 'v', 'K',                '5k',                                                        nore },

  -- Lazygit
  { 'n', '<c-g>',            ':tabe<CR>:-tabmove<CR>:term lazygit<CR>',                   nore },

  -- find and replace/delete
  { 'n', '\\s',              ':<c-u>%s/\\v//gc<left><left><left><left>',                  nore },
  { 'n', '\\d',              ':g//d<left><left>',                                         nore },
  { 'v', '\\s',              ':s/\\v//gc<left><left><left><left>',                        nore },
  { 'n', '<LEADER>W',        ":s/\\s\\+$//<cr>:let @/=''<CR>:nohl<CR>",                   nore },

  -- delete without reg store
  { 'n', '<bs>',             '"_ciw',                                                     nore },
  { 'v', '<BS>',             '"_d',                                                       nore },
  { 'n', 'x',                '"_x',                                                       nore },
  { 'v', 'x',                '"_x',                                                       nore },
  { 'n', 'Y',                'y$',                                                        nore },
  { 'v', 'c',                '"_c',                                                       nore },
  { 'v', 'p',                'pgvy',                                                      nore },
  { 'v', 'P',                'Pgvy',                                                      nore },
  { 'i', '<c-a>',            '<Esc>I',                                                    nore },
  { 'i', '<c-e>',            '<Esc>A',                                                    nore },
  { 'i', '<m-o>',            '<Esc>o',                                                    nore },
  { 'i', '<m-O>',            '<Esc>O',                                                    nore },
  { 'n', '<m-d>',            '"_diw',                                                     nore },
  { 'n', '<m-r>',            '"_ciw',                                                     nore },
  { 'n', 'gV',               "V']",                                                       nore },
  { 'i', ',z',               '<ESC>zza',                                                  nore },
  { 'i', ',e',               '<ESC>/<++><CR>:nohlsearch<CR>c4l',                          nore },

  -- command keymaps
  -- { 'c', '<up>',        '<c-p>',   nore },
  -- { 'c', '<down>',      '<c-n>',   nore },
  { 'c', '<c-a>',            '<home>',                                                    nore },
  { 'c', '<c-e>',            '<end>',                                                     nore },
  { 'c', '<c-j>',            '<down>',                                                    nore },
  { 'c', '<c-k>',            '<up>',                                                      nore },
  { 'c', '<c-h>',            '<left>',                                                    nore },
  { 'c', '<c-l>',            '<right>',                                                   nore },
  { 'c', 'q1',               'q!',                                                        nore },

  -- Window management
  { 'n', '<LEADER>h',        '<c-w>h',                                                    nore },
  { 'n', '<LEADER>l',        '<c-w>l',                                                    nore },
  { 'n', '<LEADER>k',        '<c-w>k',                                                    nore },
  { 'n', '<LEADER>j',        '<c-w>j',                                                    nore },
  { 'n', '<LEADER>w',        '<c-w>w',                                                    nore },
  { 'n', 's=',               '<c-w>=',                                                    nore },
  { 'n', 'sk',               ':set nosplitbelow<CR>:split<CR>:set splitbelow<CR>',        nore },
  { 'n', 'sj',               ':set splitbelow<CR>:split<CR>',                             nore },
  { 'n', 'sh',               ':set nosplitright<CR>:vsplit<CR>:set splitright<CR>',       nore },
  { 'n', 'sl',               ':set splitright<CR>:vsplit<CR>',                            nore },
  { 'n', '<m-up>',           ':res +5<CR>',                                               nore },
  { 'n', '<m-down>',         ':res -5<CR>',                                               nore },
  { 'n', '<m-right>',        "winnr() <= winnr('$') - winnr() ? '<c-w>10>' : '<c-w>10<'", { noremap = true, expr = true } },
  { 'n', '<m-left>',         "winnr() <= winnr('$') - winnr() ? '<c-w>10<' : '<c-w>10>'", { noremap = true, expr = true } },

  -- Tab management
  { 'n', 'tn',               ':tabe<CR>',                                                 nore },
  { 'n', 'th',               ':-tabnext<CR>',                                             nore },
  { 'n', 'tl',               ':+tabnext<CR>',                                             nore },
  { 'n', '<LEADER><LEADER>', '<Esc>/<++><CR>:nohlsearch<CR>c4l',                          nore },
  { 'n', '<LEADER>/',        ':set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>',        nore },

})

-- 重设tab长度
G.cmd('command! -nargs=* SetTab call SwitchTab(<q-args>)')
G.cmd([[
    fun! SwitchTab(tab_len)
        if !empty(a:tab_len)
            let [&shiftwidth, &softtabstop, &tabstop] = [a:tab_len, a:tab_len, a:tab_len]
        else
            let l:tab_len = input('input shiftwidth: ')
            if !empty(l:tab_len)
                let [&shiftwidth, &softtabstop, &tabstop] = [l:tab_len, l:tab_len, l:tab_len]
            endif
        endif
        redraw!
        echo printf('shiftwidth: %d', &shiftwidth)
    endf
]])

-- 折叠
G.map({
  { 'n', '--', "foldclosed(line('.')) == -1 ? ':call MagicFold()<cr>' : 'za'",
    { noremap = true, silent = true, expr = true } },
  { 'v', '-', 'zf', { noremap = true } },
})
G.cmd([[
    fun! MagicFold()
        let l:line = trim(getline('.'))
        if l:line == '' | return | endif
        let [l:up, l:down] = [0, 0]
        if l:line[0] == '}'
            exe 'norm! ^%'
            let l:up = line('.')
            exe 'norm! %'
        endif
        if l:line[len(l:line) - 1] == '{'
            exe 'norm! $%'
            let l:down = line('.')
            exe 'norm! %'
        endif
        try
            if l:up != 0 && l:down != 0
                exe 'norm! ' . l:up . 'GV' . l:down . 'Gzf'
            elseif l:up != 0
                exe 'norm! V' . l:up . 'Gzf'
            elseif l:down != 0
                exe 'norm! V' . l:down . 'Gzf'
            else
                exe 'norm! za'
            endif
        catch
            redraw!
        endtry
    endf
]])

-- jump $ ^ 0
G.map({
  { 'n', 'L', ':call MagicMove()<cr>', { noremap = true, silent = true } },
})
G.cmd([[
    fun! MagicMove()
        let [l:first, l:head] = [1, len(getline('.')) - len(substitute(getline('.'), '^\s*', '', 'G')) + 1]
        let l:before = col('.')
        exe l:before == l:first && l:first != l:head ? 'norm! ^' : 'norm! $'
        let l:after = col('.')
        if l:before == l:after
            exe 'norm! 0'
        endif
    endf
]])

-- Camelcase
G.map({ { 'v', 'T', ':call ToggleHump()<CR>', { noremap = true, silent = true } }, })
G.cmd([[
    fun! ToggleHump()
        let [l, c1, c2] = [line('.'), col("'<"), col("'>")]
        let line = getline(l)
        let w = line[c1 - 1 : c2 - 2]
        let w = w =~ '_' ? substitute(w, '\v_(.)', '\u\1', 'g') : substitute(substitute(w, '\v^(\u)', '\l\1', 'g'), '\v(\u)', '_\l\1', 'g')
        call setbufline('%', l, printf('%s%s%s', c1 == 1 ? '' : line[:c1-2], w, c2 == 1 ? '' : line[c2-1:]))
        call cursor(l, c1)
    endf
]])

-- Compile function
G.map({ { 'n', ',r', ':call CompileRunGcc()<CR>', nore } })
G.cmd([[
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
]])

-- yapf format py
G.map({ { 'n', ',y', ':call YapfFIle()<CR>', nore } })
G.cmd([[
func! YapfFIle()
  silent exec "!yapf -i --style \"{SPACES_BEFORE_COMMENT:1}\" %:p"
  " :term yapf -i --style "{SPACES_BEFORE_COMMENT:1}" %
endfunc
]])

G.map({ { 'v', ',y', ':call YapfFIleV()<CR>', nore } })
G.cmd([[
func! YapfFIleV()
  let start = line("'<")
  let end = line("'>")
  silent exec "!yapf -i --style \"{SPACES_BEFORE_COMMENT:1}\" -l ".start."-".end." %:p"
endfunc
]])

-- rr
G.map({
  { 'n', "<LEADER>r'",  ":call HandleSpaceWords(\"''\", ', ')<cr>",             nore },
  { 'n', "<LEADER>r\"", ":call HandleSpaceWords('\"\"', ', ')<cr>",             nore },
  { 'n', "<LEADER>r}",  ":call HandleSpaceWords(\"''\", ', ', '{}')<cr>",       nore },
  { 'n', "<LEADER>r}",  ":call HandleSpaceWords(\"''\", ', ', '[]')<cr>",       nore },
  { 'n', "<LEADER>rr",  ":call HandleSpaceWords(\"''\", ', ', '')<LEFT><LEFT>", nore },
  { 'n', "<LEADER>rg",  ":call HandleSpaceWordsToggle()<CR>",                   nore },
})
G.cmd([[
  function! GetPline(flag)
    let current_line = getline(line('.'))
    let cls = []
    if a:flag == 1 && col('.') != 1
      let cls = current_line[:col('.')-2] . substitute(current_line[col('.')-1:], '\s', '@@', 'g')
    else
      let cls = current_line
    endif
    let cls = split(cls, '\s')
    return cls
  endfunc

  function! SetPline(line, flag)
    let res = a:line
    if a:flag == 1
      let res = substitute(res, '@@', ' ', 'g')
    endif
    call setline(line('.'), res)
  endfunc

  function! HandleSpaceWords(pair, sep, ...)
      let flag = g:handle_space_words_enable
      let cls = GetPline(flag)
      let nls = []
      for cl in cls
        let cl = a:pair[0] . cl . a:pair[1]
        call add(nls, cl)
      endfor
      let res = join(nls, a:sep)
      if a:0 >= 1
        let res = a:1[0] . res . a:1[1] . (a:0 == 2 ? a:2 : '')
      endif
      call SetPline(res, flag)
  endfunc

  function! HandleSpaceWordsToggle()
    let g:handle_space_words_enable = g:handle_space_words_enable == 1 ? 0 : 1
    if g:handle_space_words_enable == 1
      echo "HandleSpaceWords Enabled"
    else
      echo "HandleSpaceWords Disabled"
    endif
  endfunc
]])

-- { '<++>', '<++>', '<++>', <++> },
-- :verbose map $target_key
