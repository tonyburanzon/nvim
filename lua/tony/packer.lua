-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use( 'wbthomason/packer.nvim')
    use( 'folke/tokyonight.nvim')
    use( {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
    use( 'mattn/emmet-vim')
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'ThePrimeagen/harpoon'
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }
    use 'windwp/nvim-ts-autotag'
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'
    use 'APZelos/blamer.nvim'
end)
