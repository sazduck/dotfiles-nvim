function Sad(line_nr, from, to, fname)
  vim.cmd(string.format("silent !sed -i '%ss/%s/%s/' %s", line_nr, from, to, fname)) 
end

local alacritty_toml_path = '~/.config/alacritty/alacritty.toml'
function IncreasePadding() 
  Sad('07', 0, 15, alacritty_toml_path)
  Sad('08', 0, 15, alacritty_toml_path)
end

function DecreasePadding()
  Sad('07', 15, 0, alacritty_toml_path)
  Sad('08', 15, 0, alacritty_toml_path)
end

vim.cmd[[
  augroup ChangeAlacrittyPadding
   au! 
   au VimEnter    * lua DecreasePadding()
   au VimLeavePre * lua IncreasePadding()
  augroup END 
]]
