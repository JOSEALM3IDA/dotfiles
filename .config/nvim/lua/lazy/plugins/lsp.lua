return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "jdtls",
                "lua_ls",
                "bashls",
                "rust_analyzer",
                "pyright"
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["jdtls"] = function()
                    local java_cmd = os.getenv("JAVA_HOME") .. "/bin/java"
                    local jdtls_path = require('mason-registry').get_package("jdtls"):get_install_path()

                    local share_dir = os.getenv("HOME") .. "/.local/share"
                    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
                    local workspace_dir = share_dir .. "/eclipse/" .. project_name

                    local cmd = {
                        java_cmd,
                        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                        "-Dosgi.bundles.defaultStartLevel=4",
                        "-Declipse.product=org.eclipse.jdt.ls.core.product",
                        "-Dlog.protocol=true",
                        "-Dlog.level=ALL",
                        "-Xms512m",
                        "-Xmx2048m",
                        "--add-modules=ALL-SYSTEM",
                        "--add-opens",
                        "java.base/java.util=ALL-UNNAMED",
                        "--add-opens",
                        "java.base/java.lang=ALL-UNNAMED",
                        "-jar",
                        vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
                        "-configuration",
                        jdtls_path .. "/config_linux",
                        "-data",
                        workspace_dir,
                    }

                    require('lspconfig').jdtls.setup({
                        cmd = cmd,
                        capabilities = capabilities,
                    })
                end,

            }
        })

        vim.lsp.config.lua_ls = {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim", "it", "describe", "before_each", "after_each" },
                    }
                }
            }
        }


        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-j>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-k>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
