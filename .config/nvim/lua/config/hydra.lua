local Hydra = require("hydra")

Hydra({
  config = {
    hint = {
      type = "statusline",
    },
    -- on_enter = function()
    --   vim.api.nvim_command("IndentBlanklineDisable")
    -- end,
    -- on_exit = function()
    --   vim.api.nvim_command("IndentBlanklineEnable")
    -- end,
    timeout = true,
  },
  name = "Side scroll",
  mode = "n",
  body = "z",
  heads = {
    { "h", "zh" },
    { "l", "zl", { desc = "←/→" } },
    { "H", "zH" },
    { "L", "zL", { desc = "half screen ←/→" } },
  },
})

Hydra({
  config = {
    hint = {
      type = "statusline",
    },
    timeout = true,
  },
  name = "Move cursor by display lines",
  mode = "n",
  body = "g",
  heads = {
    { "j", "gj" },
    { "k", "gk", { desc = "↓/↑" } },
  },
})

-- Hydra({
--   config = {
--     hint = {
--       type = "statusline",
--     },
--   },
--   mode = "n",
--   body = "]",
--   heads = {
--     { "d", "]d", { desc = "Next diagnostic" } },
--     -- { "c", "]c", { desc = "Next hunk" } },
--     { "w", "]w", { desc = "Next trailing whitespace" } },
--     { "t", "<cmd>tabnext<cr>", { desc = "Next tab" } },
--   },
-- })

-- Hydra({
--   config = {
--     hint = {
--       type = "statusline",
--     },
--   },
--   mode = "n",
--   body = "[",
--   heads = {
--     { "d", "[d", { desc = "Prev diagnostic" } },
--     -- { "c", "[c", { desc = "Prev hunk" } },
--     { "w", "[w", { desc = "Prev trailing whitespace" } },
--     { "t", "<cmd>tabprevious<cr>", { desc = "Prev tab" } },
--   },
-- })

Hydra({
  config = {
    hint = {
      type = "statusline",
    },
    timeout = true,
  },
  mode = "n",
  body = "<c-w>",
  heads = {
    { ">", "<c-w>>" },
    { "<", "<c-w><" },
    { "+", "<c-w>+" },
    { "-", "<c-w>-" },
    -- { "h", "<c-w>h" },
    -- { "j", "<c-w>j" },
    -- { "k", "<c-w>k" },
    -- { "l", "<c-w>l" },
  },
})
