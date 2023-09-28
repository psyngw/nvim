local G = require('G')
local M = {}

function M.config()
  G.g.rnvimr_enable_ex = 1
  G.g.rnvimr_pick_enable = 1
  G.g.rnvimr_draw_border = 1
  G.cmd([[
      highlight link RnvimrNormal CursorLine
      let g:rnvimr_action = {
                  \ '<C-t>': 'NvimEdit tabedit',
                  \ '<C-o>': 'NvimEdit split',
                  \ '<C-v>': 'NvimEdit vsplit',
                  \ 'gw': 'JumpNvimCwd',
                  \ 'yw': 'EmitRangerCwd'
                  \ }
      let g:rnvimr_layout = {
                  \ 'relative': 'editor',
                  \ 'width': float2nr(round(0.7 * &columns)),
                  \ 'height': float2nr(round(0.7 * &lines)),
                  \ 'col': float2nr(round(0.15 * &columns)),
                  \ 'row': float2nr(round(0.15 * &lines)),
                  \ 'style': 'minimal'
                  \ }
    ]])
  -- FullScrren if u like
  -- let g:rnvimr_layout = { 'relative': 'editor',
  --             \ 'width': &columns,
  --             \ 'height': &lines,
  --             \ 'col': 0,
  --             \ 'row': 0,
  --             \ 'style': 'minimal' }
  G.map({ { 'n', 'R', ':RnvimrToggle<CR><C-><C-n>:RnvimrResize 0<CR>', { silent = true } } })
  -- G.g.rnvimr_action = {
  --              '<C-t>'= 'NvimEdit tabedit',
  --              '<C-o>'= 'NvimEdit split',
  --              '<C-v>'= 'NvimEdit vsplit',
  --              'gw'= 'JumpNvimCwd',
  --              'yw'= 'EmitRangerCwd'
  --              }
  -- G.g.rnvimr_layout = { 'relative'= 'editor',
  --              'width'= &columns,
  --              'height'= &lines,
  --              'col'= 0,
  --              'row'= 0,
  --              'style'= 'minimal' }
end

function M.setup()
  -- nothing
end

return M
