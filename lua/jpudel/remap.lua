-- @author Jonas
-- This is my personal neovim configuration. If you want to you it checkout the github repo!
vim.g.mapleader = 't'
vim.g.maplocalleader = 't'

-- Custom remaps
vim.keymap.set("n", "<leader>pv",vim.cmd.Ex, {desc="Open file explorer"})

-- Set toggle  for what was searched
vim.keymap.set('n', '<c-h>',':set hlsearch!<cr>', {desc="Toggle hide/show search term"})


-- ---------------------------- REMAP keys ----------------------------
-- Remap for german keyboard layout QWERTZ
vim.keymap.set('n', 'ö', '{', {remap = true, desc="Remap default { to german ö"})
vim.keymap.set('n', 'ä', '}', {remap = true, desc="Remap default } to german ä"})

vim.keymap.set('n', 'Ö', '[', {remap = true, desc="Remap default [ to german Ö"})
vim.keymap.set('n', 'Ä', ']', {remap = true, desc="Remap default ] to german Ä"})

vim.keymap.set('n', 'ü', '/', {remap = true, desc="Remap default / to german ü (substitute)"})

-- Add a descriptions to the keymap
vim.keymap.set('n', 'I', 'I', {desc="Insert in line start"})
vim.keymap.set('n', 'A', 'A', {desc="Insert in line end (append)"})

vim.keymap.set('n', 'f', 'f', {desc="find character and goto it (hover over it)"})
vim.keymap.set('n', 't', 't', {desc="find character and goto it one before (move one char before that one)"})

vim.keymap.set('n', 'F', 'F', {desc="find character and go backwards to it (hover over it)"})
vim.keymap.set('n', 'T', 'T', {desc="find character and go backwards it one before (move one char before that one)"})
