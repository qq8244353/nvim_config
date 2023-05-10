-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'shaunsingh/nord.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function() require('lualine-config') end
    }
    use {
        'akinsho/bufferline.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
        config = function() require('bufferline-config') end
    }
    use {
        "akinsho/toggleterm.nvim",
        config = function() require("toggleterm-config") end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function() require("treesitter-config") end,
        run = ":TSUpdate"
    }
    -- use {
    --     'nvim-tree/nvim-tree.lua',
    --     requires = {
    --         'nvim-tree/nvim-web-devicons' -- optional, for file icons
    --     },
    --     config = function() require('nvim-tree-config') end
    -- }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim", {
                -- only needed if you want to use the commands with "_with_window_picker" suffix
                's1n7ax/nvim-window-picker',
                tag = "v1.*",
                config = function() require('neotree-config') end
            }
        }
    }
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("whichkey-config")
        end
    }
    -- use {'windwp/nvim-ts-autotag'}
    -- use {'p00f/nvim-ts-rainbow'}
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = {'nvim-lua/plenary.nvim'},
	config = function() require('telescope-config') end
    }
    use {
	    "nvim-telescope/telescope-file-browser.nvim",
	   --  -- requires = { 'nvim-telescope/telescope.nvim' },
	   --  config = function() requrie('telescope-file-browser-config') end
    }
    -- use {'glepnir/dashboard-nvim'}
    -- use {'xeluxee/competitest.nvim', requires = 'MunifTanjim/nui.nvim'}
    -- use {'neovim/nvim-lspconfig'}
    -- use {'hrsh7th/cmp-nvim-lsp'}
    -- use {'hrsh7th/cmp-buffer'}
    -- use {'hrsh7th/cmp-path'}
    -- use {'hrsh7th/cmp-cmdline'}
    -- use {'hrsh7th/nvim-cmp'}
    -- use { 'saadparwaiz1/cmp_luasnip' }
    use {
	    'L3MON4D3/LuaSnip',
	    config = function() require("luasnip-config") end
    }
    -- use {"williamboman/mason.nvim"}
    -- use {"lukas-reineke/indent-blankline.nvim"}
    use {
        "numToStr/Comment.nvim",
        config = function() require("comment-config") end
    }
    -- use {
    --     'phaazon/hop.nvim',
    --     branch = 'v2', -- optional but strongly recommended
    --     config = function()
    --         -- you can configure Hop the way you like here; see :h hop-config
    --         require'hop'.setup {keys = 'etovxqpdygfblzhckisuran'}
    --     end
    -- }
    -- use {"jose-elias-alvarez/null-ls.nvim"}
    -- use {"untitled-ai/jupyter_ascending.vim"}
    -- use {
    --     'andymass/vim-matchup',
    --     setup = function()
    --         -- may set any options here
    --         vim.g.matchup_matchparen_offscreen = {method = "popup"}
    --     end
    -- }
    -- -- use {"mg979/vim-visual-multi"}
    -- use {"glepnir/lspsaga.nvim"}
    -- use {"sidebar-nvim/sidebar.nvim"}
    -- use {"williamboman/mason-lspconfig.nvim"}
    -- use {"gbprod/yanky.nvim"}
    -- use {"stevearc/dressing.nvim"}
    -- use {
    --     "j-hui/fidget.nvim",
    --     config = function()
    --         -- you can configure Hop the way you like here; see :h hop-config
    --         require'fidget'.setup {}
    --     end
    -- }
    -- use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
    -- use({
    --     "iamcco/markdown-preview.nvim",
    --     run = "cd app && npm install",
    --     setup = function() vim.g.mkdp_filetypes = {"markdown"} end,
    --     ft = {"markdown"}
    -- })
    -- -- use {
    -- --     "keaising/im-select.nvim",
    -- --     config = function()
    -- --         require('im_select').setup({disable_auto_restore = 1})
    -- --     end
    -- -- }
    -- use {"yoshida-m-3/vim-im-select"}
    -- -- use {
    -- --     "smjonas/inc-rename.nvim",
    -- --     config = function()
    -- --         require("inc_rename").setup({input_buffer_type = "dressing"})
    -- --     end
    -- -- }
    -- use {
    --     "RRethy/vim-illuminate",
    --     config = function() require("vim-illuminate-config") end
    -- }
    use {
        'mhartington/formatter.nvim',
        -- function() require('formatter').setup() end
        config = function() require('formatter-config') end
    }
    -- use {
    --     'glacambre/firenvim',
    --     run = function() vim.fn['firenvim#install'](0) end
    -- }
    -- use {'andweeb/presence.nvim'}
end)
-- vim.g.jupyter_ascending_python_executable = "python3"
vim.cmd('colorscheme nord')
