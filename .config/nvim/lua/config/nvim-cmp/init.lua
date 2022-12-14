require("config.nvim-cmp.custom")
local utils = require("config.nvim-cmp.utils")
local luasnip = require("luasnip")
local types = require("cmp.types")
local cmp = require("cmp")
local debounce = require("config.nvim-cmp.debounce")

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  preselect = types.cmp.PreselectMode.None,
  completion = {
    autocomplete = false,
    -- keyword_length = 4,
  },
  window = { --{{{
    completion = {
      -- border = { '', '', '', '', '', '', '', '' },
      border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
      -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,Search:None",
    },
    documentation = {
      max_width = math.floor(vim.opt.columns:get() / 3),
      max_height = math.floor(vim.opt.lines:get() / 3),
      -- border = { '', '', '', '', '', '', '', '' },
      border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
      -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,Search:None",
    },
  }, --}}}
  mapping = { --{{{
    ["<up>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          cmp.close()
          fallback()
        else
          fallback()
        end
      end,
    }),
    ["<down>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          cmp.close()
          fallback()
        else
          fallback()
        end
      end,
    }),
    ["<c-n>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end,
      c = function(fallback)
        fallback()
      end,
    }),
    ["<c-p>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end,
      c = function(fallback)
        fallback()
      end,
    }),
    ["<m-f>"] = cmp.mapping.scroll_docs(1),
    ["<m-b>"] = cmp.mapping.scroll_docs(-1),
    ["<c-e>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          cmp.close()
          -- feedkey("<c-g>u", "i")
        else
          fallback()
        end
      end,
      c = function(fallback)
        if cmp.visible() then
          cmp.close()
        else
          fallback()
        end
      end,
    }),
    ["<c-y>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          cmp.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          })
        else
          fallback()
          -- feedkey("<c-g>u", "i")
        end
      end,
      c = function(fallback)
        if cmp.visible() then
          cmp.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          })
        else
          fallback()
        end
      end,
    }),
    ["<CR>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          cmp.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          })
        else
          fallback()
          -- feedkey("<c-g>u", "i")
        end
      end,
      c = function(fallback)
        if cmp.visible() then
          cmp.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          })
        else
          fallback()
        end
      end,
    }),
    ["<tab>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          debounce.cancel_autocomplete = true
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        elseif luasnip.locally_jumpable(1) then
          luasnip.jump(1)
        elseif utils.has_words_before() then
          debounce.cancel_autocomplete = true
          cmp.complete()
        else
          fallback()
        end
      end,
      s = function(fallback)
        if luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end,
      c = function(fallback)
        if cmp.visible() then
          debounce.cancel_autocomplete = true
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        else
          -- fallback()
          cmp.complete()
        end
      end,
    }),
    ["<s-tab>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          debounce.cancel_autocomplete = true
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        elseif luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
      s = function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
      c = function(fallback)
        if cmp.visible() then
          debounce.cancel_autocomplete = true
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
        else
          fallback()
        end
      end,
    }),
    ["<c-space>"] = cmp.mapping({
      i = function()
        cmp.complete()
      end,
      c = function()
        cmp.complete()
      end,
    }),
    ["<c-x><c-s>"] = cmp.mapping({
      i = function()
        cmp.complete({
          config = {
            sources = {
              { name = "luasnip" },
            },
          },
        })
      end,
    }),
    ["<c-x><c-p>"] = cmp.mapping({
      i = function()
        cmp.complete({
          config = {
            sources = {
              { name = "path" },
            },
          },
        })
      end,
    }),
  }, --}}}
  sources = cmp.config.sources({ --{{{
    { name = "nvim_lsp" },
    -- { name = "luasnip" },
    -- { name = "path" },
    -- { name = "calc" },
    -- { name = "treesitter" },
  }, {
    { name = "buffer" },
  }), --}}}
  formatting = { --{{{
    fields = {
      cmp.ItemField.Kind,
      cmp.ItemField.Abbr,
      cmp.ItemField.Menu,
    },
    format = require("lspkind").cmp_format({
      -- with_text = false,
      mode = "symbol",
      before = function(_, vim_item)
        local width = math.floor(vim.opt.columns:get() / 4)
        if #vim_item.abbr > width then
          vim_item.abbr = string.sub(vim_item.abbr, 1, width - 1) .. "…"
        end
        return vim_item
      end,
    }),
  }, --}}}
  -- performance = {
  --   debounce = 30, -- 60
  --   throttle = 15, -- 30
  --   fetching_timeout = 200, -- 200
  -- },
})

cmp.setup.cmdline(":", {
  completion = {
    autocomplete = false,
  },
  sources = cmp.config.sources({
    { name = "cmdline" },
  }, {
    { name = "path" },
  }),
  formatting = {
    fields = {
      cmp.ItemField.Abbr,
    },
  },
})

require("cmp").setup.cmdline("/", {
  completion = {
    autocomplete = false,
  },
  sources = cmp.config.sources({
    -- { name = "nvim_lsp_document_symbol" },
    { name = "buffer" },
  }),
  -- formatting = {
  --   fields = {
  --     cmp.ItemField.Abbr,
  --   },
  -- },
})

-- cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
--   sources = cmp.config.sources({
--     { name = "vim-dadbod-completion" },
--     { name = "buffer" },
--   }),
-- })

-- https://github.com/hrsh7th/nvim-cmp/issues/598#issuecomment-984930668
-- vim.cmd([[
--   augroup CmpDebounceAuGroup
--     au!
--     au TextChangedI * lua require("config.nvim-cmp").debounce()
--   augroup end
-- ]])
-- vim.api.nvim_create_autocmd({ "TextChangedI" }, {
--   group = vim.api.nvim_create_augroup("CmpDebounceAuGroup", {}),
--   callback = function()
--     debounce.debounce()
--     debounce.cancel_autocomplete = false
--   end,
-- })

-- vim.cmd([[
--   augroup CmpCmdlineDebounceAuGroup
--     au!
--     au CmdlineChanged * lua require("config.nvim-cmp").debounce()
--   augroup end
-- ]])
-- vim.api.nvim_create_autocmd({ "CmdlineChanged" }, {
--   group = vim.api.nvim_create_augroup("CmpDebounceAuGroup", {}),
--   callback = function()
--     debounce.debounce()
--   end,
-- })

-- cmp.setup.filetype({ "norg" }, {
--   sources = {
--     { name = "neorg" },
--     { name = "buffer" },
--   },
-- })

-- cmp.event:on("confirm_done", function()
--   print('confirm_done')
--   debounce.cancel_autocomplete = true
-- end)

-- cmp.event:on("complete_done", function()
--   print('confirm_done')
--   debounce.cancel_autocomplete = true
-- end)

-- cmp.event:on("menu_closed", function()
--   debounce.cancel_autocomplete = true
-- end)

-- cmp.event:on("menu_opened", function()
--   debounce.cancel_autocomplete = false
-- end)
-- vim: foldmethod=marker
