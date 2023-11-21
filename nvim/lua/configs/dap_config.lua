require('dapui').setup()

local dap, dapui = require("dap"), require('dapui')

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end 

require('keymaps')

nm('<leader>dt', ':DapToggleBreakpoint<CR>', "Toggle Breakpoint (Debugging)")
nm('<leader>dx', ':DapTerminate<CR>', "Terminate Debugging Session")
nm('<leader>dn', 'DapStepOver<CR>', 'Step over in Debugging Session')
