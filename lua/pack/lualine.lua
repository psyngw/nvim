local G = require('G')
local M = {}

function M.config()
  -- nothing
end

function M.setup()
  require("lualine").setup {
    options = {
      -- theme = "newpaper-dark",
      theme = "auto",
      -- empty with newpaper colorscheme
      -- section_separators = { "", "" },
      -- component_separators = { left = "♦", right = "♦" }
    },
    sections = {
      lualine_b = {
        { "branch", icon = "" },
        {
          "diff",
          colored = true,
          diff_color = {
            added    = { fg = "#28A745" },
            modified = { fg = "#D59834" },
            removed  = { fg = "#D73A49" }
          },
          symbols = {
            added    = " ",
            modified = " ",
            removed  = " "
          }
        },
        {
          "diagnostics",
          sources = { "coc" },
          sections = { "error", "warn", "info", "hint" },
          diagnostics_color = {
            error = { fg = "#AF0000" },
            warn  = { fg = "#D75F00" },
            info  = { fg = "#0087AF" },
            hint  = { fg = "#008700" }
          },
          symbols = {
            error = " ",
            warn  = " ",
            info  = " ",
            hint  = " "
          }
        }
      },
      lualine_x = { 'filetype', 'encoding', 'fileformat' },
      lualine_y = { 'hostname', 'progress' },
      lualine_z = { 'location' }
    },
  }
end

return M
