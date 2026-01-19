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
                -- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ebdbb2" })
                vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#16161E", bg = "#16161E" })
            })
        end
    },
    {
        "sainnhe/gruvbox-material",
        enabled = false,
        lazy = false,
        priority = 1000,
        init = function()
            local g = vim.g
            g.gruvbox_material_enable_italic = true
            g.gruvbox_material_enable_bold = true
            g.gruvbox_material_background = "hard"
            g.gruvbox_material_foreground = "original"
            g.gruvbox_material_transparent_background = 2
            g.gruvbox_material_float_style = 'blend'
        end,
        config = function()
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "gruvbox-material",
                callback = function()
                    local hl = vim.api.nvim_set_hl
                    hl(0, "IblIndent", { fg = "#202020" })
                    hl(0, "IblScope", { fg = "#303030" })
                    hl(0, "CursorLine", { bg = "NONE" })
                    hl(0, "BlinkCmpMenuBorder", { bg = "NONE" })
                    vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
                end,
            })
            vim.cmd.colorscheme("gruvbox-material")
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "NONE" })
                    vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "NONE" })
                    vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#282828" })
                    vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "NONE" })
                    vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = "NONE" })
                    -- vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
                    vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { bg = "NONE" })
                end,
            })
        end,
    },
}
