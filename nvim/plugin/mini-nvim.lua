--WARN:  "echasnovski/mini.icons"  MAKE SURE TO INSTALL THAT HERE

vim.pack.add({ "https://github.com/nvim-mini/mini.nvim", "https://github.com/echasnovski/mini.icons" })

require("mini.files").setup({
	mappings = {
		synchronize = "y",
	},
})
require("mini.ai").setup()
require("mini.comment").setup()
require("mini.move").setup()
require("mini.pairs").setup()
-- require("mini.tabline").setup()
require("mini.bracketed").setup()
require("mini.surround").setup()
require("mini.map").setup()
require("mini.keymap").setup()
require("mini.pick").setup()
-- require("mini.jump2d").setup()
