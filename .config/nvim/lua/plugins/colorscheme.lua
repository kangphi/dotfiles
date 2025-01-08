return {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "catppuccin"
            vim.o.termguicolors = true
            vim.o.background = "dark"
        end,
        styles = {
            comments = { "italic" },
        }
}
