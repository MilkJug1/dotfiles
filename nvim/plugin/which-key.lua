require('globals')

vim.pack.add({ gh("folke/which-key.nvim") })

vim.o.timeout = true
vim.o.timeoutlen = 300

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
