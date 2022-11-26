local M = {}

M.lsp = function(bufnr)
  local opts = {
    buffer = bufnr,
    silent = true,
  }

  -- lspsaga
  -- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
  -- vim.keymap.set("n", "gld", "<cmd>Lspsaga peek_definition<cr>", opts)
  -- vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
  -- vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
  -- vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  -- vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)

  vim.keymap.set("n", "glD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)

  vim.keymap.set("n", "gld", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)

  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)

  vim.keymap.set("n", "gli", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)

  vim.keymap.set({ "n", "i" }, "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

  vim.keymap.set("n", "glt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)

  vim.keymap.set("n", "glr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

  vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

  vim.keymap.set("n", "glR", "<cmd>lua vim.lsp.buf.references()<cr>", opts)

  vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<cr>", opts)

  -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/720#issuecomment-1133609413
  vim.keymap.set("v", "<leader>f", "<esc><cmd>lua vim.lsp.buf.range_formatting()<cr>", opts)

  vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float({ border = 'single' })<cr>", opts)

  vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)

  vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next({ float = false })<cr>", opts)

  vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ float = false })<cr>", opts)

  -- vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

  -- local wk = require("which-key")
  --
  -- wk.register({
  --   g = {
  --     D = "LSP Declaration",
  --     d = "LSP Definition",
  --     t = "LSP Type Definition",
  --     r = "LSP Rename",
  --     i = "LSP Implementation",
  --     R = "LSP References",
  --   },
  --   ["<leader>"] = {
  --     f = "LSP Format",
  --     d = "Diagnostic Open",
  --   },
  --   ["]"] = {
  --     d = "Diagnostic Next",
  --   },
  --   ["["] = {
  --     d = "Diagnostic Prev",
  --   },
  -- })
end
-- 
-- 
return M
