return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp" },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            vim.lsp.config("lua_ls", { capabilities = capabilities })
            vim.lsp.config("jdtls", { capabilities = capabilities })
            vim.lsp.config("gopls", { capabilities = capabilities })
            vim.lsp.config("clangd", { capabilities = capabilities })
            vim.lsp.config("basedpyright", { capabilities = capabilities })
            vim.lsp.config("tinymist", { capabilities = capabilities })

            vim.lsp.enable({
                "lua_ls",
                "jdtls",
                "gopls",
                "jsonld-lsp",
                "clangd",
                "ts_ls",
                "rust_analyzer",
                "basedpyright",
                "tinymist",
            })

            vim.diagnostic.config({
                virtual_text = true,
                signs = false,
                underline = false,
                update_in_insert = false,
                float = {
                    border = "single",
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then
                        return
                    end
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                            end,
                        })
                    end
                end,
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
            keymap = { preset = "super-tab" },
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
                menu = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                    border = 'none',
                    winblend = 15,
                    scrollbar = false,
                },
                list = {
                    max_items = nil,
                }
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
    }
}
