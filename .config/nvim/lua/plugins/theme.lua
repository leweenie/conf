return {
    {
        "tiagovla/tokyodark.nvim",
        priority = 4,
        opts = {
            transparent_background = true,
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
        "lukas-reineke/indent-blankline.nvim",
        priority = 3,
        main = "ibl",
        config = function()
            require("ibl").setup({
                indent = { char = "│" },
                scope = { enabled = true },
            })
        end,
    },
}
