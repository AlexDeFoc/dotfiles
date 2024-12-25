return {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    priority = 100,
    lazy = false,
    build = ":TSUpdate",
    opts = {
        ensure_installed = {"c"},
        highlight = {
            enable = true,
        }
    },
    event = {"BufRead", "BufNewFile"},
}
