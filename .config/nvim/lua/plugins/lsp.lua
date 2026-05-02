return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        build = "make install_jsregexp",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip").filetype_extend("typescriptreact", { "html" })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        priority = 1,
        dependencies = { "saghen/blink.cmp" },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            vim.lsp.config('*', { capabilities = capabilities })

            -- servers needing extra config
            vim.lsp.config("asm_lsp", {
                filetypes = { "asm", "s", "arm" },
            })

            vim.lsp.enable({
                "cssls", "superhtml", "bashls", "asm_lsp", "tailwindcss",
                "lua_ls", "jdtls", "gopls", "jsonld_lsp",
                "clangd", "ts_ls", "rust_analyzer",
                "basedpyright", "tinymist",
            })

            vim.diagnostic.config({
                virtual_text = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '▎',
                        [vim.diagnostic.severity.WARN]  = '▎',
                        [vim.diagnostic.severity.HINT]  = '▎',
                        [vim.diagnostic.severity.INFO]  = '▎',
                    },
                },
                underline = true,
                update_in_insert = false,
                float = { border = "none" },
            })
        end,
    },
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "L3MON4D3/LuaSnip",
        },
        version = "*",
        lazy = false,
        priority = 1000,
        opts = {
            keymap = {
                preset = 'default',
                ['<Tab>'] = { 'accept', 'fallback' },
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },
            completion = {
                trigger = {
                    show_on_keyword = true,
                    show_on_trigger_character = true,
                    show_on_insert_on_trigger_character = true,
                    show_on_blocked_trigger_characters = {},
                    show_on_x_blocked_trigger_characters = {},
                },
                ghost_text = { enabled = false },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                    window = {
                        min_width = 10,
                        max_width = 80,
                        max_height = 15,
                        border = 'none',
                        scrollbar = true,
                    },
                },
                menu = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                    border = 'none',
                    draw = {
                        columns = {
                            { "label" },
                            { "kind" },
                        },
                    },
                    winhighlight =
                    'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
                    scrollbar = false,
                },
                list = {
                    max_items = 100,
                    selection = { preselect = true },
                },
            },
            snippets = { preset = 'luasnip' },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                min_keyword_length = 0,
            },
        },
        opts_extend = { "sources.default" },
    },
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
}
