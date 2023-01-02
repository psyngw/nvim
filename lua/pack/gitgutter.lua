local G = require('G')
local M = {}

function M.config()
  G.g.gitgutter_sign_allow_clobber = 0
  G.g.gitgutter_map_keys = 0
  G.g.gitgutter_override_sign_column_highlight = 0
  G.g.gitgutter_preview_win_floating = 1
  G.g.gitgutter_sign_added = '▎'
  G.g.gitgutter_sign_modified = '░'
  -- G.g.gitgutter_sign_removed = '▏'
  G.g.gitgutter_sign_removed = '▶'
  G.g.gitgutter_sign_removed_first_line = '▔'
  G.g.gitgutter_sign_modified_removed = '▒'
  G.g.gitgutter_floating_window_options = { border = "rounded", relative = 'cursor', width = 10, height = 10,
    bufpos = { 0, 0 }, row = 2, style = "minimal", }
  -- autocmd BufWritePost * GitGutter
  G.map({
    { 'n', '<LEADER>gf', ':GitGutterFold<CR>', {} },
    { 'n', '<LEADER>gh', ':GitGutterPreviewHunk<CR>', {} },
    { 'n', '<LEADER>gu', ':GitGutterUndoHunk<CR>', {} },
    { 'n', '<LEADER>gd', ':GitGutterDiffOrig<CR>', {} },
    { 'n', '(', ':GitGutterPrevHunk<CR>', {} },
    { 'n', ')', ':GitGutterNextHunk<CR>', {} },
  })
end

function M.setup()
  -- nothing
end

return M
