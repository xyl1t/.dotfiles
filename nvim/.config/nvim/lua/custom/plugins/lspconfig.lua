local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
    "pylsp",
    "lua_ls",
    "html",
    "cssls",
    "emmet_ls",
    "clangd",
    "jsonls",
    "tsserver",
    "tailwindcss"
    -- "sourcekit",
}

for _, lsp in ipairs(servers) do
    if lsp == "lua_ls" then
        lspconfig[lsp].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the lsp to recognize the `vim` global
                        globals = {'vim'}
                    }
                }
            }
        })
    elseif lsp == "tsserver" then
        lspconfig[lsp].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            init_options = {
                preferences = {
                    disableSuggestions = true,
                },
            },
        })
    else
        lspconfig[lsp].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end
end

local opts = {
    tools = {
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
            auto = true,
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            },
        },
        on_attach = on_attach,
        capabilities = capabilities
    },
}

require('rust-tools').setup(opts)

