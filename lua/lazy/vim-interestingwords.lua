local G = require('G')
local M = {}

function M.config()
  G.g.interestingWordsRandomiseColors = 1
  G.g.interestingWordsDefaultMappings = 0
  G.map({
    { 'n', '<LEADER>iw', ":call InterestingWords('n')<cr>", { silent = true, noremap = true } },
    { 'v', '<LEADER>iw', ":call InterestingWords('v')<cr>", { silent = true, noremap = true } },
    { 'n', '<LEADER>iW', ":call UncolorAllWords()<cr>", { silent = true, noremap = true } },
    -- { 'n', 'n', ":call WordNavigation('forward')<cr>", { silent = true, noremap = true } },
    -- { 'n', 'N', ":call WordNavigation('backward')<cr>", { silent = true, noremap = true } },
  })
end

function M.setup()
  -- do nothing
end

return M
