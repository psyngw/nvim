local M = {}

M.config = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- 自动安装 LSP、Formatter 等工具
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",

      -- 进度条提示 (更新到支持的写法)
      { "j-hui/fidget.nvim", opts = {} },

      -- 替代之前的 neodev.nvim，提供更好的 Lua (Neovim API) 补全
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "luvit-meta/library", words = { "vim%.uv" } },
          },
        },
      },
      { "Bilal2453/luvit-meta", lazy = true }, -- lazydev 的依赖

      -- 提供 LSP 能力给自动补全
      "hrsh7th/cmp-nvim-lsp",

      -- 问题诊断列表
      {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
          use_diagnostic_signs = true,
          action_keys = { close = "<esc>" },
        },
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      -- 1. 配置诊断 (Diagnostics) UI
      local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "»" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.diagnostic.config({
        severity_sort = true,
        underline = true,
        signs = true,
        virtual_text = false, -- 关闭行尾提示，使用悬浮窗
        update_in_insert = false,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      -- 修改 Hover 和 Signature 窗口的边框为圆角
      -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
      vim.lsp.config('*', {
        float = {
          border = 'rounded',
        },
      })

      -- 2. 告诉 LSP 服务器我们支持的补全能力 (结合 nvim-cmp)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
      -- 禁用 semanticTokens，这通常会导致代码高亮颜色与 Treesitter 冲突
      capabilities.workspace.semanticTokens = { refreshSupport = false }

      -- 3. 配置服务器并设置自动安装
      mason_lspconfig.setup({
        ensure_installed = {
          "eslint",
          "gopls",
          "jsonls",
          "pyright",
          "lua_ls",
          "efm",
        },
        -- Mason 会自动把下面的 handler 映射到已安装的服务器上
        handlers = {
          -- 默认处理函数 (适用于大部分没有特殊配置的服务器)
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
              on_init = function(client)
                client.server_capabilities.semanticTokensProvider = nil
              end,
            })
          end,

          -- Lua 专用配置
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  workspace = { checkThirdParty = false },
                  completion = { callSnippet = "Replace" },
                  telemetry = { enable = false },
                },
              },
            })
          end,

          -- Python (Pyright) 专用配置
          ["pyright"] = function()
            lspconfig.pyright.setup({
              capabilities = capabilities,
              settings = {
                python = {
                  analysis = {
                    typeCheckingMode = "off",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                  },
                },
              },
            })
          end,

          -- EFM (用于 yapf 格式化等)
          ["efm"] = function()
            lspconfig.efm.setup({
              capabilities = capabilities,
              init_options = { documentFormatting = true },
              filetypes = { "python" }, -- 确保只在特定的文件中启动
              settings = {
                rootMarkers = { ".git" },
                languages = {
                  python = {
                    { formatCommand = 'yapf --style "{SPACES_BEFORE_COMMENT:1}"', formatStdin = true }
                  },
                },
              },
            })
          end,
        },
      })

      -- 4. 配置 LSP 快捷键映射和悬浮诊断 (仅在 LSP 附加到当前 Buffer 时生效)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(event)
          local opts = { buffer = event.buf, noremap = true, silent = true }

          -- 快捷键
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", ":tab sp<CR><cmd>lua vim.lsp.buf.definition()<cr>", opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<a-w>", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
          vim.keymap.set("i", "<a-w>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "x" }, "<leader>fo", function() vim.lsp.buf.format({ async = true }) end, opts)
          vim.keymap.set("n", "<leader>,", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>aw", vim.lsp.buf.code_action, opts)
          
          -- Trouble & Diagnostics 快捷键
          vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", opts)
          vim.keymap.set("n", "<leader>-", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "<leader>=", vim.diagnostic.goto_next, opts)

          -- 禁用内置的 SemanticTokens 避免和 Treesitter 打架
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client then
            client.server_capabilities.semanticTokensProvider = nil
          end
        end,
      })

      -- 5. 自动显示诊断悬浮窗 (CursorHold)
      local diag_group = vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
      vim.api.nvim_create_autocmd("CursorHold", {
        pattern = "*",
        callback = function()
          vim.diagnostic.open_float(nil, {
            scope = "cursor",
            focusable = false,
            close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre", "WinLeave" },
          })
        end,
        group = diag_group,
      })

      -- 6. 保存时自动格式化
      local format_on_save_filetypes = { python = true, json = true, go = true, lua = true }
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          if format_on_save_filetypes[vim.bo.filetype] then
            local lineno = vim.api.nvim_win_get_cursor(0)
            -- 同步格式化
            vim.lsp.buf.format({ async = false })
            -- 恢复光标位置
            pcall(vim.api.nvim_win_set_cursor, 0, lineno)
          end
        end,
      })
    end,
  },
}

return M
