-- For plugins that don't fit with LSP stuff, but change or improve the way I write text or code on Neovim.
--
--
-- Simple plugins with no special config
vim.pack.add({
	"https://github.com/rmagatti/logger.nvim",
	"https://github.com/SmiteshP/nvim-navic",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/rcarriga/nvim-notify",
	"https://github.com/preservim/vim-pencil",
	"https://github.com/bullets-vim/bullets.vim",
	"https://github.com/jbyuki/venn.nvim",
})

-- Plugins with version pins or branch
vim.pack.add({
	{ src = "https://github.com/utilyre/barbecue.nvim" },
	{ src = "https://github.com/smoka7/hop.nvim" },
	-- { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

-- Remaining plugins
vim.pack.add({
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/rmagatti/goto-preview",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/max397574/better-escape.nvim",
	"https://github.com/folke/noice.nvim",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/stevearc/vim-arduino",
	"https://github.com/folke/zen-mode.nvim",
	"https://github.com/brenoprata10/nvim-highlight-colors",
	"https://github.com/folke/flash.nvim",
	"https://github.com/andweeb/presence.nvim",
})

-- ── Setup calls ────────────────────────────────────────────────────────────────

require("todo-comments").setup()

-- goto-preview: config = true in lazy just means call setup() with no args
vim.api.nvim_create_autocmd("BufEnter", {
	once = true,
	callback = function()
		require("goto-preview").setup()
	end,
})

require("ibl").setup()

require("barbecue").setup()

require("better_escape").setup()

-- noice.nvim: was event = "VeryLazy", so defer until after UI is ready
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	once = true,
	callback = function()
		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
		})
	end,
})

require("fidget").setup()

-- vim-arduino: was ft = "arduino", so only load on that filetype
vim.api.nvim_create_autocmd("FileType", {
	pattern = "arduino",
	once = true,
	callback = function()
		vim.cmd.packadd("vim-arduino")
	end,
})

require("zen-mode").setup()

require("nvim-highlight-colors").setup()

-- flash.nvim: was event = "VeryLazy"
require("flash").setup()

vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })
vim.keymap.set("o", "r", function()
	require("flash").remote()
end, { desc = "Remote Flash" })
vim.keymap.set({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })
vim.keymap.set("c", "<c-s>", function()
	require("flash").toggle()
end, { desc = "Toggle Flash Search" })

require("presence").setup({
	auto_update = true,
	neovim_image_text = "Kill me",
})

require("hop").setup({
	keys = "etovxqpdygfblzhckisuran",
})

-- -- Harpoon (harpoon2 branch)
-- local harpoon = require("harpoon")
-- harpoon:setup({
-- 	settings = { save_on_toggle = true },
-- })
--
-- vim.keymap.set("n", "ta", function()
-- 	harpoon:list():add()
-- end)
-- vim.keymap.set("n", "to", function()
-- 	harpoon.ui:toggle_quick_menu(harpoon:list())
-- end)
--
-- vim.keymap.set("n", "<M-q>", function()
-- 	harpoon:list():select(1)
-- end, { desc = "Jump to Harpoon Selection 1" })
-- vim.keymap.set("n", "<M-w>", function()
-- 	harpoon:list():select(2)
-- end)
-- vim.keymap.set("n", "<M-e>", function()
-- 	harpoon:list():select(3)
-- end)
-- vim.keymap.set("n", "<leader>4", function()
-- 	harpoon:list():select(4)
-- end)
--
-- vim.keymap.set("n", "tn", function()
-- 	harpoon:list():prev()
-- end)
-- vim.keymap.set("n", "tp", function()
-- 	harpoon:list():next()
-- end)
--
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
-- 	local file_paths = {}
-- 	for _, item in ipairs(harpoon_files.items) do
-- 		table.insert(file_paths, item.value)
-- 	end
-- 	require("telescope.pickers")
-- 		.new({}, {
-- 			prompt_title = "Harpoon",
-- 			finder = require("telescope.finders").new_table({ results = file_paths }),
-- 			previewer = conf.file_previewer({}),
-- 			sorter = conf.generic_sorter({}),
-- 		})
-- 		:find()
-- end

-- vim.keymap.set("n", "<leader>th", function()
-- 	toggle_telescope(harpoon:list())
-- end, { desc = "Open harpoon window" })
