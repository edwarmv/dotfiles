require("indent_blankline").setup({
  char = "▏",
  -- context_char = "▎",
  -- char = "│",
  -- space_char_blankline = " ",
  filetype_exclude = {
    "help",
    "sagahover",
    "floaterm",
    "toggleterm",
    "plaintext",
    "packer",
    "dbout",
    "NvimTree",
    "TelescopePrompt",
    "TelescopeResults",
    "",
    "neo-tree",
    "neo-tree-popup",
    "aerial",
  },
  buftype_exclude = { "terminal", "floaterm", "help", "quickfix" }, -- "nofile"
  show_current_context = false,
  use_treesitter = false,
  show_trailing_blankline_indent = false,
  show_end_of_line = false,
  show_foldtext = false,
  --  char_highlight_list = {
  --     "IndentBlanklineIndent1",
  --     "IndentBlanklineIndent2",
  --     "IndentBlanklineIndent3",
  --     "IndentBlanklineIndent4",
  --     "IndentBlanklineIndent5",
  --     "IndentBlanklineIndent6",
  -- },
})

vim.api.nvim_set_keymap("n", "<leader>ir", "<cmd>IndentBlanklineRefresh<cr>", { silent = false })

vim.api.nvim_set_keymap("n", "zo", "zo:IndentBlanklineRefresh<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "zO", "zO:IndentBlanklineRefresh<cr>", { silent = true, noremap = true })

vim.api.nvim_set_keymap("n", "zc", "zc:IndentBlanklineRefresh<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "zC", "zC:IndentBlanklineRefresh<cr>", { silent = true, noremap = true })

vim.api.nvim_set_keymap("n", "za", "za:IndentBlanklineRefresh<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "zA", "zA:IndentBlanklineRefresh<cr>", { silent = true, noremap = true })

vim.api.nvim_set_keymap("n", "zd", "zd:IndentBlanklineRefresh<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "zD", "zD:IndentBlanklineRefresh<cr>", { silent = true, noremap = true })

vim.api.nvim_set_keymap("n", "zr", "zr:IndentBlanklineRefresh<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "zR", "zR:IndentBlanklineRefresh<cr>", { silent = true, noremap = true })

vim.api.nvim_set_keymap("n", "zf", "zf:IndentBlanklineRefresh<cr>", { silent = true, noremap = true })

vim.api.nvim_set_keymap("n", "zm", "zm:IndentBlanklineRefresh<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "zM", "zM:IndentBlanklineRefresh<cr>", { silent = true, noremap = true })

-- vim.cmd([[autocmd OptionSet signcolumn IndentBlanklineRefresh]])
-- vim.api.nvim_set_keymap("n", "]w", "<cmd>NextTrailingWhitespace<cr>", { silent = true, noremap = true })
-- vim.api.nvim_set_keymap("n", "[w", "<cmd>PrevTrailingWhitespace<cr>", { silent = true, noremap = true })
