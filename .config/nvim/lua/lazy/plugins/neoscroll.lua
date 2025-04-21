return {
    "karb94/neoscroll.nvim",
    config = function()
        require("neoscroll").setup({
            easing = "circular",
            duration_multiplier = 0.7,
        })
    end,
}
