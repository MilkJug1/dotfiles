function r(modname)
	require(modname)
end

-- require "configs.cmp"
require "configs.telescope"
require "configs.treesitter"
require "configs.code-shot"
require 'configs.which-key'
-- require 'configs.dap_config'
-- require 'configs.dashboard'
-- require 'configs.bufferline'
r 'configs.noice'
r'configs.autopairs'
r'configs.indent-blankline'
r'configs.todo-comments'
r'configs.rustaceanvim'
-- r'configs.oil'

