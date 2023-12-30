require('options')
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    tag = "v2.2.0",
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require("treesitter-config")
    end,
    build = ":TSUpdate"
  },
  {
   "nvim-neo-tree/neo-tree.nvim",
   lazy = false,
   priority = 100,
   branch = "v3.x",
   dependencies = {
     "nvim-lua/plenary.nvim",
     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
     "MunifTanjim/nui.nvim",
   },
   config = function()
     require("neotree-config")
   end,
  },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    tag = "v0.8.0",
    keys = { "gcc", { "gc", mode = "v", }, },
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig", 
    tag = 'v0.1.6',
    config = function()
       require("lspconfig-config")
    end,
  },
  { 
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
      -- require("ibl").overwrite({
      --   exclude = {
      --     "*"
      --   },
      --   include = {
      --     "yaml"
      --   }
      -- })
    end,
    -- main = "ibl",
    opts = {}
  },
  {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = true
  },
  {
    "williamboman/mason.nvim",
    config = true
  }
  -- {
  --   'glepnir/template.nvim',
  --   cmd = {'Template','TemProject'},
  --   config = function()
  --     require('template').setup({
  --       temp_dir = '~/.config/nvim/templates',
  --       author = 'qq8244353',
  --       email = 'qq8244353@gmail.com',
  --     })
  --   end,
  -- }
})




---- This file can be loaded by calling `lua require('plugins')` from your init.vim
---- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]
--require('packer').startup(function(use)
--    use 'wbthomason/packer.nvim'
--    use 'shaunsingh/nord.nvim'
--    -- use {
--    --     'nvim-lualine/lualine.nvim',
--    --     requires = {'kyazdani42/nvim-web-devicons', opt = true},
--    --     config = function() require('lualine-config') end
--    -- }
--    -- use {
--    --     'akinsho/bufferline.nvim',
--    --     requires = 'nvim-tree/nvim-web-devicons',
--    --     config = function() require('bufferline-config') end
--    -- }
--    -- use {
--    --     "nvim-neo-tree/neo-tree.nvim",
--    --     branch = "v2.x",
--    --     requires = {
--    --         "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--    --         "MunifTanjim/nui.nvim", {
--    --             -- only needed if you want to use the commands with "_with_window_picker" suffix
--    --             's1n7ax/nvim-window-picker',
--    --             tag = "v1.*",
--    --             config = function() require('neotree-config') end
--    --         }
--    --     }
--    -- }
--    -- use {
--    --     'mhartington/formatter.nvim',
--    --     -- function() require('formatter').setup() end
--    --     config = function() require('formatter-config') end
--    -- }
--    -- use {
--    --     "folke/which-key.nvim",
--    --     config = function()
--    --         vim.o.timeout = true
--    --         vim.o.timeoutlen = 300
--    --         require("whichkey-config")
--    --     end
--    -- }
--    -- use {
--    --     'akinsho/git-conflict.nvim',
--    --     tag = "v1.1.2",
--    --     config = function() require('git-conflict').setup() end
--    -- }
--    -- use {'L3MON4D3/LuaSnip', config = function() require("luasnip-config") end}
--    -- use {
--    --     'numToStr/Comment.nvim',
--    --     config = function() require('comment-config') end
--    -- }
--    -- use {'windwp/nvim-ts-autotag'}
--    -- use {'p00f/nvim-ts-rainbow'}
--    -- use {
--    -- 'nvim-telescope/telescope.nvim',
--    --  tag = '0.1.1',
--    -- requires = {'nvim-lua/plenary.nvim'},
--    -- config = function() require('telescope-config') end
--    -- }
--    -- use {
--    -- "nvim-telescope/telescope-file-browser.nvim",
--    --  -- requires = { 'nvim-telescope/telescope.nvim' },
--    --  config = function() requrie('telescope-file-browser-config') end
--    -- }
--    -- use {'glepnir/dashboard-nvim'}
--    -- use {'xeluxee/competitest.nvim', requires = 'MunifTanjim/nui.nvim'}
--    -- use {'neovim/nvim-lspconfig'}
--    -- use {'hrsh7th/cmp-nvim-lsp'}
--    -- use {'hrsh7th/cmp-buffer'}
--    -- use {'hrsh7th/cmp-path'}
--    -- use {'hrsh7th/cmp-cmdline'}
--    -- use {'hrsh7th/nvim-cmp'}
--    -- use { 'saadparwaiz1/cmp_luasnip' }
--    -- use {"williamboman/mason.nvim"}
--    -- use {"lukas-reineke/indent-blankline.nvim"}
--    -- use {
--    --     'phaazon/hop.nvim',
--    --     branch = 'v2', -- optional but strongly recommended
--    --     config = function()
--    --         -- you can configure Hop the way you like here; see :h hop-config
--    --         require'hop'.setup {keys = 'etovxqpdygfblzhckisuran'}
--    --     end
--    -- }
--    -- use {"jose-elias-alvarez/null-ls.nvim"}
--    -- use {"untitled-ai/jupyter_ascending.vim"}
--    -- use {
--    --     'andymass/vim-matchup',
--    --     setup = function()
--    --         -- may set any options here
--    --         vim.g.matchup_matchparen_offscreen = {method = "popup"}
--    --     end
--    -- }
--    -- -- use {"mg979/vim-visual-multi"}
--    -- use {"glepnir/lspsaga.nvim"}
--    -- use {"sidebar-nvim/sidebar.nvim"}
--    -- use {"williamboman/mason-lspconfig.nvim"}
--    -- use {"gbprod/yanky.nvim"}
--    -- use {"stevearc/dressing.nvim"}
--    -- use {
--    --     "j-hui/fidget.nvim",
--    --     config = function()
--    --         -- you can configure Hop the way you like here; see :h hop-config
--    --         require'fidget'.setup {}
--    --     end
--    -- }
--    -- use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
--    -- use({
--    --     "iamcco/markdown-preview.nvim",
--    --     run = "cd app && npm install",
--    --     setup = function() vim.g.mkdp_filetypes = {"markdown"} end,
--    --     ft = {"markdown"}
--    -- })
--    -- -- use {
--    -- --     "keaising/im-select.nvim",
--    -- --     config = function()
--    -- --         require('im_select').setup({disable_auto_restore = 1})
--    -- --     end
--    -- -- }
--    -- use {"yoshida-m-3/vim-im-select"}
--    -- -- use {
--    -- --     "smjonas/inc-rename.nvim",
--    -- --     config = function()
--    -- --         require("inc_rename").setup({input_buffer_type = "dressing"})
--    -- --     end
--    -- -- }
--    -- use {
--    --     "RRethy/vim-illuminate",
--    --     config = function() require("vim-illuminate-config") end
--    -- }
--    -- use {
--    --     'glacambre/firenvim',
--    --     run = function() vim.fn['firenvim#install'](0) end
--    -- }
--    -- use {'andweeb/presence.nvim'}
--    -- use {
--    --     "akinsho/toggleterm.nvim",
--    --     config = function() require("toggleterm-config") end
--    -- }
--end)
---- vim.g.jupyter_ascending_python_executable = "python3"
