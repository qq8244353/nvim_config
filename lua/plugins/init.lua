-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'shaunsingh/nord.nvim'
    use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    -- using packer.nvim
    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons' -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use {'windwp/nvim-ts-autotag'}
    use {'p00f/nvim-ts-rainbow'}
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use {"nvim-telescope/telescope-file-browser.nvim"}
    use {'glepnir/dashboard-nvim'}
    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function() require("toggleterm").setup() end
    }
    use {'xeluxee/competitest.nvim', requires = 'MunifTanjim/nui.nvim'}
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    use {'hrsh7th/nvim-cmp'}
    use {'L3MON4D3/LuaSnip'}
    use {'saadparwaiz1/cmp_luasnip'}
    use {"williamboman/mason.nvim"}
    use {"lukas-reineke/indent-blankline.nvim"}
    use {"numToStr/Comment.nvim"}
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup {keys = 'etovxqpdygfblzhckisuran'}
        end
    }
    use {"jose-elias-alvarez/null-ls.nvim"}
    use {"untitled-ai/jupyter_ascending.vim"}
    use {
        'andymass/vim-matchup',
        setup = function()
            -- may set any options here
            vim.g.matchup_matchparen_offscreen = {method = "popup"}
        end
    }
    -- use {"mg979/vim-visual-multi"}
    use {"glepnir/lspsaga.nvim"}
    use {"sidebar-nvim/sidebar.nvim"}
    use {"williamboman/mason-lspconfig.nvim"}
    use {"gbprod/yanky.nvim"}
    use {"stevearc/dressing.nvim"}
    use {
        "j-hui/fidget.nvim",
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'fidget'.setup {}
        end
    }
    use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = {"markdown"} end,
        ft = {"markdown"}
    })
    -- use {
    --     "keaising/im-select.nvim",
    --     config = function()
    --         require('im_select').setup({disable_auto_restore = 1})
    --     end
    -- }
    use {"yoshida-m-3/vim-im-select"}
    -- use {
    --     "smjonas/inc-rename.nvim",
    --     config = function()
    --         require("inc_rename").setup({input_buffer_type = "dressing"})
    --     end
    -- }
    use {
        "RRethy/vim-illuminate",
        config = function() require("vim-illuminate-config") end
    }
    use {
        'mhartington/formatter.nvim',
        -- function() require('formatter').setup() end
        config = function() require('formatter-config') end
    }
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }
end)
