vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Yank to sys clipboard' })
set({'n', 'v'}, '<leader>p', '"0p', { desc = 'Paste last yank' })

-- Уменьшение ширины текущей панели (Alt + J)
set('n', '<M-j>', '<Cmd>resize -5<CR>', { desc = 'Resize window width down' })

-- Увеличение ширины текущей панели (Alt + K)
set('n', '<M-k>', '<Cmd>resize +5<CR>', { desc = 'Resize window width up' })

-- Уменьшение ширины текущей панели (Alt + H)
set('n', '<M-h>', '<Cmd>vertical resize -10<CR>', { desc = 'Resize window width left' })

-- Увеличение ширины текущей панели (Alt + L)
set('n', '<M-l>', '<Cmd>vertical resize +10<CR>', { desc = 'Resize window width right' })

-- Уменьшение ширины текущей панели (Alt + J)
set('n', '<M-C-j>', '<Cmd>resize -1<CR>', { desc = 'Resize window width down by 1 symbol' })

-- Увеличение ширины текущей панели (Alt + K)
set('n', '<M-C-k>', '<Cmd>resize +1<CR>', { desc = 'Resize window width up 1 symbol' })

-- Уменьшение ширины текущей панели (Alt + H)
set('n', '<M-C-h>', '<Cmd>vertical resize -1<CR>', { desc = 'Resize window width left 1 symbol' })

-- Увеличение ширины текущей панели (Alt + Ctrl + L)
set('n', '<M-C-l>', '<Cmd>vertical resize +1<CR>', { desc = 'Resize window width right 1 symbol' })
