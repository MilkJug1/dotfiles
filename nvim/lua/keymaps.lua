require('globals')

local bufnr = vim.api.nvim_get_current_buf()

-- map.set('n', '<leader>f', ':Neotree<CR>')
map('n', ';', ':')
-- map('n', '<leader>:l', require("noice").cmd("lua"), {desc = "Opens command line with lua"})
-- File browser with Telescope file browser extension /

nm('<leader>r', ':Telescope file_browser<cr>', "Telescope File browser")
-- nm('<leader>ps', require('code-shot').shot(), "Takes a screenshot of whole file")
-- map({ 'n', 'v' }, '<leader>ps', require('code-shot').shot)
nm('<leader>ll', ':Lazy<cr>', "Run lazy")
-- nm('<C-n>', ':NvimTreeToggle<CR>', "Opens Neotree")
-- nm('<leader>e', ':NvimTreeFocus <CR>', "Focus Nvimtree")
-- nm('<leader>f', ':NvimTreeFocus<CR>', 'Focuses NvimTree')

nm('<leader>n', ':lua require("oil").toggle_float()<CR>', 'Opens Oil')

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
-- nm('<C-a>', require('cmp').mapping.open_docs, "LSP Open Docs")
nm('<leader>fd', vim.diagnostic.open_float, "Floating diagnostic")
-- Symbols outline
-- nm('<leader>so', ':SymbolsOutline<cr>', "Opens Symbols Outline UI")
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
-- im("<C-i>", ':IconPickerInsert emoji nerd_font alt_font symbols<cr>', "Inserts icon while in Insert Mode")
-- nm('<leader>iy', ":IconPickerYank<cr>", "Pick Icon and Yank it to buffer")
-- nm("<leader>in", ":IconPickerNormal<cr>", "Pick Icon and insert it into Buffer (Normal Mode)")


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

vim.keymap.set({ "n", "i" }, "<M-l>", function()
    -- Get the current line/row/column
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local row, _ = cursor_pos[1], cursor_pos[2]
    local line = vim.api.nvim_get_current_line()
    -- 1) If line is empty => replace it with "- [ ] " and set cursor after the brackets
    if line:match("^%s*$") then
        local final_line = "- [ ] "
        vim.api.nvim_set_current_line(final_line)
        -- "- [ ] " is 6 characters, so cursor col = 6 places you *after* that space
        vim.api.nvim_win_set_cursor(0, { row, 6 })
        return
    end
    -- 2) Check if line already has a bullet with possible indentation: e.g. "  - Something"
    --    We'll capture "  -" (including trailing spaces) as `bullet` plus the rest as `text`.
    local bullet, text = line:match("^([%s]*[-*]%s+)(.*)$")
    if bullet then
        -- Convert bullet => bullet .. "[ ] " .. text
        local final_line = bullet .. "[ ] " .. text
        vim.api.nvim_set_current_line(final_line)
        -- Place the cursor right after "[ ] "
        -- bullet length + "[ ] " is bullet_len + 4 characters,
        -- but bullet has trailing spaces, so #bullet includes those.
        local bullet_len = #bullet
        -- We want to land after the brackets (four characters: `[ ] `),
        -- so col = bullet_len + 4 (0-based).
        vim.api.nvim_win_set_cursor(0, { row, bullet_len + 4 })
        return
    end
    -- 3) If there's text, but no bullet => prepend "- [ ] "
    --    and place cursor after the brackets
    local final_line = "- [ ] " .. line
    vim.api.nvim_set_current_line(final_line)
    -- "- [ ] " is 6 characters
    vim.api.nvim_win_set_cursor(0, { row, 6 })
end, { desc = "Convert bullet to a task or insert new task bullet" })



