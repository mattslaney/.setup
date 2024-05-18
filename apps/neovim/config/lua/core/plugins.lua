--[[
-- Plugins available across all instances of neovim
--]]
local plugins = {

    -- GENERAL
    -- -- Adding a nice status bar with lots of info
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- -- Adding a useful box to help find the right keys
    {
        'folke/which-key.nvim',
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    -- -- A nice theme
    {
        "rebelot/kanagawa.nvim",
        name = 'kanagawa',
        lazy = false,
        priority = 1000,
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
            vim.cmd([[colorscheme kanagawa-dragon]])
        end
    },

    -- NAVIGATION
    -- -- A useful file tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        -- REQUIRES A NERD FONT INSTALLED - https://www.nerdfonts.com/
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    -- A nice fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- A handy file switcher
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- EDITING
    { 'mbbill/undotree' },
    
    -- GIT
    { 'tpope/vim-fugitive' },
    { 'airblade/vim-gitgutter' },


    -- GENERAL LANGUAGE SUPPORT
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
        }
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {'L3MON4D3/LuaSnip'}
        },
    },

    -- SPECIFIC LANGUAGE SUPPORT
    {
        'mrcjkb/rustaceanvim',
        dependencies = {
            'VonHeikemen/lsp-zero.nvim'
        },
        version = '^4', -- Recommended
        lazy = false, -- This plugin is already lazy
--        init = function()
--        vim.g.rustaceanvim = {
--            server = {
--                capabilities = require('lsp-zero').get_capabilities()
--            },
--        }
--        end,
    },
}

--[[
-- Plugins available within a Nix flake
--]]
local ok, flake_plugins = pcall(require, "flake.plugins")
if ok then
    print("Loading flake plugins")
    for _, plugin in ipairs(flake_plugins) do
        table.insert(plugins, plugin)
    end
end

return plugins

