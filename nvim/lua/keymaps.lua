require('globals')

local bufnr = vim.api.nvim_get_current_buf()

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
local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "double"
    },
    hidden = true
})
function _lazygit_toggle()
    lazygit:toggle()
end

-- nm('<leader>gg', '<cmd>LazyGit<cr>', "LazyGit")
nm('<leader>gg', _lazygit_toggle, "LazyGit Toggle Term")
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
nm("<leader>lt", ":TroubleToggle quickfix<cr>", "Toggles trouble")


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
nm('<leader>lf', vim.lsp.buf.list_workspace_folders, "List workspaces folder")
nm('<leader>la', vim.lsp.buf.add_workspace_folder, "Add a workspace folder")
nm("<leader>ca", vim.lsp.buf.code_action, "LSP Code Action")
nm("<C-v>", vim.lsp.buf.hover, "LSP Hover")
nm("<leader>ws", vim.lsp.buf.workspace_symbol, "LSP workspace symbol")
nm('<leader>ls', vim.lsp.buf.signature_help, "LSP Signature help")
-- nm("K", vim.lsp.buf_request_sync)
nm("K", vim.lsp.buf.hover)
nm('<C-a>', require('cmp').mapping.open_docs, "LSP Open Docs")
nm('<leader>fd', vim.diagnostic.open_float, "Floating diagnostic")
-- Symbols outline
nm('<leader>so', ':SymbolsOutline<cr>', "Opens Symbols Outline UI")
nm('gP', require('goto-preview').goto_preview_definition, 'Preview Defintion')
-- map('n', '<leader>a', vim.cmd.RustLsp('code_action') {silent = true, buffer = bufnr, desc = "Rust code action"})

-- Nvim Specific keybinds
local function my_on_attach(bufnr)
    local ntree = require('nvim-tree.api')

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    ntree.config.mappings.default_on_attach(bufnr)

    map('n', 't', ntree.tree.change_root_to_node, { buffer = bufnr, noremap = true, silent = true, nowait = true })
end

require('nvim-tree').setup {
    on_attach = my_on_attach,
}

-- Buffer keymaps
nm('[b', ':BufferLineCyclePrev<cr>', 'Go to previously opened buffer')
nm(']b', ':BufferLineCycleNext<cr>', 'Go to the next opened buffer')

-- Clear search
nm('<leader>bc', ':nohlsearch<cr>', 'Clear Search Register')
nm("<Esc>", ":noh <CR>", "Clear Highlights");
-- TODO Multiwindow keymaps

-- Terminal Bindings
nm('<leader>tn', ':ToggleTerm<cr>', 'Toggle Term')
nm('<leader>tf', ":lua require('FTerm').toggle()<cr>", "Toggle Term(Floating)")
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


-- Window Bindings
nm("<C-h>", "<C-w>h", "Moves left (buffer)")
nm("<C-j>", "<C-w>j", "Moves up(buffer)")
nm("<C-k>", "<C-w>k", "Moves down (buffer)")
nm("<C-l>", "<C-w>l", "Moves right (buffer)")

-- Window resizing
nm('+', "<C-w>>", "Increases height of Window")
nm('-', "<C-w><", "Increases height of Window")

-- Buffer/Window Creation
nm('<C-v>', "<C-w>v", "Splits window Vertically")


nm('<leader>l', ":Lazy<CR>", "Opens Lazy")
nm('<leader>mo', ":Mason<CR>", "Opens Mason")
