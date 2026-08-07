vim.pack.add({ "https://github.com/nvim-orgmode/orgmode"})

require("orgmode").setup({
			org_agenda_files = "~/org/**/*",
			org_default_notes_file = "~/org/refile.org",
})

vim.lsp.enable("org")

-- return {
-- 	"nvim-orgmode/orgmode",
-- 	event = "VeryLazy",
-- 	config = function()
-- 		-- Setup orgmode
-- 		require("orgmode").setup({
-- 			org_agenda_files = "~/org/**/*",
-- 			org_default_notes_file = "~/org/refile.org",
-- 		})
-- 		-- Experimental LSP support
-- 		vim.lsp.enable("org")
-- 	end,
-- }
