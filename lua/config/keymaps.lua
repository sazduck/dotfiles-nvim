vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

set({'n', 'v'}, '<leader>y', '"+y')
set({'n', 'v'}, '<leader>p', '"+0')

-- Уменьшение ширины текущей панели (Alt + J)
vim.keymap.set('n', '<M-j>', '<Cmd>resize -5<CR>', { desc = 'Resize window width down' })

-- Увеличение ширины текущей панели (Alt + K)
vim.keymap.set('n', '<M-k>', '<Cmd>resize +5<CR>', { desc = 'Resize window width up' })

-- Уменьшение ширины текущей панели (Alt + H)
vim.keymap.set('n', '<M-h>', '<Cmd>vertical resize -10<CR>', { desc = 'Resize window width left' })

-- Увеличение ширины текущей панели (Alt + L)
vim.keymap.set('n', '<M-l>', '<Cmd>vertical resize +10<CR>', { desc = 'Resize window width right' })

-- Уменьшение ширины текущей панели (Alt + J)
vim.keymap.set('n', '<M-C-j>', '<Cmd>resize -1<CR>', { desc = 'Resize window width down' })

-- Увеличение ширины текущей панели (Alt + K)
vim.keymap.set('n', '<M-C-k>', '<Cmd>resize +1<CR>', { desc = 'Resize window width up' })

-- Уменьшение ширины текущей панели (Alt + H)
vim.keymap.set('n', '<M-C-h>', '<Cmd>vertical resize -1<CR>', { desc = 'Resize window width left' })

-- Увеличение ширины текущей панели (Alt + L)
vim.keymap.set('n', '<M-C-l>', '<Cmd>vertical resize +1<CR>', { desc = 'Resize window width right' })
