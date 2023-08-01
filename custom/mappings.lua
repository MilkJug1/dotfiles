---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = {":", "<cmd> FineCmdline <CR>", opts = { nowait = true}},
  },
}

-- more keybinds!
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}

return M
