require ("globals")

vim.pack.add({
	gh("nvim-telescope/telescope.nvim"),
	gh("nvim-lua/plenary.nvim"),
	gh("nvim-telescope/telescope-ui-select.nvim"),
	gh("nvim-telescope/telescope-file-browser"),
})

require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})
require("telescope").load_extension("ui-select")
