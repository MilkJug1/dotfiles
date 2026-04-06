
vim.pack.add({ "https://github.com/tiagovla/tokyodark.nvim", "https://github.com/catppuccin/nvim", "https://github.com/EdenEast/nightfox.nvim" })
vim.cmd("colorscheme tokyodark")
require("catppuccin").setup({
	-- transparent_background = true,
	integrations = {
		cmp = true,
		gitsigns = true,
		harpoon = true,
		illuminate = true,
		indent_blankline = {
			enabled = true,
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
