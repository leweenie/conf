return {
    {
        "nvim-treesitter/nvim-treesitter",
        priority = 2,
        enabled = true,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.config").setup({
                auto_install = true,
                modules = {},
                ignore_install = {},
                ensure_installed = {
                    "python",
                    "css",
                    "html",
                    "c"
                },
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
