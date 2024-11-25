-- transparent background
function set_trans_bg_to (name) 
  vim.api.nvim_set_hl(0, name, { bg = 'none' })
end


return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function() 
        vim.cmd.colorscheme "catppuccin-mocha"
        set_trans_bg_to('Normal')
        set_trans_bg_to('NormalFloat')
        set_trans_bg_to('FloatBorder')
        set_trans_bg_to('Pmenu')
    end
}
