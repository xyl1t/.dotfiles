local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { --[[ "clangd", ]] "sourcekit", "sumneko_lua", "html", "cssls", "emmet_ls", "clangd", "jsonls", "tsserver" }

for _, lsp in ipairs(servers) do
    if lsp == "sumneko_lua" then
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

--[[
require('lspconfig')[lsp].setup {
    on_attach = require("marat.lsp.handlers").on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
        },
    }
}
]]

