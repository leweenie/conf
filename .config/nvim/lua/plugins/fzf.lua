return {
	{
		"ibhagwan/fzf-lua",
		enabled = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		config = function()
			require('fzf-lua').setup({
				"telescope",
				files = {
					no_ignore = true
				},
				winopts = {
					backdrop = 100,
					height   = 0.80,
					width    = 0.80,
					border   = "rounded",
					preview  = {
						hidden = true,
						border = "rounded",
						scrollbar = false,
						horizontal = "right:58%",
					},
				},
				oldfiles = { prompt = "$ " },
				live_grep = { prompt = "$ ", },
				grep = { prompt = "$ " },
				helptags = { prompt = "$ " },
				colorschemes = { prompt = "$ " },
				fzf_opts = {
					['--bind'] = 'alt-p:toggle-preview',
				},
				keymap = {
					builtin = {
						['<M-p>'] = 'toggle-preview',
					},
				}
			})
			-- $HOME
			vim.keymap.set('n', '<leader>ff', function()
				require('fzf-lua').files({
					cwd = vim.env.HOME,
					fd_opts = "--hidden --follow --exclude .git --no-ignore"
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
			-- recent files
			vim.keymap.set('n', '<leader>fr', function() require('fzf-lua').oldfiles({}) end)
			-- nvim config
			vim.keymap.set('n', '<leader>fc',
				function() require('fzf-lua').files({ cwd = '$HOME/.config/nvim' }) end)
			-- help
			vim.keymap.set('n', '<leader>fh', function() require('fzf-lua').helptags({}) end)
			-- colorscheme
			vim.keymap.set('n', '<leader>cs', function() require('fzf-lua').colorschemes({}) end)
			-- grep word under cursor
			vim.keymap.set('n', '<leader>gw', function() require('fzf-lua').grep_cword({}) end)
			-- grep current buf
			vim.keymap.set('n', '<leader>gf', function() require('fzf-lua').lgrep_curbuf({}) end)
		end
	}
}
