return {
	{
		'nvim-telescope/telescope.nvim',
		enabled = true,
		version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()
			require('telescope').setup {
				defaults = {
					border = true,
					borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
					-- Default configuration for telescope goes here:
					-- config_key = value,
					mappings = {
						i = {
							-- map actions.which_key to <C-h> (default: <C-/>)
							-- actions.which_key shows the mappings for your picker,
							-- e.g. git_{create, delete, ...}_branch for the git_branches picker
							["<C-h>"] = "which_key"
						}
					}
				},
				pickers = {
					lsp_references = {
						theme = "dropdown",
						layout_config = {
							width = 0.9,
						},
					},
					-- Default configuration for builtin pickers goes here:
					-- picker_name = {
					--   picker_config_key = value,
					--   ...
					-- }
					-- Now the picker_config_key will be applied every time you call this
					-- builtin picker
				},
				extensions = {
					-- Your extension configuration goes here:
					-- extension_name = {
					--   extension_config_key = value,
					-- }
					-- please take a look at the readme of the extension you want to configure
				}
			}
			local builtin = require('telescope.builtin')

			-- files
			vim.keymap.set('n', '<leader>f.', function()
				builtin.find_files({
					hidden = true,
				})
			end)
			vim.keymap.set('n', '<leader>ff', function()
				builtin.find_files({
					cwd = vim.fn.expand("~"),
					hidden = true
				})
			end)
			vim.keymap.set('n', '<leader>fc', function()
				builtin.find_files({ cwd = vim.fn.expand("~/.config/nvim") })
			end)

			-- grep
			vim.keymap.set('n', '<leader>g.', builtin.live_grep)
			vim.keymap.set('n', '<leader>fg', function()
				builtin.live_grep({ cwd = vim.fn.expand("~") })
			end)
			vim.keymap.set('n', '<leader>fr', builtin.oldfiles)

			vim.keymap.set('n', '<leader><leader>', function()
				builtin.buffers(require('telescope.themes').get_dropdown {
					previewer = false,
				})
			end)
			vim.keymap.set('n', '<leader>fh', builtin.help_tags)
			vim.keymap.set('n', '<leader>cs', function()
				builtin.colorscheme(require('telescope.themes').get_dropdown {})
			end)
			vim.keymap.set('n', '<leader>gw', function()
				builtin.lsp_references(
					vim.tbl_extend(
						"force",
						require('telescope.themes').get_dropdown({
							previewer = false,
							layout_config = {
								width = 0.75,
							},
						}),
						{
							include_declaration = true,
						}
					)
				)
			end)
			vim.keymap.set('n', '<leader>gb', function()
				builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					previewer = false,
					layout_config = {
						width = 0.75,
					},
				})
			end)
		end
	}
}
