-- local colors = require("tokyonight.colors").setup({ colors = { terminal_black = "#565f89" } })
local utils = require("tokyonight.util")

-- vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_sidebars = {}
-- -- vim.g.tokyonight_transparent_sidebar = true
-- vim.g.tokyonight_dark_float = false
-- vim.g.tokyonight_lualine_bold = true
-- vim.g.tokyonight_dark_sidebar = false
-- vim.g.tokyonight_colors = { terminal_black = "#565f89" }
require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "normal", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param hl Highlights
  ---@param c ColorScheme
  on_highlights = function(hl, c)
    hl.NormalFloat = {
      fg = c.fg,
      bg = c.bg,
    }
    hl.WhichKeyFloat = {
      fg = c.fg,
      bg = c.bg,
    }
    hl.ExtraWhitespace = {
      fg = c.red,
      bg = utils.blend(c.red, c.bg, 0.15),
    }
    hl.CmpBorder = {
      fg = c.fg,
      bg = c.bg_float,
    }
    hl.CmpFloat = {
      fg = c.fg,
      bg = c.bg_float,
    }
    hl.CmpItemAbbr = {
      fg = c.comment,
      bg = c.none,
    }
    hl.TelescopeNormal = { fg = c.comment, bg = c.bg_float }
    hl.TelescopeSelection = { link = "CursorLine" }
  end,
})

vim.cmd([[colorscheme tokyonight]])

-- vim.highlight.create("illuminatedWord", { guifg = "none", guibg = "none", gui = "underline", guisp = "reverse" }, false)
-- vim.highlight.create("illuminatedCurWord", { guifg = "none", guibg = "none", gui = "underline", guisp = "reverse" }, false)

-- vim.highlight.create("InfoFloat", { guifg = colors.blue2 }, false)
-- vim.highlight.create("WarningFloat", { guifg = colors.yellow }, false)
-- vim.highlight.create("ErrorFloat", { guifg = colors.red1 }, false)
-- vim.highlight.create("HintFloat", { guifg = colors.teal }, false)

-- vim.highlight.create("Green", { guifg = colors.green }, false)
-- vim.highlight.create("CmpItemAbbr", { guifg = colors.comment }, false)
-- vim.api.nvim_command("hi link LightBulbVirtualText DiagnosticHint")

--  vim.g.VM_Mono_hl   = 'Cursor'
--  vim.g.VM_Extend_hl = 'Visual'
--  vim.g.VM_Cursor_hl = 'Cursor'
--  vim.g.VM_Insert_hl = 'Cursor'

-- vim.g.choosewin_color_other = {
--   gui = { "#1f2335" },
-- }
-- vim.g.choosewin_color_label_current = {
--   gui = { "#73daca", "#1d202f", "bold" },
-- }
-- vim.g.choosewin_color_label = {
--   gui = { "#3b4261", "#7aa2f7", "bold" },
-- }
