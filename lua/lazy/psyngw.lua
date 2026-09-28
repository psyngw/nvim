local G = require('G')
local M = {}

function M.config()
  G.map({
    { 'n', 's',  '<plug>(SubversiveSubstitute)',     { noremap = false } },
    { 'n', 'ss', '<plug>(SubversiveSubstituteLine)', {} },
  })
  -- G.g.rainbow_active = 1
  -- Auto pairs
  G.cmd([[
    let g:AutoPairsShortcutToggle = '<M-P>'
    let g:AutoPairsFlyMode = 1
  ]])
  -- Rainbow
  G.cmd([[
    let g:rainbow_delimiters = {
      \ 'strategy': {
          \ '': 'rainbow-delimiters.strategy.global',
          \ 'vim': 'rainbow-delimiters.strategy.local'
      \ },
      \ 'query': {
          \ '': 'rainbow-delimiters',
          \ 'lua': 'rainbow-blocks',
      \ },
      \ 'priority': {
          \ '': 110,
          \ 'lua': 210,
      \ },
      \ 'highlight': [
          \ 'RainbowDelimiterRed',
          \ 'RainbowDelimiterYellow',
          \ 'RainbowDelimiterBlue',
          \ 'RainbowDelimiterOrange',
          \ 'RainbowDelimiterGreen',
          \ 'RainbowDelimiterViolet',
          \ 'RainbowDelimiterCyan',
      \ ],
  \ }
  ]])

  -- My config
  G.cmd('let g:handle_space_words_enable=0')
  G.cmd('source ~/.config/nvim/cursor.vim')
end

function M.setup()
  -- nothing
end

return M
