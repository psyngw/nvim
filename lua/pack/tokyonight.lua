local G = require('G')
local M = {}

function M.config()
  -- nothing
end

function M.setup()
  G.cmd([[
  colorscheme tokyonight-day
  ]])
end

return M
