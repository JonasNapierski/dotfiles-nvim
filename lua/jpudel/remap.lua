-- @author Jonas
-- This is my personal neovim configuration. If you want to you it checkout the github repo!
vim.g.mapleader = 't'
vim.g.maplocalleader = 't'

-- ---------------------------- Build C ----------------------------
vim.keymap.set("n", "<leader>pb","!make", {desc="Build project"})
-- ---------------------------- Normal Mode ----------------------------
vim.keymap.set("n", "<leader>pv",vim.cmd.Ex, {desc="Open file explorer"})
vim.keymap.set("n", "<leader>u", ":call CocActionAsync('codeAction','cursor')<cr>", {desc="CodeAction"})
-- Neotree
vim.keymap.set('n', '<leader>#', 'Neotree<cr>', {desc="Toggle Neotree"})
-- Set toggle  for what was searched
vim.keymap.set('n', '<c-h>',':set hlsearch!<cr>', {desc="Toggle hide/show search term"})
vim.keymap.set('n', '<leader>s',':w<cr>', {desc="Saves the currently open file"})
vim.keymap.set('n', '<leader>c', ':!', {desc="Shortcut for using a command"})


vim.keymap.set('n', '<leader>gf', ':!git add .<cr><cr>', {desc="git add ."})
vim.keymap.set('n', '<leader>gc', ':!git commit -m ""<left>', {desc="git commit -m"})
vim.keymap.set('n', '<leader>go', ':!git push<cr><cr>', {desc="git push"})
vim.keymap.set('n', '<leader>gs', ':!git status<cr>', {desc="git status"})


-- ---------------------------- REMAP keys ----------------------------
-- Remap for german keyboard layout QWERTZ
vim.keymap.set('n', 'ö', '{', {remap = true, desc="Remap default { to german ö"})
vim.keymap.set('n', 'ä', '}', {remap = true, desc="Remap default } to german ä"})

vim.keymap.set('n', 'Ö', '[', {remap = true, desc="Remap default [ to german Ö"})
vim.keymap.set('n', 'Ä', ']', {remap = true, desc="Remap default ] to german Ä"})

vim.keymap.set('n', 'ü', '/', {remap = true, desc="Remap default / to german ü (substitute)"})
vim.keymap.set('n','^^','<del>', {remap = true, desc="Remap ^^ to delete the last one"})


-- Add a descriptions to the keymap
vim.keymap.set('n', 'I', 'I', {desc="Insert in line start"})
vim.keymap.set('n', 'A', 'A', {desc="Insert in line end (append)"})

vim.keymap.set('n', 'f', 'f', {desc="find character and goto it (hover over it)"})
vim.keymap.set('n', 't', 't', {desc="find character and goto it one before (move one char before that one)"})

vim.keymap.set('n', 'F', 'F', {desc="find character and go backwards to it (hover over it)"})
vim.keymap.set('n', 'T', 'T', {desc="find character and go backwards it one before (move one char before that one)"})

-- ---------------------------- Visual Mode ----------------------------
vim.keymap.set('v', 'ö', '{', {remap = true, desc="Remap default { to german ö"})
vim.keymap.set('v', 'ä', '}', {remap = true, desc="Remap default } to german ä"})

vim.keymap.set('v', 'Ö', '[', {remap = true, desc="Remap default [ to german Ö"})
vim.keymap.set('v', 'Ä', ']', {remap = true, desc="Remap default ] to german Ä"})

vim.keymap.set('n', '<leader>n', ':Neotree toggle<cr>', {remap = true, desc="toggle tree view"})


vim.keymap.set('n', 'z<Tab>', ':tabnext<CR>', { noremap = true, desc="Circle throw the tabs", silent = true })


vim.keymap.set('t', '<escape>', "<C-\\><C-n><C-w>h",{ silent = true})
-- ---------------------------- LSP ----------------------------
-- local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
-- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
-- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
-- vim.keymap.set('n', '<c-s>', vim.lsp.buf.signature_help, opts)
-- vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)

-- optional insert mode mappings
vim.keymap.set('i', '<Tab>', function()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true, buffer = bufnr })

vim.keymap.set('i', '<S-Tab>', function()
    return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true, buffer = bufnr })

vim.keymap.set('i', '<CR>', function()
    return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end, { expr = true, buffer = bufnr })

vim.keymap.set('i', '<C-Space>', function()
    vim.lsp.completion.get()
end, { buffer = bufnr })
