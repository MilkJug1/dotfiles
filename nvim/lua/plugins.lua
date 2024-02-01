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
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		'saadparwaiz1/cmp_luasnip',
		'L3MON4D3/LuaSnip',
		'hrsh7th/cmp-nvim-lsp',
		'rafamadriz/friendly-snippets',

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

	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v3.x",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	-- 	},
	-- 	config = function()
	-- 		require('neo-tree').setup({
	-- 			source_selector = {
	-- 				winbar = true,
	-- 				statusline = false,
	--
	-- 			},
	--
	-- 			sources = {
	-- 				"filesystem",
	-- 				"document_symbols",
	-- 				"buffers",
	-- 			},
	--
	-- 			window = {
	-- 				position = 'right',
	-- 			},
	-- 		})
	-- 	end
	-- },

	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {}
		end,
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	},

	{
		'niuiic/code-shot.nvim',
		dependencies = {
			'niuiic/core.nvim',
		},
	},
	{
		'simrat39/rust-tools.nvim',
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

	'simrat39/symbols-outline.nvim',

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

	{
		-- Lazy.nvim
		"TobinPalmer/Tip.nvim",
		event = "VimEnter",
		init = function()
			-- Default config
			--- @type Tip.config
			require("tip").setup({
				title = "Tip!",
				url = "https://vtip.43z.one",
			})
		end,

	},

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

	"luckasRanarison/tree-sitter-hypr",

	{
		'catppuccin/nvim',
		config = function()
			require('catppuccin').setup({
				-- transparent_background = true,
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
		ft = "ino",
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
		'karb94/neoscroll.nvim',
		config = function()
			require('neoscroll').setup {}
		end
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
		dependencies = {
			"nvim-telescope/telescope.nvim"
		},
	},

	{
		'andweeb/presence.nvim',
		config = function ()
			require('presence').setup({
				auto_update = true,
				neovim_image_text = "Kill me",
				main_image = "file",
			})
			
		end
	},

	{
		"tpope/vim-fugitive",
	}

}
