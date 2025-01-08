return {
    {
       "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local conf = require("nvim-treesitter.configs")
            conf.setup({
                ensure_installed = {
                    "c", 
                    "lua", 
                    "rust", 
                    "ruby", 
                    "java",
                    "vim", 
                    "html", 
                    "go",
                    "json",
                    "javascript", 
                    "python", 
                    "yaml", 
                    "toml", 
                    "json"  },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    use_languagetree = true,
                },
                indent = {
                    enable = true,
                },
            })
        end
    }
}
