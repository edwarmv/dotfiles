local maps = require("maps")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").bashls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    maps.lsp(bufnr)
  end,
})
