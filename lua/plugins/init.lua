return {
    {
        "nvim-tree/nvim-tree.lua",
        opts = require "configs.ntree",
    },

    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = require "configs.flash",
    },

    {
        "SmiteshP/nvim-navic",
        lazy = false,
        opts = {
            lsp = { auto_attach = true },
            highlight = true,
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc", "c", "cpp", "rust" },
        },
    },

    -- quickdebug.nvim: GDB/gdbserver debug plugin
    {
        "planform/quickdebug.nvim",
        dependencies = {
            { "mfussenegger/nvim-dap" },
            { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
            { "theHamsta/nvim-dap-virtual-text" },
            { "jay-babu/mason-nvim-dap.nvim", dependencies = { "williamboman/mason.nvim" } },
        },
        config = function()
            require "configs.quickdebug"
        end,
    },

    -- test new blink
    -- { import = "nvchad.blink.lazyspec" },

    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },
}
