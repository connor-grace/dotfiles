return {
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'mason-org/mason.nvim', opts = {} },
            'mason-org/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            { 'j-hui/fidget.nvim', opts = {} },
            'saghen/blink.cmp',
        },
        config = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup(
                    'kickstart-lsp-attach',
                    { clear = true }
                ),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or 'n'
                        vim.keymap.set(
                            mode,
                            keys,
                            func,
                            { buffer = event.buf, desc = 'LSP: ' .. desc }
                        )
                    end

                    map(
                        'gd',
                        require('telescope.builtin').lsp_definitions,
                        '[G]oto [D]efinition'
                    )
                    map(
                        'gr',
                        require('telescope.builtin').lsp_references,
                        '[G]oto [R]eferences'
                    )
                    map(
                        'gI',
                        require('telescope.builtin').lsp_implementations,
                        '[G]oto [I]mplementation'
                    )
                    map(
                        '<leader>D',
                        require('telescope.builtin').lsp_type_definitions,
                        'Type [D]efinition'
                    )
                    map(
                        '<leader>ds',
                        require('telescope.builtin').lsp_document_symbols,
                        '[D]ocument [S]ymbols'
                    )
                    map(
                        '<leader>ws',
                        require('telescope.builtin').lsp_dynamic_workspace_symbols,
                        '[W]orkspace [S]ymbols'
                    )
                    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                    map(
                        '<leader>ca',
                        vim.lsp.buf.code_action,
                        '[C]ode [A]ction',
                        { 'n', 'x' }
                    )
                    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                    map(
                        'gh',
                        '<cmd>ClangdSwitchSourceHeader<cr>',
                        '[G]oto [H]eader/Source (C/C++)'
                    )

                    ---@param client vim.lsp.Client
                    ---@param method vim.lsp.protocol.Method
                    ---@param bufnr? integer
                    local function client_supports_method(client, method, bufnr)
                        return client:supports_method(method, bufnr)
                    end

                    local client =
                        vim.lsp.get_client_by_id(event.data.client_id)
                    if
                        client
                        and client_supports_method(
                            client,
                            vim.lsp.protocol.Methods.textDocument_documentHighlight,
                            event.buf
                        )
                    then
                        local highlight_augroup = vim.api.nvim_create_augroup(
                            'kickstart-lsp-highlight',
                            { clear = false }
                        )
                        vim.api.nvim_create_autocmd(
                            { 'CursorHold', 'CursorHoldI' },
                            {
                                buffer = event.buf,
                                group = highlight_augroup,
                                callback = vim.lsp.buf.document_highlight,
                            }
                        )
                        vim.api.nvim_create_autocmd(
                            { 'CursorMoved', 'CursorMovedI' },
                            {
                                buffer = event.buf,
                                group = highlight_augroup,
                                callback = vim.lsp.buf.clear_references,
                            }
                        )
                        vim.api.nvim_create_autocmd('LspDetach', {
                            group = vim.api.nvim_create_augroup(
                                'kickstart-lsp-detach',
                                { clear = true }
                            ),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds {
                                    group = 'kickstart-lsp-highlight',
                                    buffer = event2.buf,
                                }
                            end,
                        })
                    end

                    if
                        client
                        and client_supports_method(
                            client,
                            vim.lsp.protocol.Methods.textDocument_inlayHint,
                            event.buf
                        )
                    then
                        map('<leader>th', function()
                            vim.lsp.inlay_hint.enable(
                                not vim.lsp.inlay_hint.is_enabled {
                                    bufnr = event.buf,
                                }
                            )
                        end, '[T]oggle Inlay [H]ints')
                    end
                end,
            })

            vim.diagnostic.config {
                severity_sort = true,
                float = { border = 'rounded', source = 'if_many' },
                signs = vim.g.have_nerd_font
                        and {
                            text = {
                                [vim.diagnostic.severity.ERROR] = '󰅚 ',
                                [vim.diagnostic.severity.WARN] = '󰀪 ',
                                [vim.diagnostic.severity.INFO] = '󰋽 ',
                                [vim.diagnostic.severity.HINT] = '󰌶 ',
                            },
                        }
                    or {},
                underline = { severity = vim.diagnostic.severity.ERROR },
                virtual_text = {
                    source = 'if_many',
                    spacing = 2,
                    format = function(d)
                        return d.message
                    end,
                },
            }

            local capabilities = require('blink.cmp').get_lsp_capabilities()

            local servers = {
                clangd = {},
                pyright = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = { callSnippet = 'Replace' },
                            -- diagnostics = { disable = { 'missing-fields' } },
                        },
                    },
                },
            }

            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, { 'stylua' })

            require('mason-tool-installer').setup {
                ensure_installed = ensure_installed,
            }

            require('mason-lspconfig').setup {
                ensure_installed = {},
                automatic_installation = false,
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend(
                            'force',
                            {},
                            capabilities,
                            server.capabilities or {}
                        )
                        require('lspconfig')[server_name].setup(server)
                    end,
                },
            }
        end,
    },
}
