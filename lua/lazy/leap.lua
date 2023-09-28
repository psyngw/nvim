local G = require('G')
local M = {}

function M.config()
  -- nothing
end

function M.setup()
  -- require('leap').add_default_mappings()
  -- require('leap').opts.highlight_unlabeled_phase_one_targets = true
  vim.keymap.set({ 'n', 'o', 'x' }, 'f', '<Plug>(leap-forward-to)')
  vim.keymap.set({ 'n', 'o', 'x' }, 'F', '<Plug>(leap-backward-to)')
  vim.keymap.set({ 'n', 'o', 'x' }, 'sf', '<Plug>(leap-cross-window)')
end

return M
