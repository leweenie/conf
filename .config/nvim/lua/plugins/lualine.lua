return {
    { -- Collection of various small independent plugins/modules
        'nvim-mini/mini.nvim',
        version = false,
        config = function()
            local statusline = require 'mini.statusline'
            statusline.setup { use_icons = false }
            statusline.section_location = function() return '%2l:%-2v' end
            local tabline = require 'mini.tabline'
            tabline.setup()
        end,
    },
}
