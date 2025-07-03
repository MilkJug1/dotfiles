vim.lsp.enable({ "zls", "clangd", "lua_ls", "pyright", "cmake", "bashls", "marksman", })

-- Seemingly Mason-lspconfig stuff is not working no more, heres is a semi-temp workaround till i can make a better config
-- vim.lsp.config['luals'] = {
--     -- Command and arguments to start the server.
--     cmd = { 'lua-language-server' },
--     -- Filetypes to automatically attach to.
--     filetypes = { 'lua' },
--     -- Sets the "root directory" to the parent directory of the file in the
--     -- current buffer that contains either a ".luarc.json" or a
--     -- ".luarc.jsonc" file. Files that share a root directory will reuse
--     -- the connection to the same LSP server.
--     -- Nested lists indicate equal priority, see |vim.lsp.Config|.
--     root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
--     -- Specific settings to send to the server. The schema for this is
--     -- defined by the server. For example the schema for lua-language-server
--     -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
--     settings = {
--         Lua = {
--             runtime = {
--                 version = 'LuaJIT',
--             }
--         }
--     }
-- }

-- Add LSP related plugins here, configuration goes on top.
return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },


    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
    },

    {
        "onsails/lspkind.nvim"
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "zls", "cpptools" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            vim.lsp.enable('lua_ls')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
        end
    }

}
