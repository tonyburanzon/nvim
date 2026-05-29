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
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        -- vim.api.nvim_create_autocmd('FileType', {
        --     pattern = 'kotlin',
        --     callback = function(args)
        --         local root_dir = vim.fs.root(args.buf, {
        --             'settings.gradle.kts', 'settings.gradle', 'build.gradle.kts', 'build.gradle', 'pom.xml',
        --         })
        --         if not root_dir then return end
        --         local hash = vim.fn.sha256(root_dir):sub(1, 12)
        --         local base = vim.fn.expand('~/.local/share/kotlin-lsp/projects/') .. hash
        --         vim.lsp.start({
        --             name = 'kotlin_lsp',
        --             cmd = {
        --                 'sh', '-c',
        --                 'IJ_JAVA_OPTIONS="-Didea.config.path=' .. base .. '/config'
        --                     .. ' -Didea.system.path=' .. base .. '/system" exec kotlin-lsp --stdio',
        --             },
        --             root_dir = root_dir,
        --             capabilities = capabilities,
        --         })
        --     end,
        -- })

        -- vim.api.nvim_create_user_command('KotlinLspClearIndex', function()
        --     local client = vim.lsp.get_clients({ name = 'kotlin_lsp' })[1]
        --     if not client then
        --         vim.notify('kotlin_lsp not running', vim.log.levels.WARN)
        --         return
        --     end
        --     local hash = vim.fn.sha256(client.root_dir):sub(1, 12)
        --     local path = vim.fn.expand('~/.local/share/kotlin-lsp/projects/') .. hash
        --     vim.fn.system('rm -rf ' .. vim.fn.shellescape(path))
        --     vim.notify('Cleared kotlin-lsp index for ' .. client.root_dir .. '. Restart Neovim to reindex.')
        -- end, {})

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
            },
            handlers = {
                function(server_name) -- default handler (optional)

                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                -- ["kotlin_lsp"] = function() end, -- managed by FileType autocmd above
                ["lua_ls"] = function()
                  local lspconfig = require("lspconfig")
                  lspconfig.lua_ls.setup {
                    capabilities = capabilities,
                    settings = {
                      Lua = {
                        workspace = {
                          checkThirdParty = false,
                        },
                        diagnostics = {
                          globals = { "vim", "it", "describe", "before_each", "after_each" },
                        }
                      }
                    }
                }
                end,
                ["vtsls"] = function()
                  require("lspconfig").vtsls.setup {
                    capabilities = capabilities,
                    settings = {
                      typescript = {
                        preferences = {
                          importModuleSpecifier = 'non-relative',
                        },
                      },
                      javascript = {
                        preferences = {
                          importModuleSpecifier = 'non-relative',
                        },
                      },
                    },
                  }
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            preselect = 'item',
            completion = {
                autocomplete = false,
                completeopt = 'menu,menuone,noinsert'
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping({
                  c = function()
                    if cmp.visible() then
                      cmp.select_next_item(cmp_select)
                    else
                      cmp.complete()
                    end
                  end
                }),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
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
