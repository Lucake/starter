local nvlsp = require "nvchad.configs.lspconfig"

return {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = function(fname)
    return vim.fs.root(fname, { "tsconfig.json", "package.json", ".git" })
  end,
}
