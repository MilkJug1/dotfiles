-- For plugins that don't fit with LSP stuff, but change or improve the way I write text or code on Neovim.
--
--
return {

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "rmagatti/goto-preview",
        dependencies = { "rmagatti/logger.nvim" },
        event = "BufEnter",
        config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
    },


    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },

    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
        },
    },


    -- lua with lazy.nvim
    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end,
    },

    -- {
    --     'rcarriga/nvim-notify',
    --     config = function()
    --         require('notify').setup({
    --             background_colour = "#000000",
    --             fps = 60,
    --             stages = "fade",
    --             timeout = 4000,
    --             top_down = false
    --         })
    --     end
    -- },

    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        },
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true,         -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false,       -- add a border to hover docs and signature help
                },
            })
        end
    },

    -- {
    --     'lewis6991/gitsigns.nvim',
    --     config = function()
    --         require('gitsigns').setup()
    --     end
    -- },
    --
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },
    {
        'stevearc/vim-arduino',
        lazy = false,
        ft = "arduino",
    },

    { 'preservim/vim-pencil' },

    {
        "folke/zen-mode.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },


    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup()
        end,
    },

    {
        'hedyhli/outline.nvim'
    },

    -- {
    --     'echasnovski/mini.surround',
    --     version = false,
    --     config = function()
    --         require('mini.surround').setup();
    --     end
    -- },
    --
    -- {
    --     'echasnovski/mini.ai',
    -- },

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        -- keys = {
        --   { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        --   { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        --   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        --   { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        --   { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        -- },
    },

    {
        'andweeb/presence.nvim',
        config = function()
            require('presence').setup({
                auto_update = true,
                neovim_image_text = "Kill me",
            })
        end
    },


    {
        "bullets-vim/bullets.vim"
    },

    {
        "smoka7/hop.nvim",
        version = "*",
        opts = {
            keys = 'etovxqpdygfblzhckisuran'
        }
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require('harpoon')

            harpoon:setup {
                settings = {
                    save_on_toggle = true,
                },
            }
            --NOTE: Make more sensible bindings?
            -- Done as a way to create a better way to handle buffers

            -- vim.keymap.set("n", "<leader>p", function() harpoon:list():add() end)
            vim.keymap.set("n", "ta", function() harpoon:list():add() end)
            vim.keymap.set("n", "to", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "t1", function() harpoon:list():select(1) end, { desc = "Jump to Harpoon Selection 1"})
            vim.keymap.set("n", "t2", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "t3", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "t4", function() harpoon:list():select(4) end)

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "tn", function() harpoon:list():prev() end)
            vim.keymap.set("n", "tp", function() harpoon:list():next() end)

            -- basic telescope configuration
            local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                }):find()
            end

            vim.keymap.set("n", "<leader>th", function() toggle_telescope(harpoon:list()) end,
                { desc = "Open harpoon window" })
        end

    },

    {
        "mbbill/undotree"
    },

    {
        "jbyuki/venn.nvim",
    },
}
