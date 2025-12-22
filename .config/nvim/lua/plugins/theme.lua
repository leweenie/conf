return {
    {
        "loctvl842/monokai-pro.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("monokai-pro").setup({
                transparent_background = true,
                terminal_colors = true,
                devicons = true,
                styles = {
                    comment = { italic = true },
                    keyword = { italic = true },
                    type = { italic = true },
                    storageclass = { italic = true },
                    structure = { italic = true },
                    parameter = { italic = true },
                    annotation = { italic = true },
                    tag_attribute = { italic = true },
                },
                filter = "pro",
                day_night = {
                    enable = false,
                    day_filter = "pro",
                    night_filter = "spectrum",
                },
                inc_search = "background",
                background_clear = {
                    "float_win",
                    "toggleterm",
                    "telescope",
                    "renamer",
                    "oil",
                    "notify",
                    "bufferline",
                },
                plugins = {
                    bufferline = {
                        underline_selected = false,
                        underline_visible = false,
                    },
                    indent_blankline = {
                        context_highlight = "default",
                        context_start_underline = false,
                    },
                },
            })
            vim.cmd.colorscheme "monokai-pro-classic"
            vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
        end
    },
}
