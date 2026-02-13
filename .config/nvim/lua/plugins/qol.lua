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
    {
        "ARM9/arm-syntax-vim",
        enabled = false,
    },
    {
        'lewis6991/gitsigns.nvim',
        enabled = true,
        opts = {
        },
        config = function()
            local gitsigns = require 'gitsigns'
            gitsigns.setup({
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
            })
            vim.g.mapleader = " "
            vim.g.maplocalleader = " "
            local map = vim.keymap.set
            map('v', '<leader>ss', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end) -- stage selection
            map('v', '<leader>su', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end) -- reset selection
            map('v', '<leader>rs', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end)

            map('n', '<leader>ss', gitsigns.stage_hunk) -- stage hunk
            map('n', '<leader>su', gitsigns.stage_hunk) -- reset hunk
            map('n', '<leader>rs', gitsigns.reset_hunk)

            map('n', '<leader>sb', gitsigns.stage_buffer)
            map('n', '<leader>rb', gitsigns.reset_buffer_index)

            map('n', '<leader>hn', function()
                gitsigns.next_hunk()
                gitsigns.preview_hunk_inline()
            end)

            map('n', '<leader>hp', function()
                gitsigns.prev_hunk()
                gitsigns.preview_hunk_inline()
            end)

            map('n', '<leader>hd', gitsigns.diffthis)
        end
    },
    {
        'goolord/alpha-nvim',
        enabled = true,
        dependencies = {
            'nvim-mini/mini.icons',
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.theta'.config)
        end
    },
}
