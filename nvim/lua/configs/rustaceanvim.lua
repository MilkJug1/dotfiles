require('globals') -- Require the globals file
local on_attach = require('lspconfig').on_attach



vim.g.rustaceanvim = {
	opts = {
		server = {
			on_attach = on_attach,
			settings = {
				["rust-analyzer"] = {
					cargo = { features = "all" },
					checkOnSave = true,
					check = { command = "clippy", features = "all" },
					procMacro = { enable = true },
				},
			}
		},
	},


}
