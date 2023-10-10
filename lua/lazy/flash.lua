local G = require('G')
local M = {}

function M.config()
  return {
    modes = {
      char = {
        enabled = false,
        keys = { "f", "F" }
      },
      search = {
        enabled = false,
        search = {
          incremental = true,
          trigger = ";",
        }
      }
    }
  }
end

function M.setup()
  -- nothing
end

function M.keys()
  return {
    { "f",       mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
    { "<enter>", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r",       mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
    {
      "R",
      mode = { "o", "x" },
      function() require("flash").treesitter_search() end,
      desc =
      "Treesitter Search"
    },
    -- {
    --   "<c-s>",
    --   mode = { "c" },
    --   function() require("flash").toggle() end,
    --   desc =
    --   "Toggle Flash Search"
    -- },
  }
end

return M
