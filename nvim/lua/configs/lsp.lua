vim.lsp.enable({ "zls", "clangd", "lua_ls", "basedpyright", "cmake", "bashls", "marksman", "efm" })

-- Seemingly Mason-lspconfig stuff is not working no more, heres is a semi-temp workaround till i can make a better config
vim.lsp.config["luals"] = {
	-- Command and arguments to start the server.
	cmd = { "lua-language-server" },
	-- Filetypes to automatically attach to.
	filetypes = { "lua" },
	-- Sets the "root directory" to the parent directory of the file in the
	-- current buffer that contains either a ".luarc.json" or a
	-- ".luarc.jsonc" file. Files that share a root directory will reuse
	-- the connection to the same LSP server.
	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
	root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
	-- Specific settings to send to the server. The schema for this is
	-- defined by the server. For example the schema for lua-language-server
	-- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
	settings = {
		Lua = {
			hint = { enable = true },
			runtime = {
				version = "LuaJIT",
			},
		},
	},
}

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Format on save (ONLY real file buffers, ONLY when efm is attached)
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	pattern = {
		"*.lua",
		"*.py",
		"*.json",
		"*.rs",
		"*.zig",
		"*.c",
		"*.cpp",
		"*.h",
		"*.hpp",
	},
	callback = function(args)
		-- avoid formatting non-file buffers (helps prevent weird write prompts)
		if vim.bo[args.buf].buftype ~= "" then
			return
		end
		if not vim.bo[args.buf].modifiable then
			return
		end
		if vim.api.nvim_buf_get_name(args.buf) == "" then
			return
		end

		local has_efm = false
		for _, c in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
			if c.name == "efm" then
				has_efm = true
				break
			end
		end
		if not has_efm then
			return
		end

		pcall(vim.lsp.buf.format, {
			bufnr = args.buf,
			timeout_ms = 2000,
			filter = function(c)
				return c.name == "efm"
			end,
		})
	end,
})
vim.lsp.config["*"] = {
	capabilites = require("blink.cmp").get_lsp_capabilities(),
}

local luacheck = require("efmls-configs.linters.luacheck")
local stylua = require("efmls-configs.formatters.stylua")
local cpplint = require("efmls-configs.linters.cpplint")
local clangfmt = require("efmls-configs.formatters.clang_format")
-- local rustfmt = require("efmls-configs.formatters.rustfmt")
local zlint = require("efmls-configs.linters.zlint")
local flake = require("efmls-configs.linters.flake8")

vim.lsp.config("efm", {
	filetypes = {
		"c",
		"cpp",
		"zig",
		"rust",
		"lua",
		"python",
	},
	init_options = { documentFormatting = true },
	settings = {
		languages = {
			c = { clangfmt, cpplint },
			cpp = { clangfmt, cpplint },
			lua = { luacheck, stylua },
			-- rust = { rustfmt },
			zig = { zlint },
			python = { flake8 },
		},
	},
})

vim.lsp.config("clangd", {
	settings = {
		clangd = {
			InlayHints = {
				Enabled = true,
				ParameterNames = true,
				DeducedTypes = true,
				Designators = true,
			},
			fallbackFlags = { "-std=c++20" },
		},
	},
})

vim.lsp.config["zls"] = {
	cmd = { "zls" },

	filetypes = { "zig", "zir" },
	settings = {
		zls = {
			enable_inlay_hints = true,
			inlay_hints_show_builtin = true,
			inlay_hints_exclude_single_argument = true,
			inlay_hints_hide_redundant_param_names = false,
			inlay_hints_hide_redundant_param_names_last_token = false,
		},
	},
}
