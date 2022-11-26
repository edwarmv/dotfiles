local goto_preview = require("goto-preview")
goto_preview.setup({
  width = 120, -- Width of the floating window
  height = 15, -- Height of the floating window
  default_mappings = false, -- Bind default mappings
  -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
  -- border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
  -- border = { "", "", "", "", "", "", "", "" },
})

-- vim.api.nvim_set_keymap(
--   "n",
--   "gpd",
--   "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
--   { noremap = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "gpi",
--   "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
--   { noremap = true }
-- )
-- vim.api.nvim_set_keymap("n", "gpq", "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true })
vim.keymap.set("n", "glpd", goto_preview.goto_preview_definition, { desc = "goto preview definition" })
vim.keymap.set("n", "glpt", goto_preview.goto_preview_type_definition, { desc = "goto preview type definition" })
vim.keymap.set("n", "glpi", goto_preview.goto_preview_implementation, { desc = "goto preview implementation" })
vim.keymap.set("n", "glP", goto_preview.close_all_win, { desc = "goto preview close all win" })
-- Only set if you have telescope installed
vim.keymap.set("n", "glpr", goto_preview.goto_preview_references, { desc = "goto preview references" })
