return {
        'folke/which-key.nvim',
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
}

-- local wk = require('which-key')
-- local lz = require('lazy')
--
--
-- wk.setup()
--
-- wk.register({
-- 	['<leader>g'] = {name = 'Git'},
-- 	['<leader>d'] = {name = '+Debugging'}
-- })
