return {

    -- Add plugins here by a table
    -- example
    -- {
    -- 	"username/NameOfProject",
    -- 	any config here
    -- },

    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },

    {
        "navarasu/onedark.nvim",
        -- priority = 1000,
        -- config = function()
        -- require('onedark').setup({
        -- style = 'darker',
        -- })
        -- require('onedark').load()
        -- end

    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require('lualine').setup({
                icons_enabled = true,
                theme = 'stealth'
            })
        end,

    },

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    {
        "hrsh7th/nvim-cmp",
        -- "Saghen/blink.cmp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'rafamadriz/friendly-snippets',
        "windwp/nvim-ts-autotag",
        "windwp/nvim-autopairs",

    },

    'folke/neodev.nvim',

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },

    -- {
    -- 'VonHeikemen/fine-cmdline.nvim',
    -- dependencies = {
    -- 	'MunifTanjim/nui.nvim',
    -- }
    -- },

    {
        'kdheepak/lazygit.nvim',
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    {
        'folke/which-key.nvim',
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },

    {
        'folke/trouble.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        }
    },


    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup { view = { side = 'right' } }
        end,
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    },

    {
        'niuiic/code-shot.nvim',
        dependencies = {
            'niuiic/core.nvim',
        },
    },

    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    'smoka7/hop.nvim',
    -- {
    -- 	'nvimdev/dashboard-nvim',
    -- 	event = 'VimEnter',
    -- 	dependencies = { 'nvim-tree/nvim-web-devicons' }
    -- },
    --
    {
        "nyoom-engineering/oxocarbon.nvim",
        priority = 1000,
        config = function()
            -- vim.cmd("colorscheme oxocarbon")
            -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
    },

    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        }
    },

    {
        'rcarriga/nvim-notify',
        config = function()
            require('notify').setup({
                background_colour = "#000000",
                fps = 60,
                stages = "fade",
                timeout = 4000,
                top_down = false
            })
        end
    },

    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        }
    },

    'embark-theme/vim',
    {
        'yazeed1s/oh-lucy.nvim',
        config = function()
            -- vim.g.oh_lucy_transparent_background = true
        end
    },
    'hoprr/calvera-dark.nvim',
    'stevearc/dressing.nvim',

    {
        'sudormrfbin/cheatsheet.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
        },
    },

    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
    },

    {
        'tiagovla/tokyodark.nvim',
        config = function()
            require('tokyodark').setup({
                transparent_background = true,
            })
        end

    },

    {
        'saecki/crates.nvim',
        ft = { 'rust', 'toml' },
        config = function(_, opts)
            local crates = require('crates')
            crates.setup(opts)
            crates.show()
        end,
    },

    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    },

    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end,
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

    'rrethy/vim-illuminate',

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },


    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup()
        end,
    },

    {
        'akinsho/toggleterm.nvim',
        config = true,
        version = '*',
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    {
        "ziontee113/icon-picker.nvim",
        dependencies = {
            'ziontee113/icon-picker.nvim',
        },
        config = function()
            require('icon-picker').setup({
                disable_legacy_commands = true
            })
        end,
    },

    {
        "ellisonleao/glow.nvim",
        config = true,
        cmd = "Glow"
    },

    -- {
    -- 	-- Lazy.nvim
    -- 	"TobinPalmer/Tip.nvim",
    -- 	event = "VimEnter",
    -- 	init = function()
    -- 		-- Default config
    -- 		--- @type Tip.config
    -- 		require("tip").setup({
    -- 			title = "Tip!",
    -- 			url = "https://vtip.43z.one",
    -- 		})
    -- 	end,
    --
    -- },
    --
    {
        'rafamadriz/neon'
    },

    'marko-cerovac/material.nvim',
    'rockerboo/boo-colorscheme-nvim',

    {
        "ray-x/aurora",
        config = function()
            -- vim.g.aurora_transparent = 1
        end,
    },

    {
        'ray-x/starry.nvim',
        config = function()
            vim.g.starry_italic_comments = true
            -- vim.g.starry_disable_background = true
        end,
    },


    'ofirgall/ofirkai.nvim',

    -- 'rrethy/nvim-base16',

    {
        'bkegley/gloombuddy',
        dependencies = {
            'tjdevries/colorbuddy.nvim',
        }
    },

    -- 'antonk52/bad-practices.nvim',
    -- {
    -- 	"m4xshen/hardtime.nvim",
    -- 	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    -- 	opts = {}
    -- },

    {
        'goolord/alpha-nvim',
        config = function()
            require('alpha').setup(require('alpha.themes.dashboard').config)
        end
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        'oxfist/night-owl.nvim',
    },

    {
        'dasupradyumna/midnight.nvim',
        priority = 1000
    },

    {
        "baliestri/aura-theme",
        priority = 1000,
        -- config = function(plugin)
        -- vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
        -- vim.cmd([[colorscheme aura-dark]])
        -- end
    },

    { 'rose-pine/neovim', name = 'rose-pine' },


    -- {
    --     "luckasRanarison/tree-sitter-hyprlang",
    --     dependencies = { "nvim-treesitter/nvim-treesitter" },
    -- },

    {
        'catppuccin/nvim',
        config = function()
            require('catppuccin').setup({
                -- transparent_background = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    harpoon = true,
                    illuminate = true,
                    indent_blankline = {
                        enabled = false,
                        scope_color = "sapphire",
                        colored_indent_levels = false,
                    },
                    mason = true,
                    native_lsp = { enabled = true },
                    notify = true,
                    nvimtree = true,
                    neotree = true,
                    telescope = true,
                    treesitter = true,
                    treesitter_context = true,
                },
            })
        end
    },

    {
        'EdenEast/nightfox.nvim',
        config = function()
            require('nightfox').setup({
                options = {
                    -- transparent = true,
                }
            })
            vim.cmd("colorscheme duskfox")
        end
    },

    {
        "daschw/leaf.nvim",
        config = function()
            require('leaf').setup({
                -- transparent = true,
            })
        end
    },

    {
        'rebelot/kanagawa.nvim',
        config = function()
            require('kanagawa').setup({
                -- transparent = true,
            })
        end
    },

    {
        'lunarvim/horizon.nvim',
    },
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        config = function()
            -- vim.g.moonflyTransparent = true
        end
    },

    {
        'stevearc/vim-arduino',
        lazy = false,
        ft = "arduino",
    },

    -- {
    -- 	'glebzlat/Arduino.nvim',
    -- 	config = function()
    -- 		require('arduino-nvim').setup()
    -- 	end
    -- }
    {
        "onsails/lspkind.nvim"
    },

    {
        'segeljakt/vim-silicon'

    },

    {
        'hrsh7th/cmp-cmdline',
        config = function()
            local cmp = require('cmp')

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    {
                        name = 'cmdline',
                        option = {
                            ignore_cmds = { 'Man', '!' }
                        }
                    }
                })
            })
        end
    },
    -- {
    --     "chikko80/error-lens.nvim",
    --     event = "BufRead",
    --     lazy = false,
    --     dependencies = {
    --         "nvim-telescope/telescope.nvim"
    --     },
    -- },

    {
        'andweeb/presence.nvim',
        config = function()
            require('presence').setup({
                auto_update = true,
                neovim_image_text = "Kill me",
                main_image = "file",
            })
        end
    },

    {
        "tpope/vim-fugitive",
    },

    {
        'mrcjkb/rustaceanvim',
        version = '^4',
        -- ft = {'rust' }
    },

    'preservim/vim-pencil',

    {
        "folke/zen-mode.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    {
        "folke/twilight.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },

    {
        "numToStr/FTerm.nvim",

    },

    {
        "gelguy/wilder.nvim",
    },

    {
        "echasnovski/mini.cursorword",
        version = "*",
        lazy = true,
        -- 	event = "CursorMoved",
    },

    "nvim-neotest/nvim-nio",

    {
        "ray-x/web-tools.nvim",
        ft = { 'html', 'javascript', 'hurl', 'http', 'svelte' },
        cmd = { 'HurlRun', 'BrowserOpen', 'BrowserSync', "Yarn", "Npm", "Tsc", "BrowserPreview", "BrowserRestart", "TagRename", "BrowserStop" },
        lazy = true,
        config = function()
            require('web-tools').setup({})
        end
    },

    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup()
        end,
    },

    {
        'lukas-reineke/headlines.nvim',
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
    },

    {
        'hedyhli/outline.nvim'
    },

    {
        'echasnovski/mini.surround',
        version = false,
        config = function()
            require('mini.surround').setup();
        end
    },

    {
        'echasnovski/mini.ai',
    },

    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    },

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
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
        config = function()
            require("oil").setup({
                default_file_explorer = true,
                view_options = {
                    show_hidden = true,
                },
                keymaps = {
                    ["g?"] = "actions.show_help",
                    ["<CR>"] = "actions.select",
                    ["<C-s>"] = {
                        "actions.select",
                        opts = { vertical = true },
                        desc = "Open the entry in a vertical split",
                    },
                    ["<C-h>"] = {
                        "actions.select",
                        opts = { horizontal = true },
                        desc = "Open the entry in a horizontal split",
                    },
                    ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
                    ["<C-p>"] = "actions.preview",
                    ["q"] = "actions.close",
                    ["<C-l>"] = "actions.refresh",
                    ["-"] = "actions.parent",
                    ["_"] = "actions.open_cwd",
                    ["`"] = "actions.cd",
                    ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
                    ["gs"] = "actions.change_sort",
                    ["gx"] = "actions.open_external",
                    ["g."] = "actions.toggle_hidden",
                    ["g\\"] = "actions.toggle_trash",
                },
                float = {
                    padding = 3,
                    border = "rounded",
                },

            })
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

