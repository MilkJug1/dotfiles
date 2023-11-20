map = vim.api.nvim_set_keymap
vmap = vim.keymap.set

-- Normal mode keymap setter
function nm(key, command, desc)
	map('n', key, command, { noremap = true, desc = desc })
	-- When using this to map Lua functions, make sure to put 
	-- '<cmd>lua ...<cr>' 
end

-- Insert/Input mode
function im(key, command)
	map('i', key, command, { noremap = true })
end

-- Visual mode
function vm(key, command)
	map('v', key, command, { noremap = true })
end

-- Terminal mode
function tm(key, command, desc)
	map('t', key, command, { noremap = true, desc = desc })
end

-- map.set('n', '<leader>f', ':Neotree<CR>')
-- map.set('n', ';', '<cmd>FineCmdline<CR>')
-- map.set('n', ':', '<cmd>FineCmdline<CR>')
nm('<leader>f', '<cmd>Neotree<CR>')
nm(';', '<cmd>FineCmdline<CR>')
nm(':', '<cmd>FineCmdline<CR>')
-- nm('<leader>ps', require('code-shot').shot(), "Takes a screenshot of whole file")
vmap({ 'n', 'v' }, '<leader>ps', require('code-shot').shot)
-- vmap('n', '<leader>ll', require('lazy.manage').run)
nm('<leader>gg', '<cmd>LazyGit<cr>', "LazyGit")

-- Telescope mappings
nm('<leader>tr', '<cmd>Telescope lsp_references<cr>', "LSP References in file")
nm('<leader>td', '<cmd>Telescope lsp_document_symbols<cr>', 'LSP Document Symbols')
nm('<leader>tw', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', "LSP Dynamic Workspace Symbols")
nm('<leader>tr', '<cmd>Telescope find_files<cr>', "Find files with Telescope")
nm('<leader>tk', '<cmd>Telescope keymaps<cr>', 'List all keymaps')

-- LSP  Bindings
-- bufmap('<leader>r', vim.lsp.buf.rename)
-- bufmap('<leader>a', vim.lsp.buf.code_action)
-- bufmap('gd', vim.lsp.buf.definition)
-- bufmap('gD', vim.lsp.buf.declaration)
-- bufmap('gI', vim.lsp.buf.implementation)
-- bufmap('<leader>D', vim.lsp.buf.type_definition) vim.lsp.b
--
nm('<leader>fm', '<cmd>lua vim.lsp.buf.format{async=true}<cr>', "Format File with LSP")
vmap('n', 'gd', vim.lsp.buf.definition, {desc = "Goto definition"})

