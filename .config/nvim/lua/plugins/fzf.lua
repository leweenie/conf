return {
    {
        "ibhagwan/fzf-lua",
        enabled = true,
        opts = {},
        config = function()
            local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = "FzfLuaNormal" })
            hl = ok and hl or {}

            local bg = hl.bg or vim.api.nvim_get_hl(0, { name = "Normal" }).bg or 0x1e1e1e
            local fg = hl.fg or vim.api.nvim_get_hl(0, { name = "Normal" }).fg or 0xffffff
            require('fzf-lua').setup({
                fzf_colors = {
                    ["gutter"] = string.format("#%06x", bg),
                    ["pointer"] = string.format("#%06x", fg),
                    ["bg+"] = "-1",
                },
                winopts = {
                    height  = 0.90,
                    width   = 0.90,
                    border  = "single",
                    preview = {
                        hidden = false,
                        border = "single",
                        scrollbar = false,
                        horizontal = "right:58%",
                    },
                },
                oldfiles = { prompt = "$ " },
                live_grep = { prompt = "$ ", },
                grep = { prompt = "$ " },
                helptags = { prompt = "$ " },
                colorschemes = { prompt = "$ " },
            })
            -- $HOME
            vim.keymap.set('n', '<leader>ff', function()
                require('fzf-lua').files({
                    cwd = vim.env.HOME,
                    fd_opts = "--hidden --follow --exclude .git"
                })
            end)
            vim.keymap.set('n', '<leader>fg', function()
                require('fzf-lua').live_grep({
                    cwd = vim.env.HOME,
                    rg_opts =
                    "--hidden --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e"
                })
            end)
            -- cwd
            vim.keymap.set('n', '<leader>f.', function() require('fzf-lua').files({}) end)
            vim.keymap.set('n', '<leader>g.', function()
                require('fzf-lua').live_grep({
                    cwd = vim.uv.cwd(),
                    rg_opts =
                    "--hidden --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e"
                })
            end)
            -- etc.
            vim.keymap.set('n', '<leader>fr', function() require('fzf-lua').oldfiles({}) end)
            vim.keymap.set('n', '<leader>fc', function() require('fzf-lua').files({ cwd = '$HOME/.config/nvim' }) end)
            vim.keymap.set('n', '<leader>fh', function() require('fzf-lua').helptags({}) end)
            vim.keymap.set('n', '<leader>cs', function() require('fzf-lua').colorschemes({}) end)
            vim.keymap.set('n', '<leader>gw', function() require('fzf-lua').grep_cword({}) end)
        end
    }
}
