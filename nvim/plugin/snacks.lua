--NOTE: I did not feel like rewriting this by hand for this one, decided to use Claude to help, might be broken
-- Def need to restructure and clean this file up

-- TODO: WORK ON KEYMAPS

vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

-- snacks.nvim is a priority/non-lazy plugin, so setup runs immediately (not deferred)
require("snacks").setup({
	bigfile = { enabled = true },
	dashboard = {
		preset = {
			header = [[
███████╗  ██████╗   █████╗  ███████╗ 
╚══███╔╝ ██╔════╝  ██╔══██╗ ██╔════╝ 
  ███╔╝  ██║  ███╗ ███████║ █████╗   
 ███╔╝   ██║   ██║ ██╔══██║ ██╔══╝   
███████╗ ╚██████╔╝ ██║  ██║ ██║      
╚══════╝  ╚═════╝  ╚═╝  ╚═╝ ╚═╝      
  ██████╗  ██████╗  ██████╗  ███████╗
 ██╔════╝ ██╔═══██╗ ██╔══██╗ ██╔════╝
 ██║      ██║   ██║ ██║  ██║ █████╗  
 ██║      ██║   ██║ ██║  ██║ ██╔══╝  
 ╚██████╗ ╚██████╔╝ ██████╔╝ ███████╗
  ╚═════╝  ╚═════╝  ╚═════╝  ╚══════╝
]],
		},
		sections = {
			{ section = "header" },
			{ section = "keys", padding = 1 },
			{ section = "recent_files", icon = "", title = "Recent Files" },
			{ section = "startup" },
		},
		enabled = false,
	},
	explorer = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	picker = { enabled = true },
	notifier = { enabled = true },
	image = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	-- scroll     = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
})

