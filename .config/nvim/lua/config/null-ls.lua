local null_ls = require("null-ls")
local maps = require("maps")

null_ls.setup({
  sources = {
    -- null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.code_actions.eslint,
    null_ls.builtins.formatting.sql_formatter,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.stylua,
  },
  on_attach = function(client, bufnr)
    local opts = {
      buffer = bufnr,
    }
    vim.keymap.set("n", "<leader>nf", "<cmd>lua vim.lsp.buf.format()<cr>", opts)

    -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/720#issuecomment-1133609413
    vim.keymap.set("v", "<leader>nf", "<esc><cmd>lua vim.lsp.buf.range_formatting()<cr>", opts)
  end,
})
