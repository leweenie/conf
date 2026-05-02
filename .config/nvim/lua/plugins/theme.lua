return {
    {
        "folke/tokyonight.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        config = function()
            require('tokyonight').setup({
                transparent = false,
                styles = {
                    functions = {},
                    variables = {},
                    sidebars = "transparent",
                    floats = "transparent",
                },
            })
            vim.cmd.colorscheme('tokyonight-moon')
            vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniTablineFill", { bg = "NONE" })
        end
    },
}
