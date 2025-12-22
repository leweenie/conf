return {
    {
        'akinsho/bufferline.nvim',
        enabled = false,
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup({
                options = {
                    indicator = {
                        icon = ' ',
                    },
                    themeable = true,
                    diagnostics = "nvim_lsp",
                    tab_size = 20,
                    max_name_length = 20,
                    color_icons = false,
                    separator_style = "slant",
                    always_show_bufferline = true,
                    auto_toggle_bufferline = true,
                    show_buffer_icons = true,
                    show_buffer_close_icons = false,
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = { 'close' }
                    },
                    modified_icon = '[+]',
                },
                highlights = {
                    background = {
                        fg = '#666666',
                        bg = 'none',
                    },
                    buffer_visible = {
                        fg = '#888888',
                        bg = 'none',
                    },
                },
            })
        end,
    }
}
