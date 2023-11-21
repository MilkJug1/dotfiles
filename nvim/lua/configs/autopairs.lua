require('nvim-autopairs').setup {
	check_ts = true,
}

require('nvim-autopairs').add_rules(require'nvim-autopairs.rules.endwise-lua')
