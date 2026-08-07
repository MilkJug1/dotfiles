--TODO: Port Trouble over to vim.pack
--
--

vim.pack.add({
	"https://github.com/folke/trouble.nvim",
	-- "https://github.com/fstevearc/dressing.nvim",
	"https://github.com/reybits/scratch.nvim",
	"https://github.com/hedyhli/outline.nvim",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
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

