return {
    { "tpope/vim-surround",    enabled = true, config = function() end, },
    { 'mbbill/undotree',       enabled = true },
    { "windwp/nvim-autopairs", enabled = true, dependencies = {},       event = "InsertEnter", config = true, },
    {
        "j-hui/fidget.nvim",
        enabled = true,
        config = function()
            require("fidget").setup({ notification = { window = { winblend = 0, normal_hl = "Normal", zindex = 1, }, }, })
            vim.api.nvim_set_hl(0, "FidgetTask", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "FidgetTitle", { bg = "NONE" })
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = true,
        priority = 3,
        main = "ibl",
        config = function()
            require("ibl").setup {
                indent = {
                    char = "▏",
                },
                whitespace = {
                    remove_blankline_trail = true,
                },
                scope = {
                    enabled = true,
                },
            }
        end,
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        enabled = true,
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
}
