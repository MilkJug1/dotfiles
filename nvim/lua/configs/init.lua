function r(modname)
	require(modname)
end

require "configs.cmp"
require "configs.lsp"
require "configs.telescope"
require "configs.treesitter"
require "configs.code-shot"
require 'configs.which-key'
require 'configs.rust-tools'
require 'configs.dap_config'
-- require 'configs.dashboard'
-- require 'configs.bufferline'
r('configs.bufferline')
r 'configs.noice'
r'configs.autopairs'
r'configs.indent-blankline'
r'configs.symbols-outline'
r'configs.todo-comments'
