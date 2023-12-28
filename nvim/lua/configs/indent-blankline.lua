require('ibl').setup{
	scope = {
		enabled = true,
		show_start = false,
		show_end = true,
		highlight = {'Function', 'Label'}
	},
	exclude = {
		filetypes = {
			'lspinfo',
			'lazy',
			'checkhealth',
			'help',
			'man',
			'dashboard',
			'',
		},
	},
}