-- Keymaps (previously defined in the `keys` table of the lazy spec)
-- local map = function(lhs, rhs, desc, mode)
-- 	vim.keymap.set(mode or "n", lhs, rhs, { desc = desc })
-- end
--
-- -- Top Pickers & Explorer
-- map("<leader><space>", function()
-- 	Snacks.picker.smart()
-- end, "Smart Find Files")
-- map("<leader>bs", function()
-- 	Snacks.picker.buffers()
-- end, "Buffers")
-- map("<leader>gg", function()
-- 	Snacks.lazygit()
-- end, "Lazygit") -- gg was bound twice; lazygit wins (last wins in vim.keymap.set)
-- map("<leader>:", function()
-- 	Snacks.picker.command_history()
-- end, "Command History")
-- map("<leader>n", function()
-- 	Snacks.notifier.show_history()
-- end, "Notification History") -- n was bound twice; show_history wins
-- map("<leader>es", function()
-- 	Snacks.explorer()
-- end, "File Explorer")
-- map("<leader>fb", function()
-- 	Snacks.picker.buffers()
-- end, "Buffers")
-- map("<leader>fc", function()
-- 	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
-- end, "Find Config File")
-- map("<leader>ff", function()
-- 	Snacks.picker.files()
-- end, "Find Files")
-- map("<leader>fg", function()
-- 	Snacks.picker.git_files()
-- end, "Find Git Files")
-- map("<leader>fp", function()
-- 	Snacks.picker.projects()
-- end, "Projects")
-- map("<leader>fr", function()
-- 	Snacks.picker.recent()
-- end, "Recent")
-- map("<leader>sb", function()
-- 	Snacks.picker.lines()
-- end, "Buffer Lines")
-- map("<leader>sB", function()
-- 	Snacks.picker.grep_buffers()
-- end, "Grep Open Buffers")
-- map("<leader>sg", function()
-- 	Snacks.picker.grep()
-- end, "Grep")
-- map("<leader>sw", function()
-- 	Snacks.picker.grep_word()
-- end, "Visual selection or word", { "n", "x" })
--
-- -- Search
-- map('<leader>s"', function()
-- 	Snacks.picker.registers()
-- end, "Registers")
-- map("<leader>s/", function()
-- 	Snacks.picker.search_history()
-- end, "Search History")
-- map("<leader>sa", function()
-- 	Snacks.picker.autocmds()
-- end, "Autocmds")
-- map("<leader>sc", function()
-- 	Snacks.picker.command_history()
-- end, "Command History")
-- map("<leader>sC", function()
-- 	Snacks.picker.commands()
-- end, "Commands")
-- map("<leader>sd", function()
-- 	Snacks.picker.diagnostics()
-- end, "Diagnostics")
-- map("<leader>sD", function()
-- 	Snacks.picker.diagnostics_buffer()
-- end, "Buffer Diagnostics")
-- map("<leader>sh", function()
-- 	Snacks.picker.help()
-- end, "Help Pages")
-- map("<leader>sH", function()
-- 	Snacks.picker.highlights()
-- end, "Highlights")
-- map("<leader>si", function()
-- 	Snacks.picker.icons()
-- end, "Icons")
-- map("<leader>sj", function()
-- 	Snacks.picker.jumps()
-- end, "Jumps")
-- map("<leader>ks", function()
-- 	Snacks.picker.keymaps()
-- end, "Keymaps")
-- map("<leader>sl", function()
-- 	Snacks.picker.loclist()
-- end, "Location List")
-- map("<leader>sm", function()
-- 	Snacks.picker.marks()
-- end, "Marks")
-- map("<leader>sM", function()
-- 	Snacks.picker.man()
-- end, "Man Pages")
-- map("<leader>l", function()
-- 	Snacks.picker.lazy()
-- end, "Search for Plugin Spec")
-- map("<leader>qs", function()
-- 	Snacks.picker.qflist()
-- end, "Quickfix List")
-- map("<leader>su", function()
-- 	Snacks.picker.undo()
-- end, "Undo History")
-- map("<leader>uC", function()
-- 	Snacks.picker.colorschemes()
-- end, "Colorschemes")
--
-- -- UI / Misc
-- map("<leader>z", function()
-- 	Snacks.zen()
-- end, "Toggle Zen Mode")
-- map("<leader>Z", function()
-- 	Snacks.zen.zoom()
-- end, "Toggle Zoom")
-- map("<leader>S", function()
-- 	Snacks.scratch.select()
-- end, "Select Scratch Buffer")
-- map("<leader>bd", function()
-- 	Snacks.bufdelete()
-- end, "Delete Buffer")
-- map("<leader>cR", function()
-- 	Snacks.rename.rename_file()
-- end, "Rename File")
-- map("<leader>gl", function()
-- 	Snacks.lazygit.log()
-- end, "Lazygit Log")
-- map("<leader>un", function()
-- 	Snacks.notifier.hide()
-- end, "Dismiss All Notifications")
-- map("<c-/>", function()
-- 	Snacks.terminal()
-- end, "Toggle Terminal")
-- map("<c-_>", function()
-- 	Snacks.terminal()
-- end, "which_key_ignore")
--
-- -- Git
-- map("<leader>gB", function()
-- 	Snacks.gitbrowse()
-- end, "Git Browse", { "n", "v" })
--
-- -- Word jumping (n + t modes)
-- map("]]", function()
-- 	Snacks.words.jump(vim.v.count1)
-- end, "Next Reference", { "n", "t" })
-- map("[[", function()
-- 	Snacks.words.jump(-vim.v.count1)
-- end, "Prev Reference", { "n", "t" })
--
-- -- LSP
-- map("gd", function()
-- 	Snacks.picker.lsp_definitions()
-- end, "Goto Definition")
-- map("gD", function()
-- 	Snacks.picker.lsp_declarations()
-- end, "Goto Declaration")
-- map("<leader>gr", function()
-- 	Snacks.picker.lsp_references()
-- end, "References")
-- map("gI", function()
-- 	Snacks.picker.lsp_implementations()
-- end, "Goto Implementation")
-- map("gy", function()
-- 	Snacks.picker.lsp_type_definitions()
-- end, "Goto T[y]pe Definition")
-- map("<leader>ss", function()
-- 	Snacks.picker.lsp_symbols()
-- end, "LSP Symbols")
-- map("<leader>sS", function()
-- 	Snacks.picker.lsp_workspace_symbols()
-- end, "LSP Workspace Symbols")
