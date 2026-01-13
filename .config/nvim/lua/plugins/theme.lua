return {
    {
        "tiagovla/tokyodark.nvim",
        enabled = false,
        priority = 4,
        opts = {
            transparent_background = true,
            styles = {
                -- comments = { italic = true },
                -- keywords = { italic = true },
                -- identifiers = { italic = true },
                -- functions = {},
                -- variables = { italic = true },
                comments = {},
                keywords = {},
                identifiers = {},
                functions = {},
                variables = {},
            },
        },
        config = function(_, opts)
            require("tokyodark").setup(opts)
            vim.cmd.colorscheme("tokyodark")
            local hl = vim.api.nvim_set_hl
            hl(0, "IblIndent", { fg = "#222333" })
            hl(0, "IblScope", { fg = "#36384d" })
            hl(0, "CursorLine", { bg = "NONE" })
            hl(0, "BlinkCmpMenuSelection", { bg = "#212234" })
        end,
    },
    {
        "sainnhe/gruvbox-material",
        enabled = true,
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
                    -- hl(0, "CursorLine", { bg = "NONE" })
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
    {
        "loctvl842/monokai-pro.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("monokai-pro").setup({
                transparent_background = false,
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
                        context_start_underline = true,
                    },
                },
            })
            -- vim.cmd.colorscheme('monokai-pro-classic')
            -- vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
        end
    },
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
            -- vim.cmd.colorscheme('tokyonight-night')
            -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
        end
    },
    {
        "vague-theme/vague.nvim",
        enabled = false,
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other plugins
        config = function()
            -- NOTE: you do not need to call setup if you don't want to.
            require("vague").setup({
                transparent = true, -- don't set background
            })
            vim.cmd("colorscheme vague")
            vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1c1c24" })
            vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1c1c24" })
        end
    },
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        -- config = function()
        --     require('nordic').load()
        -- end
    }
}
