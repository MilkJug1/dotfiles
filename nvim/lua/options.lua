require 'globals'


g.mapleader = ' '
g.maplocalleader = ' '
-- g.aurora_transparent = 1

o.clipboard = 'unnamedplus'

o.number = true
o.relativenumber = true
opt.rnu = true

opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true

opt.smartindent = true
opt.shiftwidth = 2

opt.breakindent = true

opt.ignorecase = true
opt.smartcase = true

opt.completeopt = { "menuone", "noselect" }

opt.undofile = true

-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 8

-- Place a column line
-- vim.opt.colorcolumn = "100"
-- o.signcolumn = 'yes'

o.tabstop = 4
o.shiftwidth = 4

o.updatetime = 2500

o.termguicolors = true

o.mouse = 'a'

opt.cursorline = true
opt.autoread = true
opt.autowrite = true
opt.showcmd = true

vim.diagnostic.config({virtual_text= true})


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

vim.lsp.inlay_hint.enable()

