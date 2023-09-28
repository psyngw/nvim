local G = require('G')
local lazypath = G.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not G.loop.fs_stat(lazypath) then
  G.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
G.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { "dstein64/vim-startuptime" },
  { "nvim-tree/nvim-web-devicons" },
  { "yianwillis/vimcdoc" },
  { "gcmt/wildfire.vim" },
  {
    "gelguy/wilder.nvim",
    config = function()
      local wilder = require('wilder')
      wilder.setup {
        modes = { ':' },
        next_key = '<Tab>',
        previous_key = '<S-Tab>',
      }
      wilder.set_option('renderer', wilder.popupmenu_renderer(
        wilder.popupmenu_palette_theme({
          highlights = {
            border = 'Normal', -- highlight to use for the border
          },
          left = { ' ', wilder.popupmenu_devicons() },
          right = { ' ', wilder.popupmenu_scrollbar() },
          border = 'rounded',
          max_height = '75%',      -- max height of the palette
          min_height = 0,          -- set to the same as 'max_height' for a fixed height window
          prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
          reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
        })
      ))
      wilder.set_option('pipeline', {
        wilder.branch(
          wilder.cmdline_pipeline({
            language = 'vim',
            fuzzy = 1,
          }), wilder.search_pipeline()
        ),
      })
    end
  },

  {
    "mg979/vim-visual-multi",
    init = function()
      require('lazy/vim-visual-multi').config()
    end,
    config = function()
      require('lazy/vim-visual-multi').setup()
    end,
    event = 'CursorHold'
  },

  {
    "SirVer/ultisnips",
    lazy = false,
    dependencies = {
      "honza/vim-snippets",
    },
    config = function()
      vim.g.UltiSnipsSnippetDirectories = {
        "~/.config/nvim/snippets/Ultisnips"
      }
    end,
  },
  { require('lazy/autocomplete').config },
  require('lazy/nvimlsp').config(),

  {
    "voldikss/vim-floaterm",
    init = function()
      require('lazy/vim-floaterm').config()
    end,
    config = function()
      require('lazy/vim-floaterm').setup()
    end
  },

  -- TODO: ranger -> joshuto
  {
    "kevinhwang91/rnvimr",
    init = function()
      require('lazy/ranger').config()
    end,
    config = function()
      require('lazy/ranger').setup()
    end
  },

  {
    "airblade/vim-gitgutter",
    init = function()
      require('lazy/gitgutter').config()
    end,
    config = function()
      require('lazy/gitgutter').setup()
    end
  },

  { "junegunn/fzf" },
  {
    "junegunn/fzf.vim",
    init = function()
      require('lazy/fzf').config()
    end,
    config = function()
      require('lazy/fzf').setup()
    end,
    build = 'cd ~/.fzf && ./install --all',
  },

  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      require('lazy/tree-sitter').config()
    end,
    config = function()
      require('lazy/tree-sitter').setup()
    end,
    build = ':TSUpdate',
    lazy = false,
  },
  { "p00f/nvim-ts-rainbow" },
  { "nvim-treesitter/nvim-treesitter-context" },

  -- TODO: markdown preview
  {},


  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    init = function()
      require('lazy/lualine').config()
    end,
    config = function()
      require('lazy/lualine').setup()
    end,
  },

  {
    "romgrk/barbar.nvim",
    dependencies = 'nvim-tree/nvim-web-devicons',
    init = function()
      require('lazy/barbar').config()
    end,
    config = function()
      require('lazy/barbar').setup()
    end,
  },

  {
    "tomtom/tcomment_vim",
    init = function()
      require('lazy/comment').config()
    end,
    config = function()
      require('lazy/comment').setup()
    end
  },

  {
    "folke/tokyonight.nvim",
    config = function()
      require('lazy/tokyonight').setup()
    end
  },

  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require('nvim-highlight-colors').setup {}
    end
  },
  {
    "xiyaowong/nvim-transparent",
    config = function()
      require('transparent').setup {}
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require('todo-comments').setup {}
    end
  },

  {
    "lfv89/vim-interestingwords",
    init = function()
      require('lazy/vim-interestingwords').config()
    end,
    config = function()
      require('lazy/vim-interestingwords').setup()
    end
  },

  {
    "mhinz/vim-startify",
    init = function()
      require('lazy/startify').config()
    end,
    config = function()
      require('lazy/startify').setup()
    end
  },


  -- {
  --   "ggandor/leap.nvim",
  --   init = function()
  --     require('lazy/leap').config()
  --   end,
  --   config = function()
  --     require('lazy/leap').setup()
  --   end
  -- },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        char = {
          enabled = false
        }
      }
    },
    keys = {
      -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",          function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },


  -- {
  --   "gbprod/yanky.nvim",
  --   dependencies = {
  --     "kkharji/sqlite.lua",
  --   },
  --   config = function()
  --     require('lazy/yanky').setup()
  --   end
  -- },

  -- require neovim > v10.0
  -- {
  --   "Bekaboo/dropbar.nvim",
  --   config = function()
  --     require('lazy/dropbar').setup()
  --   end
  -- },

  {
    "rcarriga/nvim-notify",
    config = function()
      require('lazy/notify').setup()
    end
  },

  {
    "tpope/vim-surround",
    init = function()
      require('lazy/psyngw').config()
    end
  },
  { "tpope/vim-repeat" },
  { "tpope/vim-speeddating" },
  -- { "svermeulen/vim-subversive" },
  { "Yggdroot/indentLine" },
  { "jiangmiao/auto-pairs" },

  -- test
  {
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure({
        providers = {
          -- 'lsp',
          -- 'treesitter',
          'regex',
        },
      })
      -- vim.cmd("hi IlluminatedWordText guibg=#393E4D gui=none")
    end
  },
  -- {
  -- 	"dkarter/bullets.vim",
  -- 	lazy = false,
  -- 	ft = { "markdown", "txt" },
  -- },
  -- {
  -- 	"psliwka/vim-smoothie",
  -- 	init = function()
  -- 		vim.cmd([[nnoremap <unique> <C-e> <cmd>call smoothie#do("\<C-D>") <CR>]])
  -- 		vim.cmd([[nnoremap <unique> <C-u> <cmd>call smoothie#do("\<C-U>") <CR>]])
  -- 	end
  -- },
  -- {
  -- 	"NvChad/nvim-colorizer.lua",
  -- 	opts = {
  -- 		filetypes = { "*" },
  -- 		user_default_options = {
  -- 			RGB = true,       -- #RGB hex codes
  -- 			RRGGBB = true,    -- #RRGGBB hex codes
  -- 			names = true,     -- "Name" codes like Blue or blue
  -- 			RRGGBBAA = false, -- #RRGGBBAA hex codes
  -- 			AARRGGBB = true,  -- 0xAARRGGBB hex codes
  -- 			rgb_fn = false,   -- CSS rgb() and rgba() functions
  -- 			hsl_fn = false,   -- CSS hsl() and hsla() functions
  -- 			css = false,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  -- 			css_fn = false,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
  -- 			-- Available modes for `mode`: foreground, background,  virtualtext
  -- 			mode = "virtualtext", -- Set the display mode.
  -- 			-- Available methods are false / true / "normal" / "lsp" / "both"
  -- 			-- True is same as normal
  -- 			tailwind = true,
  -- 			sass = { enable = false },
  -- 			virtualtext = "■",
  -- 		},
  -- 		-- all the sub-options of filetypes apply to buftypes
  -- 		buftypes = {},
  -- 	}
  -- },
  -- { 'theniceboy/antovim', lazy = false, },
  -- { 'gcmt/wildfire.vim',  lazy = false, },
  {
    "fedepujol/move.nvim",
    config = function()
      local opts = { noremap = true, silent = true }
      -- Normal-mode commands
      vim.keymap.set('n', '<c-j>', ':MoveLine(1)<CR>', opts)
      vim.keymap.set('n', '<c-k>', ':MoveLine(-1)<CR>', opts)

      -- Visual-mode commands
      vim.keymap.set('v', '<c-j>', ':MoveBlock(1)<CR>', opts)
      vim.keymap.set('v', '<c-k>', ':MoveBlock(-1)<CR>', opts)
    end
  },
  {
    "gbprod/substitute.nvim",
    config = function()
      local substitute = require("substitute")
      substitute.setup({
        -- on_substitute = require("yanky.integration").substitute(),
        highlight_substituted_text = {
          enabled = true,
          timer = 200,
        },
      })
      vim.keymap.set("n", "s", substitute.operator, { noremap = true })
      -- sw
      -- vim.keymap.set("n", "sH", function() substitute.operator({ motion = "e" }) end, { noremap = true })
      vim.keymap.set("x", "s", require('substitute.range').visual, { noremap = true })
      vim.keymap.set("n", "ss", substitute.line, { noremap = true })
      -- s$
      -- vim.keymap.set("n", "sI", substitute.eol, { noremap = true })
      vim.keymap.set("x", "s", substitute.visual, { noremap = true })
    end
  },
  -- fole
  -- {
  -- 	"kevinhwang91/nvim-ufo",
  -- 	dependencies = { "kevinhwang91/promise-async", },
  -- 	config = function() require('ufo').setup() end
  -- },
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function()
  --     require("nvim-autopairs").setup({})
  --   end
  -- },

}, {
})
