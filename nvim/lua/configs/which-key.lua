local wk = require('which-key')
local lz = require('lazy')


wk.setup()

wk.register({
	['<leader>g'] = {name = 'Git'},
	['<leader>d'] = {name = '+Debugging'}
})
