local cmp = require("blink.cmp")
cmp.build():pwait()

cmp.setup({
	keymap = {
		preset = "default",
		["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },

		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<C-n>"] = { "select_next", "fallback" },

		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },

		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide", "fallback" },
		["<C-t>"] = { "show", "fallback" },

		["<CR>"] = { "accept", "fallback" },
	},

	cmdline = {
		enabled = true,
		keymap = { preset = "cmdline" },
		completion = { menu = { auto_show = true } },
	},

	sources = { default = { "lsp", "path", "snippets", "buffer" } },

	fuzzy = { implementation = "rust" },

	completion = {
		documentation = { auto_show = true },
		ghost_text = { enabled = true },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "kind", gap = 1 }, { "label", "label_description" } },
			},
		},
	},
})
