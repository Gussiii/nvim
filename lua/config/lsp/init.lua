local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end
--require'nvim_lsp'.julials.setup{}
require("config.lsp.lsp-installer")
require("config.lsp.handlers").setup()
lspconfig.julials.setup{}

