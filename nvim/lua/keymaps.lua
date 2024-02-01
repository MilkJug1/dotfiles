require('globals')

-- map.set('n', '<leader>f', ':Neotree<CR>')
map('n', ';', ':')
-- map('n', '<leader>:l', require("noice").cmd("lua"), {desc = "Opens command line with lua"})
-- File browser with Telescope file browser extension /

nm('<leader>r', ':Telescope file_browser<cr>', "Telescope File browser")
-- nm('<leader>ps', require('code-shot').shot(), "Takes a screenshot of whole file")
map({ 'n', 'v' }, '<leader>ps', require('code-shot').shot)
nm('<leader>ll', ':Lazy<cr>', "Run lazy")
nm('<C-n>', ':NvimTreeToggle<CR>', "Opens Neotree")
nm('<leader>e', ':NvimTreeFocus <CR>', "Focus Nvimtree")
-- nm('<leader>f', ':NvimTreeFocus<CR>', 'Focuses NvimTree')

--Git keybinds
nm('<leader>gg', '<cmd>LazyGit<cr>', "LazyGit")
nm('<leader>gp', ':Gitsigns preview_hunk<CR>', 'Preview Change Hunk')
nm('<leader>gb', ':Gitsigns toggle_current_line_blame', 'Toggle current line blame for Git')

-- Telescope mappings
nm('<leader>tr', '<cmd>Telescope lsp_references<cr>', "LSP References in file")
nm('<leader>td', '<cmd>Telescope lsp_document_symbols<cr>', 'LSP Document Symbols')
nm('<leader>tw', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', "LSP Dynamic Workspace Symbols")
nm('<leader>tr', '<cmd>Telescope find_files<cr>', "Find files with Telescope")
nm('<leader>tk', '<cmd>Telescope keymaps<cr>', 'List all keymaps')
nm('<leader>nn', '<cmd>Telescope notify<cr>', "Open Notifications")
nm('<leader>tc', ':Telescope colorscheme<cr>', "Changes Colorscheme")
nm('<leader>to', ":Trouble telescope<cr>", "Opens trouble telescope")
nm("<leader>lt", ":TroubleToggle quickfix<cr>", "Toggles trouble" )


-- Insert Mode bindings 
im('<C-h>', '<Left>')
im('<C-j>', '<Down>')
im('<C-k>', '<Up>')
im('<C-l>', '<Right>')

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
nm("<C-k>", vim.lsp.buf.hover, "LSP Hover")
nm('<leader>ls', vim.lsp.buf.signature_help, "LSP Signature help")
-- nm("K", vim.lsp.buf_request_sync)
nm("K", vim.lsp.buf.hover)
nm('<C-s>', require('cmp').mapping.open_docs, "LSP Open Docs")
nm('<leader>fd', vim.diagnostic.open_float, "Floating diagnostic")
-- Symbols outline
nm('<leader>so', ':SymbolsOutline<cr>', "Opens Symbols Outline UI")
nm('gP', require('goto-preview').goto_preview_definition, 'Preview Defintion')


-- Buffer keymaps
nm('[b', ':BufferLineCyclePrev<cr>', 'Go to previously opened buffer')
nm(']b', ':BufferLineCycleNext<cr>', 'Go to the next opened buffer')

-- Clear search
nm('<leader>bc', ':nohlsearch<cr>', 'Clear Search Register')

nm("<Esc>", ":noh <CR>", "Clear Highlights");
-- TODO Multiwindow keymaps

-- Terminal Bindings 
nm('<leader>tf', ':ToggleTerm<cr>', 'Toggle Term(Floating)')
nm('<leader>tg', ':ToggleTermToggleAll<cr>', "Toggle Term/Bring Back Previous Session")
tm('<Esc>', '<C-\\><C-N>')


-- Markdown bindings 
nm('<leader>ms', ':MarkdownPreview<CR>', "MarkdownPreview")
nm('<leader>md', ':MarkdownPreviewStop<cr>', "Stop Markdown Preview")
nm("<leader>mt", ":MarkdownPreviewToggle<cr>", 'Toggles MarkdownPreview')
nm("<leader>mk", ":MarkdownPreview solarized-dark<cr>", "MarkdownPreview with solarized Dark theme")


-- TODO-Comments Bindings 
nm("<leader>tn", require('todo-comments').jump_next, "Jumps to the next Todo comment")
nm("<leader>tb", require('todo-comments').jump_prev, "Jumps to the previous comment")
nm('<leader>tt', ":TodoTelescope<cr>", "Opens Telescope for all TODOS")
--
-- Icon Picker
im("<C-i>", ':IconPickerInsert emoji nerd_font alt_font symbols<cr>', "Inserts icon while in Insert Mode")
nm('<leader>iy', ":IconPickerYank<cr>", "Pick Icon and Yank it to buffer")
nm("<leader>in", ":IconPickerNormal<cr>", "Pick Icon and insert it into Buffer (Normal Mode)")

