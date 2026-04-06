return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = 'palenight',
                component_separators = '',
                section_separators = { left = '', right = '' },

            },
            sections = {
                lualine_a = {
                    {
                        'buffers',
                    }
                }
            }
        })
    end,

}
