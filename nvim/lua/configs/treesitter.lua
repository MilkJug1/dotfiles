require("nvim-treesitter.configs").setup {
	ensure_installed = { 'vim', 'vimdoc', 'lua', 'cpp', 'c', 'python', 'rust', 'markdown', 'hypr', 'hyprlang' },
	auto_install = true,

	highlight = { enable = true },

	indent = { enable = true },
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.hypr = {
  install_info = {
    url = "https://github.com/luckasRanarison/tree-sitter-hypr",
    files = { "src/parser.c" },
    branch = "master",
  },
  filetype = "hypr",
}
