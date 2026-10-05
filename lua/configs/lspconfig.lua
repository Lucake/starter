require("nvchad.configs.lspconfig").defaults()

vim.lsp.enable({
  "html",
  "cssls",
  "lua_ls",
  "yamlls",
  "ts_ls",
  "bashls",
  "basedpyright",
  "marksman"
})
