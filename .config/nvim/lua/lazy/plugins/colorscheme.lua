function ApplyColor(color)
	color = color or "Tomorrow-Night-Eighties"
  
    	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "chriskempson/vim-tomorrow-theme",
        config = function()
            vim.cmd("colorscheme Tomorrow-Night-Eighties")
            
            ApplyColor()
        end
    }
}
