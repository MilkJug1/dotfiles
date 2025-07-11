return {
    { -- optional blink completion source for require statements and module annotations
        "saghen/blink.cmp",
        -- build = 'cargo build --release',
        event = { "LspAttach"},
        dependencies = { "L3MON4D3/LuaSnip", version = "v2.*"},
        version = "1.*",
        opts = {
            -- highlight = {
            --
            --     use_nvim_cmp_as_default = true,
            -- },

            keymap={
                preset = 'default',
                ["<Tab>"] = {"snippet_forward", "fallback"},
                ["<S-Tab>"] = {"snippet_backward", "fallback"},


                ["<Up>"] = {"select_prev", "fallback"},
                ["<Down>"] = {"select_next", "fallback"},
                ["<C-p>"] = {"select_prev", "fallback"},
                ["<C-n>"] = {"select_next", "fallback"},


                ["<C-b>"] = {"scroll_documentation_up", "fallback"},
                ["<C-f>"] = {"scroll_documentation_down", "fallback"},

                ["<C-space>"] = {"show", "show_documentation", "hide_documentation"},
                ["<C-e>"] = { "hide", "fallback"},

                ["<CR>"] = { "accept", "fallback"},


            },
            snippets = { preset = 'luasnip'},

            sources = {
                -- add lazydev to your completion providers
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                },
            },

            fuzzy = { implementation = "prefer_rust_with_warning"},

            completion = {
                documentation = { auto_show = true},
                ghost_text = {enabled = true},
            },
        },
        opts_extend = {"sources.default"}
    },
}

