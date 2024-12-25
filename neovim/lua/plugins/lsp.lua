return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {"clangd"},
        },
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            lspconfig.clangd.setup({
                capabilities = capabilities,
                filetypes = {"c", "cpp", "h", "hpp"},
                cmd = {
                    "clangd",
                    "--header-insertion=never",
                    "--background-index",
                },
            })
        end,
    },
}
