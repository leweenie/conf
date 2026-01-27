return {
    {
        "serhez/bento.nvim",
        enabled = true,
        opts = {},
        config = function()
            require("bento").setup({
                ordering_metric = "access",
                ui = {
                    mode = "tabline",
                    floating = {
                        position = "middle-right",
                        border = "single"
                    },
                },
                highlights = {
                    current = "Bold",                            -- Current buffer filename (in last editor window)
                    active = "Normal",                           -- Active buffers visible in other windows
                    inactive = "Comment",                        -- Inactive/hidden buffer filenames
                    modified = "DiagnosticWarn",                 -- Modified/unsaved buffer filenames and dashes
                    inactive_dash = "Comment",                   -- Inactive buffer dashes in collapsed state
                    previous = "Search",                         -- Label for previous buffer (main_keymap label)
                    label_open = "DiagnosticVirtualTextHint",    -- Labels in open action mode
                    label_delete = "DiagnosticVirtualTextError", -- Labels in delete action mode
                    label_vsplit = "DiagnosticVirtualTextInfo",  -- Labels in vertical split mode
                    label_split = "DiagnosticVirtualTextInfo",   -- Labels in horizontal split mode
                    label_lock = "DiagnosticVirtualTextWarn",    -- Labels in lock action mode
                    label_minimal = "Visual",                    -- Labels in collapsed "full" mode
                    window_bg = "ColorColumn",                   -- Menu window background
                    page_indicator = "Comment",                  -- Pagination indicators (● ○ ○ for floating, ❮/❯ for tabline)
                    separator = "Normal",                        -- Separator between buffer components in tabline
                },
            })
        end,
    },
}
