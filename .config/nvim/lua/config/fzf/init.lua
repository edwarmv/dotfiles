-- binary paths {{{
local __file = debug.getinfo(1, "S").source:match("@(.*)$")
assert(__file ~= nil)
local bin_dir = vim.fn.fnamemodify(__file, ":p:h:h") .. "/fzf/bin"
local bin = { preview = (bin_dir .. "/preview.sh") }
-- }}}

vim.g.fzf_lsp_pretty = true

if vim.fn.exists("$TMUX") == 1 then
  vim.g.fzf_layout = {
    tmux = "-w 100% -h 50% -y P --border=sharp --margin 0,0",
  }
else
  vim.g.fzf_layout = {
    window = {
      width = 1.0,
      height = 0.5,
      border = "sharp", -- sharp rounded
      yoffset = 1.00,
      relative = false,
    },
  }
end

-- vim.g.fzf_layout = {
--   window = {
--     width = 1.0,
--     height = 0.5,
--     border = "sharp",
--     yoffset = 1.00,
--     relative = false,
--   },
-- }

vim.g.fzf_preview_window = { "right:50%" }
vim.g.fzf_buffers_jump = 1
vim.g.fzf_action = {
  ["ctrl-t"] = "tab split",
  ["ctrl-s"] = "split",
  ["ctrl-v"] = "vsplit",
}

local function shortpath()
  local short = vim.fn.fnamemodify(vim.fn.getcwd(), ":~:.")
  if vim.fn.has("win32unix") == 0 then
    short = vim.fn.pathshorten(short)
  end
  local slash = "/"
  return vim.fn.empty(short) == 1 and "~" .. slash
    or short .. (short ~= (vim.fn.escape(slash, "\\") .. "$") and "" or slash)
end

local function get_dir()
  local dir = shortpath()
  return vim.fn.strwidth(dir) < (vim.opt.columns:get() / 2 - 20) and dir or "> "
end

-- vim.api.nvim_create_user_command("Find", function(opts)
--   vim.fn["fzf#run"](vim.fn["fzf#vim#with_preview"](vim.fn["fzf#wrap"]({
--     source = "find .",
--     dir = opts.args,
--     options = { "--prompt", get_dir(), "--multi" },
--   }, opts.bang)))
-- end, {
--   nargs = "?",
--   bang = true,
-- })

vim.api.nvim_create_user_command("FilesRelativePath", function(opts)
  vim.fn["fzf#vim#files"](vim.fn.expand("%:p:h"), vim.fn["fzf#vim#with_preview"](), opts.bang)
end, {
  bang = true,
})

vim.api.nvim_create_user_command("BuffersRelativePath", function(opts)
  vim.fn["fzf#vim#buffers"](vim.fn.expand("%:h"), vim.fn["fzf#vim#with_preview"](), opts.bang)
end, {
  bang = true,
})

local function format_name(item)
  local bufnr = item.bufnr
  local name = item.name == "" and "[No Name]" or vim.fn.fnamemodify(item.name, ":p:~:.")
  local flag = bufnr == vim.fn.bufnr("") and "%" or bufnr == vim.fn.bufnr("#") and "#" or " "
  local modified = vim.fn.getbufvar(bufnr, "&modified") == 1 and " [+]" or ""
  local readonly = vim.fn.getbufvar(bufnr, "&modifiable") == 1 and "" or " [RO]"
  local extra = modified .. readonly
  local line = vim.fn.getbufinfo(bufnr)[1]["lnum"]
  local target = name .. ":" .. line

  return string.format("%s\t%d\t[%d]\t%s\t%s\t%s", target, line, bufnr, flag, name, extra)
end

local function buf_list()
  local source = {}
  local blist = vim.fn.getbufinfo({ buflisted = 1 })
  -- local blist = vim.fn.getbufinfo({ bufloaded = 1, buflisted = 1 })

  for _, item in pairs(blist) do
    -- local name = vim.fn.fnamemodify(item.name, ":t")
    -- if name ~= "[Command Line]" then
    -- end
    table.insert(source, format_name(item))
  end

  return source
end

local function preview_cmd()
  return vim.fn["fzf#shellescape"](bin.preview) .. " {1}"
end

local function buffers_fzf(sink_fn, header, opts)
  vim.fn["fzf#run"](vim.fn["fzf#wrap"]("delete_buffer", {
    source = buf_list(),
    sink = sink_fn,
    options = {
      "--header",
      header,
      "--tiebreak=index",
      "--multi",
      "-d",
      "\t",
      "--prompt",
      "Buf> ",
      "--with-nth",
      "3..", -- %s\t%d\t[%d]\t%s\t%s\t%s
      --                ----------------
      "--nth", -- %s\t%d\t[%d]\t%s\t%s\t%s
      --          xxxxyyyy----------------
      "2,1..4",
      "--preview",
      preview_cmd(),
      "--tabstop",
      "2",
      "--preview-window",
      "+{2}-/2", -- %s\t%d\t[%d]\t%s\t%s\t%s
      --            +{2}%d-/2
    },
  }, opts.bang))
end

local function get_buffernr(lines)
  return string.sub(vim.fn.split(lines, "\t")[3], 2, -2)
end

vim.api.nvim_create_user_command("DBuffers", function(opts)
  local function sink_fn(lines)
    vim.fn.execute("bdelete " .. get_buffernr(lines))
  end

  buffers_fzf(sink_fn, "Delete Buffers", opts)
end, {
  bang = true,
})

vim.api.nvim_create_user_command("WBuffers", function(opts)
  local function sink_fn(lines)
    vim.fn.execute("bwipeout " .. get_buffernr(lines))
  end

  buffers_fzf(sink_fn, "Wipeout Buffers", opts)
end, {
  bang = true,
})

vim.keymap.set("n", "<space>ff", "<cmd>Files<CR>")
vim.keymap.set("n", "<space><space>ff", "<cmd>Find<CR>")
vim.keymap.set("n", "<space>fF", "<cmd>FilesRelativePath<CR>")
vim.keymap.set("n", "<space>fb", "<cmd>Buffers<CR>")
vim.keymap.set("n", "<space>fB", "<cmd>BuffersRelativePath<CR>")
vim.keymap.set("n", "<space>fh", "<cmd>History<CR>")
vim.keymap.set("n", "<space><space>fl", "<cmd>BLines<CR>")
vim.keymap.set("n", "<space><space>fL", "<cmd>Lines<CR>")
vim.keymap.set("n", "<space>fg", "<cmd>GFiles<CR>")
vim.keymap.set("n", "<space>fG", "<cmd>GFiles?<CR>")
vim.keymap.set("n", "<space><space>fbd", "<cmd>DBuffers<CR>")
vim.keymap.set("n", "<space><space>fbw", "<cmd>WBuffers<CR>")

vim.keymap.set("n", "<space>fld", "<cmd>Diagnostics<CR>")
vim.keymap.set("n", "<space>flD", "<cmd>DiagnosticsAll<CR>")
vim.keymap.set("n", "<space>fls", "<cmd>DocumentSymbols<CR>")

vim.keymap.set("n", "<space>fk", "<cmd>Maps<CR>")
vim.keymap.set("n", "<space>fm", "<cmd>Marks<CR>")
vim.keymap.set("n", "<space>fa", "<cmd>Ag<CR>")
vim.keymap.set("n", "<space>fr", "<cmd>Rg<CR>")
vim.keymap.set("n", "<space>fc", "<cmd>Commands<CR>")

-- vim: foldmethod=marker
