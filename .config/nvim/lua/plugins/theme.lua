return {
    {
        "folke/tokyonight.nvim",
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            require('tokyonight').setup({
                transparent = false
            })
            vim.cmd.colorscheme('tokyonight-night')
            vim.api.nvim_set_hl(0, "FzfLuaBorder", { fg = "#16161E", bg = "#16161E" })
            vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#16161E", bg = "#16161E" })
            vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#16161E", bg = "#16161E" })

            vim.lsp.buf.hover({
                border = "single",
                width = 60,
                vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#16161E", bg = "#16161E" }),
            })
        end
    },
    {
        "vague-theme/vague.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("vague").setup({
                italic = false,
            })
            vim.cmd("colorscheme vague")
            local hl = vim.api.nvim_set_hl
            hl(0, "WinSeparator", { fg = "#303030", bg = "NONE" })
            hl(0, "StatusLine", { bg = "NONE" })
            hl(0, "MiniTablineCurrent", { bg = "#1c1c24", bold = true })
            hl(0, "MiniTablineModifiedCurrent", { bg = "#1c1c24", fg = "#e8b589", bold = true })
            hl(0, "MiniTablineHidden", { bg = "#141415", fg = "#505050" })
            hl(0, "MiniTablineVisible", { bg = "#141415", fg = "#505050" })
            hl(0, "MiniTablineModifiedVisible", { bg = "#141415", fg = "#966841" })
            hl(0, "MiniTablineModifiedHidden", { bg = "#141415", fg = "#966841" })
            hl(0, "FzfLuaBorder", { fg = "#282833" })
            hl(0, "BlinkCmpDocBorder", { fg = "#282833" })
            hl(0, "FloatBorder", { fg = "#282833" })
        end
    },
}
