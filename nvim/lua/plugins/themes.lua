return {
    -- tokyo dark
    -- duskfox
    -- catppuccin
    --

    {
        'tiagovla/tokyodark.nvim',
        config = function()
            -- require('tokyodark').setup({
            --     transparent_background = true,
            -- })
        end

    },


    {
        'catppuccin/nvim',
        config = function()
            require('catppuccin').setup({
                -- transparent_background = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    harpoon = true,
                    illuminate = true,
                    indent_blankline = {
                        enabled = true,
                        scope_color = "sapphire",
                        colored_indent_levels = false,
                    },
                    mason = true,
                    native_lsp = { enabled = true },
                    notify = true,
                    nvimtree = true,
                    neotree = true,
                    telescope = true,
                    treesitter = true,
                    treesitter_context = true,
                },
            })
        end
    },

    {
        'EdenEast/nightfox.nvim',
        config = function()
            require('nightfox').setup({
                options = {
                    -- transparent = true,
                }
            })
            vim.cmd("colorscheme tokyodark")
        end
    },




}
