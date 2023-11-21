require('globals')

-- map.set('n', '<leader>f', ':Neotree<CR>')
map('n', ';', ':')
-- map('n', '<leader>:l', require("noice").cmd("lua"), {desc = "Opens command line with lua"})
-- File browser with Telescope file browser extension /

nm('<leader>r', ':Telescope file_browser<cr>', "Telescope File browser")
-- nm('<leader>ps', require('code-shot').shot(), "Takes a screenshot of whole file")
map({ 'n', 'v' }, '<leader>ps', require('code-shot').shot)
-- vmap('n', '<leader>ll', require('lazy.manage').run)
nm('<leader>gg', '<cmd>LazyGit<cr>', "LazyGit")

-- Telescope mappings
nm('<leader>tr', '<cmd>Telescope lsp_references<cr>', "LSP References in file")
nm('<leader>td', '<cmd>Telescope lsp_document_symbols<cr>', 'LSP Document Symbols')
nm('<leader>tw', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', "LSP Dynamic Workspace Symbols")
nm('<leader>tr', '<cmd>Telescope find_files<cr>', "Find files with Telescope")
nm('<leader>tk', '<cmd>Telescope keymaps<cr>', 'List all keymaps')
nm('<leader>nn', '<cmd>Telescope notify<cr>', "Open Notifications")
nm('<leader>tc', ':Telescope colorscheme<cr>', "Changes Colorscheme")

-- LSP  Bindings
-- bufmap('<leader>r', vim.lsp.buf.rename)
-- bufmap('<leader>a', vim.lsp.buf.code_action)
-- bufmap('gd', vim.lsp.buf.definition)
-- bufmap('gD', vim.lsp.buf.declaration)
-- bufmap('gI', vim.lsp.buf.implementation)
-- bufmap('<leader>D', vim.lsp.buf.type_definition) vim.lsp.b
--
nm('<leader>fm', '<cmd>lua vim.lsp.buf.format{async=true}<cr>', "Format File with LSP")
map('n', 'gd', vim.lsp.buf.definition, { desc = "Goto definition" })
nm('gI', vim.lsp.buf.implementation, "Goto Implementation")
nm("<leader>D", vim.lsp.buf.type_definition, "Goto Type definition")
nm("<leader>lr", vim.lsp.buf.rename, "LSP Rename")
nm("<leader>ca", vim.lsp.buf.code_action, "LSP Code Action")
-- nm("K", vim.lsp.buf.hover(), "LSP Hover")


-- Buffer keymaps
nm('[b', ':BufferLineCyclePrev<cr>', 'Go to previously opened buffer')
nm(']b', ':BufferLineCycleNext<cr>', 'Go to the next opened buffer')

-- Clear search
nm('<leader>bc', ':nohlsearch<cr>', 'Clear Search Register')
