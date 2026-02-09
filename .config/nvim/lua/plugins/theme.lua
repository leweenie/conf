return {
    {
        "folke/tokyonight.nvim",
        enabled = false,
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require('tokyonight').setup({
                transparent = false,
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
    {
        "sainnhe/sonokai",
        config = function()
            vim.g.sonokai_enable_italic = true
            vim.g.sonokai_diagnostic_text_highlight = 1
            vim.cmd.colorscheme('sonokai')
            vim.api.nvim_set_hl(0, "FzfLuaBorder", { fg = "#2c2e34", bg = "#2c2e34" })

            vim.lsp.buf.hover({
                border = "single",
                width = 60,
                vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#363944", bg = "#363944" }),
            })
        end
    }
}
