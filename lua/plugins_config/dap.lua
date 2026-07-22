local dap = require('dap')
local dapui = require("dapui")

require("dap-python").setup("python")

dapui.setup()

local function find_csproj_dll()
  local cwd = vim.fn.getcwd()

  -- Find csproj
  local csproj = vim.fn.glob(cwd .. "/**/*.csproj", true, true)[1]
  if not csproj then
    return nil
  end

  -- Extract project name
  local project_name = vim.fn.fnamemodify(csproj, ":t:r")

  -- Assume standard dotnet output path
  local dll = cwd .. "/bin/Debug/net8.0/" .. project_name .. ".dll"

  if vim.fn.filereadable(dll) == 1 then
    return dll
  end

  -- Try net7/net6 fallback
  for _, version in ipairs({ "net7.0", "net6.0", "net10.0" }) do
    local fallback = cwd .. "/bin/Debug/" .. version .. "/" .. project_name .. ".dll"
    if vim.fn.filereadable(fallback) == 1 then
      return fallback
    end
  end

  return nil
end


local function build_and_debug()
  vim.fn.jobstart({ "dotnet", "build" }, {
    cwd = vim.fn.getcwd(),
    on_exit = function(_, code)
      if code ~= 0 then
        vim.notify("dotnet build failed", vim.log.levels.ERROR)
        return
      end

      local dll = find_csproj_dll()

      if not dll then
        vim.notify("Could not find DLL", vim.log.levels.ERROR)
        return
      end

      dap.run({
        type = "coreclr",
        name = ".NET Launch",
        request = "launch",
        program = dll,
      })
    end,
  })
end


vim.keymap.set(
  "n",
  "<leader>db",
  build_and_debug,
  { desc = "Build C# and debug" }
)

dap.adapters.codelldb = {
  type = 'server',
  port = "13000",
  executable = {
    command = 'codelldb',
    args = {"--port", "13000"},

  }
}

dap.adapters.coreclr = {
    type = "executable",
    command = "netcoredbg",
    args = {"--interpreter=vscode"},
}

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input(
                "Path to dll: ",
                vim.fn.getcwd() .. "/bin/Debug/",
                "file"
            )
        end,
    },
}


dap.adapters.coreclr = {
  type = 'executable',
  command = 'netcoredbg',
  args = {'--interpreter=vscode'}
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

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

dap.listeners.before.attach.dapui_config = function()
    -- dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
    -- dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
    -- dapui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
    -- dapui.close()
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

vim.fn.sign_define('DapBreakpoint', {text='', texthl='RedrawDebugRecompose', linehl='RedrawDebugRecompose', numhl='RedrawDebugRecompose'})
vim.keymap.set('n', '<Leader>dt', require('dap-python').test_method, { desc = "[DEBUGGER] debug test method under the cursor" })

