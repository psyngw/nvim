local G = require('G')
local M = {}

function M.config()
  -- nothing
end

function M.setup()
  require('tokyonight').setup {
    style = "day",
    lualine_bold = true,
    -- transparent = true -- use 'xiyaowong/nvim-transparent' instead
  }
  G.cmd([[
    colorscheme tokyonight-day
  ]])
end

return M
