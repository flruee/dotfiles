-- Setup
local dap = require('dap')
local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

require('persistent-breakpoints').setup {
    load_breakpoints_event = { "BufReadPost" }
}
-- c++ configuration
dap.adapters.cpp = {
    type = 'executable',
    attach = {
        pidProperty = "pid",
        pidSelect = "ask"
    },
    command = 'codelldb',
    env = {
        LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
    },
    name = "lldb"
}
dap.configurations.cpp = {
    {
        name = "Launch",
        type = "cpp",
        request = "launch",
        program = function()
            vim.cmd("Task start cmake build")
            return vim.fn.getcwd() .. '/build/linux-debug/'
            --return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        args = {},
        runInTerminal = false,
    },
}
-- Keymaps
vim.keymap.set("n", "<leader>dt", function() require("dapui").toggle() end)
vim.keymap.set('n', '<leader>dc', function() require("dap").continue() end)
vim.keymap.set('n', '<leader>dq', function() require("dap").disconnect({ terminateDebuggee = true }) end)
--vim.keymap.set('n', '<leader>db',function() require("persistent-breakpoints.api").toggle_breakpoint() end)
vim.keymap.set('n', '<leader>db', function() require("dap").toggle_breakpoint() end)
