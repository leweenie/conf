return {
    {
        "nvim-java/nvim-java",
        enabled = false,
    },
    {
        "neovim/nvim-lspconfig",
        priority = 1,
        dependencies = { "saghen/blink.cmp" },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            vim.lsp.config("lua_ls", { capabilities = capabilities })
            vim.lsp.config("jdtls", { capabilities = capabilities })
            vim.lsp.config("gopls", { capabilities = capabilities })
            vim.lsp.config("clangd", { capabilities = capabilities })
            vim.lsp.config("basedpyright", { capabilities = capabilities })
            vim.lsp.config("asm_lsp", {
                capabilities = capabilities,
                filetypes = { "asm", "s", "arm" },
            })
            vim.lsp.config("tinymist", { capabilities = capabilities })

            vim.lsp.enable({
                "cssls",
                "superhtml",
                "bashls",
                "asm_lsp",
                "lua_ls",
                "jdtls",
                "gopls",
                "jsonld_lsp",
                "clangd",
                "ts_ls",
                "rust_analyzer",
                "basedpyright",
                "tinymist",
            })

            vim.diagnostic.config({
                virtual_text = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '▎',
                        [vim.diagnostic.severity.WARN] = '▎',
                        [vim.diagnostic.severity.HINT] = '▎',
                        [vim.diagnostic.severity.INFO] = '▎',
                    },
                }
                ,
                underline = true,
                update_in_insert = false,
                float = {
                    border = "single",
                },
            })
        end,
    },
    {
        "saghen/blink.cmp",
        enabled = true,
        dependencies = "rafamadriz/friendly-snippets",
        version = "*",
        lazy = false,
        priority = 1000,
        opts = {
            keymap = {
                preset = 'default',
                ['<Tab>'] = { 'accept', 'fallback' },
                -- ['<Tab>'] = { 'select_next', 'fallback' },
                -- ['<S-Tab>'] = { 'select_prev', 'fallback' },
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
                ghost_text = {
                    enabled = false,
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                    window = {
                        min_width = 10,
                        max_width = 80,
                        max_height = 15,
                        border = 'single',
                        winblend = 0,
                        scrollbar = true,
                    },
                },
                menu = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                    border = 'single',
                    draw = {
                        columns = {
                            { "label" },
                            { "kind" },
                        },
                    },
                    winhighlight =
                    'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
                    winblend = 0,
                    scrollbar = false,
                },
                list = {
                    max_items = 100,
                    selection = {
                        preselect = true,
                    }
                }
            },
            snippets = {
                preset = 'luasnip',
            },
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
                    package_uninstalled = "✗"
                }
            }
        }
    },
    {
        "L3MON4D3/LuaSnip",
        enabled = true,
        version = "v2.*",
        build = "make install_jsregexp",
        config = function()
            -- Load VSCode-style snippets
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    }
}
