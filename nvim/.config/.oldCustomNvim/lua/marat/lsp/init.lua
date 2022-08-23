local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("marat.lsp.lsp-installer")
require("marat.lsp.handlers").setup()
require("marat.lsp.lsp-signature")

