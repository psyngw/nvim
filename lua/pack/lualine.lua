local G = require('G')
local M = {}

function M.config()
  -- nothing
end

function M.setup()
  require('lualine').setup {
    options = {
      theme = 'auto',
    }
  }
end

return M
