require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", 
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
})
