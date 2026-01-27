return {
    "sphamba/smear-cursor.nvim",
    enabled = true,
    config = function()
        require('smear_cursor').setup({
            smear_between_buffers = true,
            smear_between_neighbor_lines = true,
            scroll_buffer_space = true,
            legacy_computing_symbols_support = false,
            vertical_bar_cursor_insert_mode = true,
        })
    end
}
