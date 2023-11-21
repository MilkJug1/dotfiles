-- map = vim.api.nvim_set_keymap
map = vim.keymap.set

-- Normal mode keymap setter
function nm(key, command, desc)
	map('n', key, command, { desc = desc })
end

-- Insert/Input mode
function im(key, command, desc)
	map('i', key, command, { desc = desc })
end

-- Visual mode
function vm(key, command)
	map('v', key, command, { noremap = true })
end

-- Terminal mode
function tm(key, command, desc)
	map('t', key, command, { noremap = true, desc = desc })
end


-- Vim option globals
cmd = vim.cmd
api = vim.api
lsp = vim.lsp
fn = vim.fn
g = vim.g
opt = vim.opt
o = vim.o



