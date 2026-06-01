-- require("options")

vim.g.mapleader = " "
vim.g.maplocalleader = " "
package.loaded["keymaps"] = nil
require("keymaps")
require("start")
require("configs")

-- Mappings file for custom mappings
--

-- require("keymaps")

require("globals")
--
--  vim.api.nvim_create_autocmd("PackChanged", {
-- 	callback = function(ev)
-- 		local name, kind = ev.data.spec.name, ev.data.kind
-- 		if name == "nvim-treesitter" and kind == "update" then
-- 			vim.cmd("TSUpdate")
-- 		end
-- 	end,
-- })

require("vim._core.ui2").enable({
	enable = true,
})

-- Here to help with vim.pack
-- g.maplocalleader = ' '
-- g.aurora_transparent = 1

o.clipboard = "unnamedplus"

o.number = true
o.relativenumber = true
opt.rnu = true

opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true

opt.smartindent = true
opt.shiftwidth = 2

opt.breakindent = true
opt.autoindent = true
vim.opt.smartindent = true

vim.opt.updatetime = 300
vim.opt.autoread = true

vim.opt.hidden = true
vim.opt.backspace = "indent,eol,start"
vim.opt.errorbells = true

opt.ignorecase = true
opt.smartcase = true

opt.completeopt = { "menuone", "noselect" }

opt.undofile = true

opt.splitbelow = true
opt.splitright = true
-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 8

-- Place a column line
-- vim.opt.colorcolumn = "100"
-- o.signcolumn = 'yes'

o.tabstop = 4
o.shiftwidth = 4

o.updatetime = 2500

o.termguicolors = true

o.mouse = "a"

opt.cursorline = true
opt.autoread = true
opt.autowrite = true
opt.showcmd = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

o.winborder = "rounded"

vim.diagnostic.config({ virtual_text = true })

--vim.cmd("colorscheme duskfox")

--vim.cmd.colorscheme("duskfox")

-- vim.o.guifont = "JetBrainsMono Nerd Font:h12"

if vim.g.neovide then
	-- vim.g.neovide_transparency = 0.9
	-- vim.o.guifont = "JetBrainsMono Nerd Font:h13"
	-- Geniunely I think I might switch to this font, its fuckin weird but I kinda like it
	vim.o.guifont = "Monocraft:h13"
end

vim.filetype.add({
	pattern = { [".*/hyprland%.conf"] = "hyprlang" },
})

-- vim.lsp.inlay_hint.enable()
