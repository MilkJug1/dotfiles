require 'globals'


g.mapleader = ' '
g.maplocalleader = ' '
-- g.aurora_transparent = 1

o.clipboard = 'unnamedplus'

o.number = true
o.relativenumber = true

o.signcolumn = 'yes'

o.tabstop = 4
o.shiftwidth = 4

o.updatetime = 2500

o.termguicolors = true

o.mouse = 'a'

opt.cursorline = true
opt.autoread = true
opt.autowrite = true
opt.showcmd = true


--vim.cmd("colorscheme duskfox")

--vim.cmd.colorscheme("duskfox")

if vim.g.neovide then
	-- vim.g.neovide_transparency = 0.9
	vim.o.guifont = "JetBrainsMono Nerd Font"
end
