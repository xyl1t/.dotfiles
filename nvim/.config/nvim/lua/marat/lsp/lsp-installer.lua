local lsp_installer = require("nvim-lsp-installer")
lsp_installer.setup {}

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end


local servers = { 'sumneko_lua', 'tsserver', 'clangd', 'jdtls', 'cmake', 'cmake', 'jsonls', 'rust_analyzer' }
for _, lsp in pairs(servers) do
	if lsp == 'sumneko_lua' then
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
	else
		require('lspconfig')[lsp].setup {
			on_attach = require("marat.lsp.handlers").on_attach,
		}
	end
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- lsp_installer.on_server_ready(function(server)
-- 	local opts = {
-- 		on_attach = require("marat.lsp.handlers").on_attach,
-- 		capabilities = require("marat.lsp.handlers").capabilities,
-- 	}
--
-- 	 if server.name == "jsonls" then
-- 	 	local jsonls_opts = require("marat.lsp.settings.jsonls")
-- 	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
-- 	 end
--
-- 	 if server.name == "sumneko_lua" then
-- 	 	local sumneko_opts = require("marat.lsp.settings.sumneko_lua")
-- 	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
-- 	 end
--
-- 	 if server.name == "pyright" then
-- 	 	local pyright_opts = require("marat.lsp.settings.pyright")
-- 	 	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
-- 	 end
--
-- 	-- This setup() function is exactly the same as lspconfig's setup function.
-- 	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 	server:setup(opts)
-- end)
--
