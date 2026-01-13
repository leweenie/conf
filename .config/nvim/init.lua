require("custom.terminal")
require("config.options")
require("config.keymaps")
require("config.lazy")
require("bento").setup({
    ui = {
        mode = "floating",
        floating = {
            border = "single", -- or "single", "rounded", "none", etc.
        }
    }
})
require("config.autocmds")