vim.keymap.set("n", "<M-x>", function()
    -- Customizable variables
    -- NOTE: Customize the completion label
    local label_done = "done:"
    -- NOTE: Customize the timestamp format
    local timestamp = os.date("%y%m%d-%H%M")
    -- local timestamp = os.date("%y%m%d")
    -- NOTE: Customize the heading and its level
    local tasks_heading = "## Completed tasks"
    -- Save the view to preserve folds
    vim.cmd("mkview")
    local api = vim.api
    -- Retrieve buffer & lines
    local buf = api.nvim_get_current_buf()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local start_line = cursor_pos[1] - 1
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    local total_lines = #lines
    -- If cursor is beyond last line, do nothing
    if start_line >= total_lines then
        vim.cmd("loadview")
        return
    end
    ------------------------------------------------------------------------------
    -- (A) Move upwards to find the bullet line (if user is somewhere in the chunk)
    ------------------------------------------------------------------------------
    while start_line > 0 do
        local line_text = lines[start_line + 1]
        -- Stop if we find a blank line or a bullet line
        if line_text == "" or line_text:match("^%s*%-") then
            break
        end
        start_line = start_line - 1
    end
    -- Now we might be on a blank line or a bullet line
    if lines[start_line + 1] == "" and start_line < (total_lines - 1) then
        start_line = start_line + 1
    end
    ------------------------------------------------------------------------------
    -- (B) Validate that it's actually a task bullet, i.e. '- [ ]' or '- [x]'
    ------------------------------------------------------------------------------
    local bullet_line = lines[start_line + 1]
    if not bullet_line:match("^%s*%- %[[x ]%]") then
        -- Not a task bullet => show a message and return
        print("Not a task bullet: no action taken.")
        vim.cmd("loadview")
        return
    end
    ------------------------------------------------------------------------------
    -- 1. Identify the chunk boundaries
    ------------------------------------------------------------------------------
    local chunk_start = start_line
    local chunk_end = start_line
    while chunk_end + 1 < total_lines do
        local next_line = lines[chunk_end + 2]
        if next_line == "" or next_line:match("^%s*%-") then
            break
        end
        chunk_end = chunk_end + 1
    end
    -- Collect the chunk lines
    local chunk = {}
    for i = chunk_start, chunk_end do
        table.insert(chunk, lines[i + 1])
    end
    ------------------------------------------------------------------------------
    -- 2. Check if chunk has [done: ...] or [untoggled], then transform them
    ------------------------------------------------------------------------------
    local has_done_index = nil
    local has_untoggled_index = nil
    for i, line in ipairs(chunk) do
        -- Replace `[done: ...]` -> `` `done: ...` ``
        chunk[i] = line:gsub("%[done:([^%]]+)%]", "`" .. label_done .. "%1`")
        -- Replace `[untoggled]` -> `` `untoggled` ``
        chunk[i] = chunk[i]:gsub("%[untoggled%]", "`untoggled`")
        if chunk[i]:match("`" .. label_done .. ".-`") then
            has_done_index = i
            break
        end
    end
    if not has_done_index then
        for i, line in ipairs(chunk) do
            if line:match("`untoggled`") then
                has_untoggled_index = i
                break
            end
        end
    end
    ------------------------------------------------------------------------------
    -- 3. Helpers to toggle bullet
    ------------------------------------------------------------------------------
    -- Convert '- [ ]' to '- [x]'
    local function bulletToX(line)
        return line:gsub("^(%s*%- )%[%s*%]", "%1[x]")
    end
    -- Convert '- [x]' to '- [ ]'
    local function bulletToBlank(line)
        return line:gsub("^(%s*%- )%[x%]", "%1[ ]")
    end
    ------------------------------------------------------------------------------
    -- 4. Insert or remove label *after* the bracket
    ------------------------------------------------------------------------------
    local function insertLabelAfterBracket(line, label)
        local prefix = line:match("^(%s*%- %[[x ]%])")
        if not prefix then
            return line
        end
        local rest = line:sub(#prefix + 1)
        return prefix .. " " .. label .. rest
    end
    local function removeLabel(line)
        -- If there's a label (like `` `done: ...` `` or `` `untoggled` ``) right after
        -- '- [x]' or '- [ ]', remove it
        return line:gsub("^(%s*%- %[[x ]%])%s+`.-`", "%1")
    end
    ------------------------------------------------------------------------------
    -- 5. Update the buffer with new chunk lines (in place)
    ------------------------------------------------------------------------------
    local function updateBufferWithChunk(new_chunk)
        for idx = chunk_start, chunk_end do
            lines[idx + 1] = new_chunk[idx - chunk_start + 1]
        end
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    end
    ------------------------------------------------------------------------------
    -- 6. Main toggle logic
    ------------------------------------------------------------------------------
    if has_done_index then
        chunk[has_done_index] = removeLabel(chunk[has_done_index]):gsub("`" .. label_done .. ".-`", "`untoggled`")
        chunk[1] = bulletToBlank(chunk[1])
        chunk[1] = removeLabel(chunk[1])
        chunk[1] = insertLabelAfterBracket(chunk[1], "`untoggled`")
        updateBufferWithChunk(chunk)
        vim.notify("Untoggled", vim.log.levels.INFO)
    elseif has_untoggled_index then
        chunk[has_untoggled_index] =
            removeLabel(chunk[has_untoggled_index]):gsub("`untoggled`", "`" .. label_done .. " " .. timestamp .. "`")
        chunk[1] = bulletToX(chunk[1])
        chunk[1] = removeLabel(chunk[1])
        chunk[1] = insertLabelAfterBracket(chunk[1], "`" .. label_done .. " " .. timestamp .. "`")
        updateBufferWithChunk(chunk)
        vim.notify("Completed", vim.log.levels.INFO)
    else
        -- Save original window view before modifications
        local win = api.nvim_get_current_win()
        local view = api.nvim_win_call(win, function()
            return vim.fn.winsaveview()
        end)
        chunk[1] = bulletToX(chunk[1])
        chunk[1] = insertLabelAfterBracket(chunk[1], "`" .. label_done .. " " .. timestamp .. "`")
        -- Remove chunk from the original lines
        for i = chunk_end, chunk_start, -1 do
            table.remove(lines, i + 1)
        end
        -- Append chunk under 'tasks_heading'
        local heading_index = nil
        for i, line in ipairs(lines) do
            if line:match("^" .. tasks_heading) then
                heading_index = i
                break
            end
        end
        if heading_index then
            for _, cLine in ipairs(chunk) do
                table.insert(lines, heading_index + 1, cLine)
                heading_index = heading_index + 1
            end
            -- Remove any blank line right after newly inserted chunk
            local after_last_item = heading_index + 1
            if lines[after_last_item] == "" then
                table.remove(lines, after_last_item)
            end
        else
            table.insert(lines, tasks_heading)
            for _, cLine in ipairs(chunk) do
                table.insert(lines, cLine)
            end
            local after_last_item = #lines + 1
            if lines[after_last_item] == "" then
                table.remove(lines, after_last_item)
            end
        end
        -- Update buffer content
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        vim.notify("Completed", vim.log.levels.INFO)
        -- Restore window view to preserve scroll position
        api.nvim_win_call(win, function()
            vim.fn.winrestview(view)
        end)
    end
    -- Write changes and restore view to preserve folds
    -- "Update" saves only if the buffer has been modified since the last save
    vim.cmd("silent update")
    vim.cmd("loadview")
end, { desc = "[P]Toggle task and move it to 'done'" })
