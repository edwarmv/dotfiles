require("notify").setup({
  -- Animation style (see below for details)
  stages = "fade_in_slide_out", -- fade_in_slide_out, fade, slide, static

  -- Function called when a new window is opened, use for changing win settings/config
  on_open = function(win)
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_set_config(win, { border = "single" })
      -- vim.api.nvim_win_set_option(win, "winhl", "Normal:NormalFloat,NormalFloat:NormalFloat,FloatBorder:FloatBorder")
    end
  end,

  -- Function called when a window is closed
  -- on_close = nil,

  -- Render function for notifications. See notify-render()
  render = "default", -- default minimal

  -- Default timeout for notifications
  timeout = 3000,

  -- Max number of columns for messages
  max_width = math.floor(vim.opt.columns:get() * 0.4),
  -- Max number of lines for a message
  -- max_height = nil,

  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
  background_colour = "#32302f",

  -- Minimum width for notification windows
  minimum_width = 50,

  -- Icons for the different levels
  icons = {
    ERROR = " ",
    WARN = " ",
    INFO = " ",
    DEBUG = " ",
    TRACE = "✎ ",
  },
})

-- vim.cmd([[hi link NotifyERRORBody NormalFloat]])
-- vim.cmd([[hi link NotifyWARNBody NormalFloat]])
-- vim.cmd([[hi link NotifyINFOBody NormalFloat]])
-- vim.cmd([[hi link NotifyDEBUGBody NormalFloat]])

vim.notify = require("notify")
