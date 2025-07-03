return {
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },

    {
        "stevearc/dressing.nvim",
        opts = {},
    },

    {
        "reybits/scratch.nvim",
        lazy = true,
        keys = {
            { "<leader>ts", "<cmd>ScratchToggle<cr>", desc = "Toggle Scratch Buffer" },
        },
        cmd = {
            "ScratchToggle",
        },
        opts = {},
    },

    {
        "hedyhli/outline.nvim",
        config = function()
            -- Example mapping to toggle outline
            vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
                { desc = "Toggle Outline" })

            require("outline").setup {
                -- Your setup opts here (leave empty to use defaults)
            }
        end,
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },

}
