local G = require('G')
local M = {}

function M.config()
  G.cmd([[
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
          \ { 'c': '~/.config/nvim/init.lua' },
          \ { 'rgem': '~/repo/gem_mtn/manage.py' },
          \ { 'rgbp': '~/repo/gbp/manage.py' },
          \ { 'rnote': '~/repo/notebook/README.md' },
          \ { 'rime': '~/.config/ibus/rime/flypy_user.txt' },
          \ { 'ra': '~/repo' },
          \]
    let g:startify_session_persistence = 1
    let g:startify_session_dir = '~/.config/nvim/session'
  ]])
end

function M.setup()
end

return M
