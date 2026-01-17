return {
    {
        "ibhagwan/fzf-lua",
        enabled = true,
        dependencies = { "nvim-mini/mini.icons" },
        opts = {},
        config = function()
            require('fzf-lua').setup({
                'fzf-vim',
                winopts = {
                    backdrop = 80,
                    -- width = 80,
                    border = 'single',
                    preview = {
                        hidden = false,
                        border = 'single',
                        scrollbar = false,
                        horizontal = "right:50%"
                    }
                },
                keymap = {
                    builtin = {
                        ["<C-S-j>"] = "preview-down",
                        ["<C-S-k>"] = "preview-up",
                    },
                },
                oldfiles = { prompt = "" },
                live_grep = { prompt = "" },
                helptags = { prompt = "" },
                colorschemes = { prompt = "" },
                files = { prompt = "" },
            })
            local opts = { noremap = true, silent = true }
            local fzf = require('fzf-lua')
            vim.keymap.set('n', '<leader>ff', function() fzf.files({ cwd = vim.fn.expand('$HOME') }) end, opts)
            vim.keymap.set('n', '<leader>fr', function() require('fzf-lua').oldfiles({}) end, opts)
            vim.keymap.set('n', '<leader>fg', function() require('fzf-lua').live_grep({}) end, opts)
            vim.keymap.set('n', '<leader>fh', function() require('fzf-lua').helptags({}) end, opts)
            vim.keymap.set('n', '<leader>cs', function() require('fzf-lua').colorschemes({}) end, opts)
            vim.keymap.set('n', '<leader>fc', function() require('fzf-lua').files({ cwd = '$HOME/.config/nvim' }) end,
                opts)
            vim.keymap.set('n', '<leader>f.', function() require('fzf-lua').files({}) end, opts)
            vim.keymap.set('n', '<leader>fb', function() require('fzf-lua').buffers({}) end, opts)
            vim.keymap.set('n', '<leader>g.',
                function() require('fzf-lua').grep_project({ search = vim.fn.expand("<cword>") }) end, opts)
        end
    }
}
