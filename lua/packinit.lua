local G = require('G')
local packer_bootstrap = false
local install_path = G.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compiled_path = G.fn.stdpath('config') .. '/plugin/packer_compiled.lua'
if G.fn.empty(G.fn.glob(install_path)) > 0 then
  print('Installing packer.nvim...')
  G.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  G.fn.system({ 'rm', '-rf', compiled_path })
  G.cmd [[packadd packer.nvim]]
  packer_bootstrap = true
end

-- 所有插件配置分 config 和 setup 部分
-- config 发生在插件载入前 一般为 let g:xxx = xxx 或者 hi xxx xxx 或者 map x xxx 之类的 配置
-- setup  发生在插件载入后 一般为 require('xxx').setup() 之类的配置
require('packer').startup({
  function(use)
    -- packer 管理自己的版本
    use { 'wbthomason/packer.nvim' }

    -- 启动时间分析
    use { "dstein64/vim-startuptime", cmd = "StartupTime" }

    -- 中文help doc
    use { 'yianwillis/vimcdoc', event = 'VimEnter' }

    -- 快速选中内容插件
    use { 'gcmt/wildfire.vim', event = 'CursorHold' }

    -- 多光标插件
    require('pack/vim-visual-multi').config()
    use { 'mg979/vim-visual-multi', config = "require('pack/vim-visual-multi').setup()", event = 'CursorHold' }

    -- 数据库可视化UI
    -- require('pack/vim-dadbod').config()
    -- use { 'tpope/vim-dadbod' }
    -- use { 'kristijanhusak/vim-dadbod-ui', config = "require('pack/vim-dadbod').setup()", after = 'vim-dadbod' }

    -- coc-nvim
    require('pack/coc').config()
    use { 'neoclide/coc.nvim', config = "require('pack/coc').setup()", branch = 'release' }

    -- github copilot
    -- require('pack/copilot').config()
    -- use { 'github/copilot.vim', config = "require('pack/copilot').setup()", event = 'InsertEnter' }

    -- 浮动终端
    require('pack/vim-floaterm').config()
    use { 'voldikss/vim-floaterm', config = "require('pack/vim-floaterm').setup()" }

    -- ranger
    require('pack/ranger').config()
    use { 'kevinhwang91/rnvimr', config = "require('pack/ranger').setup()" }

    -- Gitgutter
    require('pack/gitgutter').config()
    use { 'airblade/vim-gitgutter', config = "require('pack/gitgutter').setup()" }

    -- fzf
    require('pack/fzf').config()
    use { 'junegunn/fzf' }
    use { 'junegunn/fzf.vim', config = "require('pack/fzf').setup()", run = 'cd ~/.fzf && ./install --all', after = "fzf" }

    -- tree-sitter
    require('pack/tree-sitter').config()
    use { 'nvim-treesitter/nvim-treesitter', config = "require('pack/tree-sitter').setup()", run = ':TSUpdate' }
    -- use { 'nvim-treesitter/playground', after = 'nvim-treesitter' }
    use { 'p00f/nvim-ts-rainbow' }

    -- markdown预览插件 导航生成插件
    -- require('pack/markdown').config()
    -- use { 'mzlogin/vim-markdown-toc', ft = 'markdown' }
    -- use { 'iamcco/markdown-preview.nvim', config = "require('pack/markdown').setup()", run = 'cd app && yarn install', cmd = 'MarkdownPreview', ft = 'markdown' }

    -- 文件管理器
    require('pack/nvim-tree').config()
    use { 'kyazdani42/nvim-tree.lua', config = "require('pack/nvim-tree').setup()",
      cmd = { 'NvimTreeToggle', 'NvimTreeFindFileToggle' } }

    -- 状态栏 & 标题栏
    require('pack/lualine').config()
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = "require('pack/lualine').setup()" }
    -- Comment
    require('pack/comment').config()
    use { 'tomtom/tcomment_vim', config = "require('pack/comment').setup()" }

    -- Theme
    require('pack/tokyonight').config()
    use { 'folke/tokyonight.nvim', config = "require('pack/tokyonight').setup()" }

    -- InterestingWords
    require('pack/vim-interestingwords').config()
    use { 'lfv89/vim-interestingwords', config = "require('pack/vim-interestingwords').setup()" }

    -- Startup
    require('pack/startify').config()
    use { 'mhinz/vim-startify', config = "require('pack/startify').setup()" }

    require('pack/psyngw').config()
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-repeat' }
    use { 'tpope/vim-speeddating' }
    use { 'svermeulen/vim-subversive' }
    use { 'Yggdroot/indentLine' }
    use { 'jiangmiao/auto-pairs' }

    -- use { 'luochen1990/rainbow' }
  end,
  config = {
    git = { clone_timeout = 120, depth = 1 },
    display = {
      working_sym = '[ ]', error_sym = '[✗]', done_sym = '[✓]', removed_sym = ' - ', moved_sym = ' → ',
      header_sym = '─',
      open_fn = function() return require("packer.util").float({ border = "rounded" }) end
    }
  }
})

if packer_bootstrap then
  require('packer').sync()
end
