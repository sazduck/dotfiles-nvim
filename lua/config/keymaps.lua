vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to sys clipboard" })
set({ "n", "v" }, "<leader>p", '"0p', { desc = "Paste last yank" })

-- Уменьшение ширины текущей панели (Alt + J)
set("n", "<M-j>", "<cmd>resize -5<cr>", { desc = "Resize window width down" })

-- Увеличение ширины текущей панели (Alt + K)
set("n", "<M-k>", "<cmd>resize +5<cr>", { desc = "Resize window width up" })

-- Уменьшение ширины текущей панели (Alt + H)
set("n", "<M-h>", "<cmd>vertical resize -10<cr>", { desc = "Resize window width left" })

-- Увеличение ширины текущей панели (Alt + L)
set("n", "<M-l>", "<cmd>vertical resize +10<cr>", { desc = "Resize window width right" })

-- Уменьшение ширины текущей панели (Alt + Ctrl + J)
set("n", "<M-C-j>", "<cmd>resize -1<cr>", { desc = "Resize window width down by 1 symbol" })

-- Увеличение ширины текущей панели (Alt + Ctrl + K)
set("n", "<M-C-k>", "<cmd>resize +1<cr>", { desc = "Resize window width up 1 symbol" })

-- Уменьшение ширины текущей панели (Alt + Ctrl + H)
set("n", "<M-C-h>", "<cmd>vertical resize -1<cr>", { desc = "Resize window width left 1 symbol" })

-- Увеличение ширины текущей панели (Alt + Ctrl + L)
set("n", "<M-C-l>", "<cmd>vertical resize +1<cr>", { desc = "Resize window width right 1 symbol" })
