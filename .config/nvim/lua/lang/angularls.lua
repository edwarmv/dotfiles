local maps = require("maps")
local util = require("lspconfig.util")
local project_library_path = "/Users/edwarmv/.asdf/installs/nodejs/lts/lib/node_modules"

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  project_library_path,
  "--ngProbeLocations",
  project_library_path,
}

require("lspconfig").angularls.setup({
  cmd = cmd,
  on_new_config = function(new_config, _)
    new_config.cmd = cmd
  end,
  root_dir = util.root_pattern("angular.json"),
  filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "svg" },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    maps.lsp(bufnr)
  end,
})
