local neotree = require("neo-tree")
require("jpudel.custom-template-selector")

neotree.setup({
  event_handlers = {
        {
            event = "file_added",
            handler = function (file_path)
                local stat = vim.loop.fs_stat(file_path)
                if stat and stat.type == "file" then
                    vim.print("hello world")
                    vim.cmd("CreateFileWithTemplate " .. file_path)
                end
            end,
        },
    }
})

