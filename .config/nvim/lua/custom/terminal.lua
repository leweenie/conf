local valid_types = {
    cpp = true,
    rust = true,
    python = true,
    java = true,
    javascript = true,
    c = true,
    terminal = true,
}

local terminal_state = {
    winid = nil,
    bufnr = nil,
}

vim.api.nvim_create_autocmd("WinClosed", {
    callback = function(args)
        if tonumber(args.match) == terminal_state.winid then
            terminal_state.winid = nil
        end
    end,
})

local function toggle_terminal()
    if terminal_state.winid
        and vim.api.nvim_win_is_valid(terminal_state.winid)
    then
        vim.api.nvim_win_close(terminal_state.winid, true)
        terminal_state.winid = nil
        return
    end

    local height = vim.api.nvim_win_get_height(0)
    vim.cmd("split")
    vim.cmd("resize " .. math.floor(height / 3))

    terminal_state.winid = vim.api.nvim_get_current_win()

    if terminal_state.bufnr
        and vim.api.nvim_buf_is_valid(terminal_state.bufnr)
    then
        vim.api.nvim_win_set_buf(0, terminal_state.bufnr)
    else
        vim.cmd("terminal")
        terminal_state.bufnr = vim.api.nvim_get_current_buf()
    end

    vim.cmd("startinsert")
end

local modes = { "n", "i", "t" }

vim.keymap.set(modes, "<A-\\>", function()
    local mode  = vim.api.nvim_get_mode().mode
    local ftype = vim.bo.filetype
    local btype = vim.bo.buftype

    if not (valid_types[ftype] or valid_types[btype]) then
        print("invalid type: cannot open terminal")
        return
    end

    if mode ~= "n" then
        vim.cmd("stopinsert")
    end

    toggle_terminal()
end, { silent = true })
