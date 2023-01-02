local G = require('G')
local M = {}

function M.config()
  -- noting
end

function M.setup()
  G.map({
    { 'n', '<LEADER>cn', 'gcc', {} },
    { 'v', '<LEADER>cn', 'gc', {} },
  })
end

return M
