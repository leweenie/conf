return {
    { "tpope/vim-surround",    enabled = true, config = function() end, },
    { 'mbbill/undotree',       enabled = true },
    { "windwp/nvim-autopairs", enabled = true, dependencies = { { "echasnovski/mini.icons", opts = {} } }, event = "InsertEnter", config = true, },
    {
        "j-hui/fidget.nvim",
        enabled = true,
        config = function()
            require("fidget").setup({ notification = { window = { winblend = 0, normal_hl = "Normal", zindex = 1, }, }, })
            vim.api.nvim_set_hl(0, "FidgetTask", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "FidgetTitle", { bg = "NONE" })
        end,
    },
}
