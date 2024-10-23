local on_attach = function(_, bufnr)
    local bufmap = function(keys, func)
        vim.keymap.set('n', keys, func, { buffer = bufnr })
    end
    --
    -- bufmap('K', vim.lsp.buf.hover)

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, {})
end


local MY_FQBN = "arduino:avr:mega"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- require('lspconfig').lua_ls.setup {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	Lua = {
-- 		workspace = { checkThirdParty = false },
-- 		telemetry = { enable = false },
-- 	},
-- }

-- local cmp_nvim_lsp = require "cmp_nvim_lsp"
--
-- require("lspconfig").clangd.setup {
--   on_attach = on_attach,
--   capabilities = cmp_nvim_lsp.default_capabilities(),
--   cmd = {
--     "clangd",
--     "--offset-encoding=utf-16",
--   },
-- }


require('mason').setup()
require('mason-lspconfig').setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
        }
    end,

    ["lua_ls"] = function()
        require('neodev').setup()
        require('lspconfig').lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            }
        }
    end,

    ["clangd"] = function()
        require('lspconfig').clangd.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = {
                'clangd',
                '--offset-encoding=utf-16',
            },
        }
    end,

    -- ["arduino-language-server"] = function()
    -- 	require('lspconfig').arduino_language_server.setup {
    -- 		on_attach = on_attach,
    -- 		capabilities = capabilities,
    -- 		cmd = {
    -- 			'arduino-language-server'
    -- 		}
    -- 	}
    -- end
})
