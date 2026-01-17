return {
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFileToggle" },
        dependencies = { "nvim-tree/nvim-web-devicons" },

        config = function()
            require('nvim-tree').setup({
                git = {
                    enable = false,
                },
                actions = { open_file = { quit_on_open = true, }, },
                filters = { dotfiles = false },
                disable_netrw = true,
                hijack_cursor = true,
                respect_buf_cwd = false,
                sync_root_with_cwd = false,
                update_focused_file = {
                    enable = true,
                    update_root = true,
                },

                view = {
                    width = 30,
                    side = "right",
                    preserve_window_proportions = true,
                },
                renderer = {
                    root_folder_label = false,
                    highlight_git = true,
                    indent_markers = { enable = true },
                    icons = {
                        glyphs = {
                            default = "󰈚",
                            folder = {
                                default = "",
                                empty = "",
                                empty_open = "",
                                open = "",
                                symlink = "",
                            },
                            git = { unmerged = "" },
                        },
                    },
                },
            })
        end,
    }
}
