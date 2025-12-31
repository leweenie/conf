return {
    {
        'akinsho/bufferline.nvim',
        enabled = false,
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup({
                options = {
                    show_tab_indicators = false,
                    show_duplicate_prefix = false,
                    duplicates_across_groups = false,
                    persist_buffer_sort = true,
                    move_wraps_at_ends = false,
                    themeable = true,
                    diagnostics = false,
                    tab_size = 25,
                    max_name_length = 40,
                    color_icons = true,
                    indicator = {
                        icon = ''
                    },
                    separator_style = "none",
                    enforce_regular_tabs = true,
                    always_show_bufferline = true,
                    auto_toggle_bufferline = true,
                    show_buffer_icons = true,
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = { 'close' }
                    },
                    -- modified_icon = '[+]',
                    buffer_close_icon = '󰅖',
                    modified_icon = '●',
                    close_icon = '󰅖',

                    offsets = {
                        {
                            filetype = "NvimTree",
                            separator = true,
                            highlight = "NvimTreeNormal",
                        }
                    }
                },
                highlights = {
                    fill = {
                        bg = "#151515"
                    },

                    background = {
                        bg = "#282828",
                        italic = false,
                    },

                    buffer_visible = {
                        bg = "#232323",
                        bold = true,
                        italic = false,
                    },

                    buffer_selected = {
                        bg = "#151515",
                        bold = true,
                        italic = false,
                    },

                    close_button_selected = {
                        bg = '#151515',
                    },

                    modified_selected = {
                        bg = "#151515",
                    },
                }
            })
        end,
    }
}
