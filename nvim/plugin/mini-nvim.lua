--WARN:  "echasnovski/mini.icons"  MAKE SURE TO INSTALL THAT HERE

vim.pack.add({ gh("nvim-mini/mini.nvim") })

require("mini.files").setup()
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

