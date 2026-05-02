return {
    {
        'nvim-mini/mini.nvim',
        enabled = true,
        version = false,
        config = function()
            local statusline = require 'mini.statusline'
            statusline.setup {
                use_icons = false
            }
            statusline.section_location = function()
                return '%2l:%-2v'
            end

            local tabline = require 'mini.tabline'
            tabline.setup {
                format = function(buf_id, label)
                    local suffix = vim.bo[buf_id].modified and '+ ' or ''
                    return tabline.default_format(buf_id, label) .. suffix
                end
            }
        end,
    },
}
