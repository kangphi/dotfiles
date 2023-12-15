require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", 
        "lua", 
        "rust", 
        "ruby", 
        "java",
        "vim", 
        "html", 
        "go", 
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
