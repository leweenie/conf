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
        enabled = false,
        priority = 3,
        main = "ibl",
        config = function()
            require("ibl").setup {
                indent = {
                    char = "│",
                },
                whitespace = {
                    remove_blankline_trail = true,
                },
                scope = {
                    enabled = true,
                    -- char = "│",
                    -- show_start = false,
                    -- show_end = false,
                },
            }
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        enabled = true,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    -- component_separators = { left = '', right = '' },
                    -- section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    always_show_tabline = true,
                    globalstatus = true,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                        refresh_time = 16, -- ~60fps
                        events = {
                            'WinEnter',
                            'BufEnter',
                            'BufWritePost',
                            'SessionLoadPost',
                            'FileChangedShellPost',
                            'VimResized',
                            'Filetype',
                            'CursorMoved',
                            'CursorMovedI',
                            'ModeChanged',
                        },
                    }
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end,
    },
    {
        "serhez/bento.nvim",
        enabled = true,
        opts = {},
        config = function()
            require("bento").setup({
                ordering_metric = "edit",
                ui = {
                    mode = "tabline",
                    floating = {
                        position = "middle-right",
                        border = "single"
                    },
                },
                highlights = {
                    current = "Bold",                            -- Current buffer filename (in last editor window)
                    active = "Normal",                           -- Active buffers visible in other windows
                    inactive = "Comment",                        -- Inactive/hidden buffer filenames
                    modified = "DiagnosticWarn",                 -- Modified/unsaved buffer filenames and dashes
                    inactive_dash = "Comment",                   -- Inactive buffer dashes in collapsed state
                    previous = "Search",                         -- Label for previous buffer (main_keymap label)
                    label_open = "DiagnosticVirtualTextHint",    -- Labels in open action mode
                    label_delete = "DiagnosticVirtualTextError", -- Labels in delete action mode
                    label_vsplit = "DiagnosticVirtualTextInfo",  -- Labels in vertical split mode
                    label_split = "DiagnosticVirtualTextInfo",   -- Labels in horizontal split mode
                    label_lock = "DiagnosticVirtualTextWarn",    -- Labels in lock action mode
                    label_minimal = "Visual",                    -- Labels in collapsed "full" mode
                    window_bg = "ColorColumn",                   -- Menu window background
                    page_indicator = "Comment",                  -- Pagination indicators (● ○ ○ for floating, ❮/❯ for tabline)
                    separator = "Normal",                        -- Separator between buffer components in tabline
                },
            })
        end,
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    }
}
