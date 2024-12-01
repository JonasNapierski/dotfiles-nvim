local dap = require('dap')
local dapui = require("dapui")

dapui.setup()

dap.adapters.codelldb = {
  type = 'server',
  port = "13000",
  executable = {
    command = '/usr/bin/codelldb',
    args = {"--port", "13000"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp




dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

-- ----------------------- KEYMAP -------------------------
vim.keymap.set('n', '<F5>',
    function()
        dap.continue()
    end,
    {
        desc = "[DEBUGGER] continue"
    }
)

vim.keymap.set('n', '<F10>',
    function()
        require('dap').step_over()
    end,
    {
        desc = "[DEBUGGER] step over"
    }
)

vim.keymap.set('n', '<F11>',
    function()
        require('dap').step_into()
    end,
    {
        desc = "[DEBUGGER] step into"
    }
)

vim.keymap.set('n', '<F12>',
    function()
        require('dap').step_out()
    end,
    {
        desc = "[DEBUGGER] step out"
    }
)

vim.keymap.set('n', '<Leader>b',
    function()
        require('dap').toggle_breakpoint()
    end,
    {
        desc = "[DEBUGGER] toggle breakpoint"
    }
)

vim.keymap.set('n', '<Leader>B',
    function()
        require('dap').set_breakpoint()
    end,
    {
        desc = "[DEBUGGER] set breakpoint"
    }
)

vim.keymap.set('n', '<Leader>lp',
    function()
        require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    end,
    {
        desc = "[DEBUGGER] set breakpoint Log point"
    }
)

vim.keymap.set('n', '<Leader>dr',
    function()
        require('dap').repl.open()
    end,
    {
        desc = "[DEBUGGER] open"
    }
)

vim.keymap.set('n', '<Leader>dl',
    function()
        require('dap').run_last()
    end,
    {
        desc = "[DEBUGGER] run last"
    }
)

vim.keymap.set({'n', 'v'}, '<Leader>dh',
    function()
        require('dap.ui.widgets').hover()
    end,
    {
        desc = "[DEBUGGER] hover"
    }
)

vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end,
    {
        desc = "[DEBUGGER] preview"
    })

vim.keymap.set('n', '<Leader>df',
    function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
    end,
    {
        desc = "[DEBUGGER] center float frames"
    }
)

vim.keymap.set('n', '<Leader>ds',
    function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
    end,
    {
        desc = "[DEBUGGER] center float scopes"
    }
)

vim.keymap.set('n','<Leader>dk',
    function()
        dapui.float_element()
    end,
    {
        desc="[DEBUGGER] floating window"
    }
)

vim.keymap.set('n','<Leader>dn',
    function()
        dapui.toggle()
    end,
    {
        desc="[DEBUGGER] open ui"
    }
)
