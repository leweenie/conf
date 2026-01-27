return {
    {
        "ibhagwan/fzf-lua",
        enabled = true,
        opts = {},
        config = function()
            require('fzf-lua').setup({
                'fzf-vim',
                winopts = {
                    backdrop = 80,
                    border = 'single',
                    preview = {
                        hidden = false,
                        border = 'single',
                        scrollbar = false,
                        horizontal = "right:50%"
                    }
                },
                oldfiles = { prompt = "" },
                live_grep = { prompt = "" },
                helptags = { prompt = "" },
                colorschemes = { prompt = "" },
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
        end
    }
}
