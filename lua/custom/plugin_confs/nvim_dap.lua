local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = 'D:/ftarroux/scoop/apps/llvm/current/bin/lldb-vscode', -- adjust as needed
  name = "lldb"
}
local dap = require('dap')
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    -- program = function()
    --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    -- end,
    program = "${workspaceFolder}/build/bin/Debug/MATISSE.exe",
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    args = {},

    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


