local terminal_state = {
    buf = nil,
    win = nil,
    is_open = false,
    job_id = nil
}

local function close_terminal()
    if terminal_state.is_open and terminal_state.win and vim.api.nvim_win_is_valid(terminal_state.win) then
        vim.api.nvim_win_close(terminal_state.win, false)
        terminal_state.is_open = false
    end
end

local function open_terminal()
    local current_file = vim.api.nvim_buf_get_name(0)
    local file_dir = vim.fn.fnamemodify(current_file, ':p:h')

    terminal_state.buf = vim.api.nvim_create_buf(false, true)
    vim.bo[terminal_state.buf].bufhidden = 'hide'

    vim.cmd('botright split')
    terminal_state.win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(terminal_state.win, terminal_state.buf)
    vim.api.nvim_win_set_height(terminal_state.win, math.floor(vim.o.lines * 0.3))

    terminal_state.job_id = vim.fn.termopen(os.getenv("SHELL"), { cwd = file_dir })
    terminal_state.is_open = true
    vim.cmd("startinsert")

    vim.api.nvim_create_autocmd("BufLeave", {
        buffer = terminal_state.buf,
        callback = close_terminal,
        once = true
    })
end

vim.keymap.set("n", "<A-\\>", function()
    if terminal_state.is_open then
        close_terminal()
        return
    end

    vim.cmd('write')
    open_terminal()
end, {})

vim.keymap.set("t", "<A-\\>", close_terminal, { desc = "Close terminal" })
