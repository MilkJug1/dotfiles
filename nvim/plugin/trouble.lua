--TODO: Port Trouble over to vim.pack
--
--
require("globals")

vim.pack.add({
	gh("folke/trouble.nvim"),
	gh("stevearc/dressing.nvim"),
	gh("reybits/scratch.nvim"),
	gh("hedyhli/outline.nvim"),
	gh("MeanderingProgrammer/render-markdown.nvim"),
})

vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

-- 			"<leader>xx",
-- 			"<cmd>Trouble diagnostics toggle<cr>",
-- 			desc = "Diagnostics (Trouble)",
-- 		},
-- 		{
-- 			"<leader>xX",
-- 			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
-- 			desc = "Buffer Diagnostics (Trouble)",
-- 		},
-- 		{
-- 			"<leader>cs",
-- 			"<cmd>Trouble symbols toggle focus=false<cr>",
-- 			desc = "Symbols (Trouble)",
-- 		},
-- 		{
-- 			"<leader>cl",
-- 			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
-- 			desc = "LSP Definitions / references / ... (Trouble)",
-- 		},
-- 		{
-- 			"<leader>xL",
-- 			"<cmd>Trouble loclist toggle<cr>",
-- 			desc = "Location List (Trouble)",
-- 		},
-- 		{
-- 			"<leader>xQ",
-- 			"<cmd>Trouble qflist toggle<cr>",
-- 			desc = "Quickfix List (Trouble)",
-- 		},
-- 	},
-- },

