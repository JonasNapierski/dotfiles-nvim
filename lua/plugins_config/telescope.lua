require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
  },
  extensions = {
  }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n','<leader>ff', builtin.find_files, {desc="Telescope search find files"})
vim.keymap.set('n','<leader>fg', builtin.live_grep, {desc="Telescope search live grep"})
vim.keymap.set('n','<leader>fb', builtin.buffers, {desc="Telescope search buffer"})
vim.keymap.set('n','<leader>fh', builtin.help_tags, {desc="Telescope search help tags"})
vim.keymap.set('n','<leader>fk', builtin.keymaps, {desc="Telescope search keymaps"})
vim.keymap.set('n','<leader>fs', builtin.lsp_document_symbols, {desc="Telescope search all the symbols in the document"})
