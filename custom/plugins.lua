local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options
	--
	--

	{
		'glacambre/firenvim',

		-- Lazy load firenvim
		-- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
		lazy = not vim.g.started_by_firenvim,
		build = function()
			vim.fn["firenvim#install"](0)
		end
	},


	{
		"mfussenegger/nvim-dap",
		config = function(_, _)
			require("core.utils").load_mappings("dap")
		end
	},

	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require "custom.configs.null-ls"
				end,
			},
		},
		config = function()
			require "plugins.configs.lspconfig"
			require "custom.configs.lspconfig"
		end, -- Override to setup mason-lspconfig
	},


	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = {
			overrides.mason,
			ensure_installed = {
				"cpplint",
				"cpptools",
				"clangd",
				"clang-format",
				"codelldb",
			}
		}
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"VonHeikemen/fine-cmdline.nvim",
		enabled = true,
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			enabled = true,
		},
	},

	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end
	},

	{
		'saecki/crates.nvim',
		ft = { "rust", "toml" },
		config = function(_, opts)
			local crates = require('crates')
			crates.setup(opts)
			crates.show()
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
	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

}

return plugins
