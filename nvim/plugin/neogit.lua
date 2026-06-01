vim.pack.add({
	"https://github.com/NeogitOrg/neogit",
	"https://github.com/sindrets/diffview.nvim",
	"https://github.com/ibhagwan/fzf-lua",
})

-- return {
--
--   "NeogitOrg/neogit",
--   lazy = true,
--   dependencies = {
--     "nvim-lua/plenary.nvim",         -- required
--     "sindrets/diffview.nvim",        -- optional - Diff integration
--
--     -- Only one of these is needed.
--     "nvim-telescope/telescope.nvim", -- optional
--     "ibhagwan/fzf-lua",              -- optional
--   },
--   cmd = "Neogit",
--   keys = {
--     { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
--   }
-- }
--
