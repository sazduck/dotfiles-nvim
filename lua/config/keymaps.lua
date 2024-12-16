vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

set({'n', 'v'}, '<leader>y', '"+y')
