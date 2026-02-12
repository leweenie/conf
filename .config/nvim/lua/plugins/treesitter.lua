return {
    {
        "nvim-treesitter/nvim-treesitter",
        priority = 1000,
        enabled = true,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.config").setup({
                auto_install = true,
                ignore_install = {},
                ensure_installed = { "python", "css", "html", "cpp", "go", "rust", "javascript", "typescript", "c", "asm" },
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true,
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },
}
