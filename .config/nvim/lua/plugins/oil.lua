return {
    {
        "stevearc/oil.nvim",
        opts = {},
        config = function()
            require("oil").setup({
                default_file_explorer = true,
                columns = { "icon" },
                buf_options = {
                    buflisted = false,
                    bufhidden = "hide",
                },
                float = {
                    border = 'single',
                    padding = 2,
                    max_width = 0.6,
                    max_height = 0.5
                },
                confirmation = {
                    border = 'single',
                },
                win_options = {
                    wrap = false,
                    signcolumn = "no",
                    cursorcolumn = false,
                    foldcolumn = "0",
                    spell = false,
                    list = false,
                },
                view_options = {
                    show_hidden = false,
                },
                keymaps = {
                    ["l"] = { "actions.select", mode = "n" },
                    ["h"] = { "actions.parent", mode = "n" },
                    ["<C-h>"] = { "h", mode = "n" },
                    ["<C-l>"] = { "l", mode = "n" },
                    ["<C-v>"] = { "actions.select", opts = { vertical = true } },
                    ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
                    ["<C-p>"] = "actions.preview",
                    ["<leader>e"] = { "actions.close", mode = "n" },
                    ["_"] = { "actions.open_cwd", mode = "n" },
                    ["g."] = { "actions.toggle_hidden", mode = "n" },
                },
            })
        end,
    }
}
