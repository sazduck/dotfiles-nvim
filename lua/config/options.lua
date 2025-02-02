local opt = vim.opt

-- line number
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2        -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2     -- 2 spaces for indent width
opt.expandtab = true   -- expand tab to spaces
opt.autoindent = true  -- copy indent from current line when starting new one
opt.smartindent = true -- smart one

-- line wrapping
opt.wrap = true -- disable line wrapping
opt.linebreak = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)

opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"  -- show sign column so that text doesn't shift

-- mouse
opt.mouse = "a"

-- backspace
-- opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- spelling
opt.spelllang = { "en_us", "ru" } -- Словари рус eng
opt.spell = true

-- под винду

if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  opt.shell = "powershell"
end
