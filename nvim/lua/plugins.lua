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
		priority = 1000,
		config = function()
			require('onedark').setup({
				style = 'darker',
			})
			require('onedark').load()
		end

	},

	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require('lualine').setup({
				icons_enabled = true,
				theme = 'codedark'
			})
		end,

	},

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets',

			'hrsh7th/cmp-nvim-lsp',
		},
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
		config = function ()
			require('gitsigns').setup()
		end
	},

	{
		'VonHeikemen/fine-cmdline.nvim',
		dependencies = {
			'MunifTanjim/nui.nvim',
		}
	},

	{
		'kdheepak/lazygit.nvim',
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	{
		'folke/which-key.nvim',
		event = "VeryLazy",
		init = function ()
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
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
		  "nvim-lua/plenary.nvim",
		  "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		  "MunifTanjim/nui.nvim",
		  -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		}
	},
	{
		'niuiic/code-shot.nvim',
		dependencies = {
			'niuiic/core.nvim',
		},
	},
}
