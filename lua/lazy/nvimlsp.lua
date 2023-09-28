local G = require('G')
local M = {}

function M.config()
  local cf = {
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim' },           -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional
        {
          "folke/trouble.nvim",
          opts = {
            use_diagnostic_signs = true,
            action_keys = {
              close = "<esc>",
            },
          },
          dependencies = { "nvim-tree/nvim-web-devicons" },
        },
        {
          'j-hui/fidget.nvim',
          tag = "legacy"
        },

        -- Autocompletion
        -- {'hrsh7th/nvim-cmp'},     -- Required
        -- {'hrsh7th/cmp-nvim-lsp'}, -- Required
        -- {'L3MON4D3/LuaSnip'},     -- Required

        -- Others
        "folke/neodev.nvim",
        "ray-x/lsp_signature.nvim",
      },

      config = function()
        local lsp = require('lsp-zero').preset({})
        M.lsp = lsp

        lsp.ensure_installed({
          'eslint',
          'gopls',
          'jsonls',
          'pyright',
        })

        lsp.on_attach(function(client, bufnr)
          lsp.default_keymaps({ buffer = bufnr })
          client.server_capabilities.semanticTokensProvider = nil
          require("lazy/autocomplete").configfunc()
          vim.diagnostic.config({
            severity_sort = true,
            underline = true,
            signs = true,
            virtual_text = false,
            update_in_insert = false,
            float = true,
          })
        end)

        lsp.set_sign_icons({
          error = '✘',
          warn = '▲',
          hint = '⚑',
          info = '»'
        })

        lsp.set_server_config({
          on_init = function(client)
            client.server_capabilities.semanticTokensProvider = nil
          end,
        })

        local lspconfig = require('lspconfig')

        lspconfig.lua_ls.setup({
          on_attach = function()
          end,
          settings = {
            Lua = {
              diagnostics = {
                globals = {
                  'vim',
                  'require'
                },
              },
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace"
              }
            }
          }
        })
        -- require("config.lsp.lua").setup(lspconfig, lsp)
        -- require("config.lsp.json").setup(lspconfig, lsp)
        -- require("config.lsp.flutter").setup(lsp)
        -- require("config.lsp.html").setup(lspconfig, lsp)
        --
        -- lspconfig.pyright.setup {
        --   on_attach = on_attach,
        --   flags = lsp_flags,
        --   capabilities = capabilities,
        --   settings = {
        --     python = {
        --       analysis = {
        --         autoSearchPaths = true,
        --         diagnosticMode = "workspace",
        --         useLibraryCodeForTypes = true,
        --         typeCheckingMode = "off",
        --       }
        --     }
        --   }
        -- }
        lspconfig.pyright.setup {}
        lspconfig.efm.setup {
          -- init_options = { documentFormatting = true, documentRangeFormatting = true },
          init_options = { documentFormatting = true }, -- 好像Range没啥用啊，还是全文件操作，看文档是对js有用来着
          settings = {
            rootMarkers = { '.git' },
            languages = {
              -- lua = {{formatCommand = 'lua-format -i', formatStdin = true}},
              python = { { formatCommand = 'yapf --style "{SPACES_BEFORE_COMMENT:1}"', formatStdin = true } }
            }
          }
        }

        lsp.setup()
        require("fidget").setup({})

        local lsp_defaults = lspconfig.util.default_config
        lsp_defaults.capabilities = vim.tbl_deep_extend(
          'force',
          lsp_defaults.capabilities,
          require('cmp_nvim_lsp').default_capabilities()
        )

        -- F.configureDocAndSignature()
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
          vim.lsp.handlers.signature_help, {
            silent = true,
            focusable = false,
            border = "rounded",
          }
        )
        local group = vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
        vim.api.nvim_create_autocmd({ "CursorHold" }, {
          pattern = "*",
          callback = function()
            vim.diagnostic.open_float({
              scope = "cursor",
              focusable = false,
              close_events = {
                "CursorMoved",
                "CursorMovedI",
                "BufHidden",
                "InsertCharPre",
                "WinLeave",
              },
            })
          end,
          group = group,
        })
        -- F.configureKeybinds()
        vim.api.nvim_create_autocmd('LspAttach', {
          desc = 'LSP actions',
          callback = function(event)
            local opts = { buffer = event.buf, noremap = true, nowait = true }

            vim.keymap.set('n', '<a-w>', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gD', ':tab sp<CR><cmd>lua vim.lsp.buf.definition()<cr>', opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('i', '<a-w>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'x' }, '<leader>fo', function() vim.lsp.buf.format({ async = true }) end, opts)
            -- vim.keymap.set('n', '<leader>aw', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', "<leader>,", vim.lsp.buf.code_action, opts)
            -- vim.keymap.set('x', '<leader>aw', vim.lsp.buf.range_code_action, opts)
            -- vim.keymap.set('x', "<leader>,", vim.lsp.buf.range_code_action, opts)
            vim.keymap.set('n', '<leader>tt', ':Trouble<cr>', opts)
            vim.keymap.set('n', '<leader>-', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', '<leader>=', vim.diagnostic.goto_next, opts)
          end
        })

        local format_on_save_filetypes = {
          python = true,
          json = true,
          go = true,
          lua = true,
        }

        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*",
          callback = function()
            if format_on_save_filetypes[vim.bo.filetype] then
              local lineno = vim.api.nvim_win_get_cursor(0)
              vim.lsp.buf.format({ async = false })
              vim.api.nvim_win_set_cursor(0, lineno)
            end
          end,
        })
      end,
    }
  }
  return cf
end

function M.setup()
  -- nothing
end

return M
