-- lua/lazy/indent.lua
local M = {}

function M.setup()
    local rainbow_colors = {
        "RainbowRed", "RainbowYellow", "RainbowBlue",
        "RainbowOrange", "RainbowGreen", "RainbowViolet", "RainbowCyan",
    }

    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    require("ibl").setup({
        -- 1. indent 部分：保持单色或柔和的缩进线
        indent = {
            char = "│",
            -- 如果想彻底隐藏非作用域的缩进线，可以将 highlight 设为空表 {}
            highlight = { "Comment" }, 
        },
        -- 2. scope 部分：让光标所在的代码块使用彩虹色
        scope = {
            enabled = true,
            highlight = rainbow_colors,
            show_start = true, -- 可在作用域起始位置显示一条线
            show_end = true,
        },
    })
end

return M
