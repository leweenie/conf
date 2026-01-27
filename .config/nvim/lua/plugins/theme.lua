return {
    {
        "folke/tokyonight.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require('tokyonight').setup({
                transparent = true,
            })
            vim.cmd.colorscheme('tokyonight-night')
            vim.api.nvim_set_hl(0, "FzfLuaBorder", { fg = "#16161E", bg = "#16161E" })

            vim.lsp.buf.hover({
                border = "single",
                width = 60,
                vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#16161E", bg = "#16161E" }),
            })
        end
    },
}
