require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

require("keymaps")

-- nm("<leader>dt", ":DapToggleBreakpoint<CR>", "Toggle Breakpoint (Debugging)")
-- nm("<leader>dx", ":DapTerminate<CR>", "Terminate Debugging Session")
-- nm("<leader>dn", ":DapStepOver<CR>", "Step over in Debugging Session")
--
--

require("mason-nvim-dap").setup({
	ensure_installed = { "cppdbg" },
	automatic_installation = true,
	handlers = {
		function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})

-- Adapter
-- dap.adapters.lldb = {
-- 	type = "executable",
-- 	command = "/usr/bin/lldb",
-- 	name = "lldb",
-- }
-- Configurations for C/C++
dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
	},
	{
		name = "Attach to gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
}
dap.configurations.c = dap.configurations.cpp

