local util = require("vim.lsp.util")
local vfn = vim.fn

vim.lsp.buf.hover = function()
  local params = util.make_position_params()
  vim.lsp.buf_request_all(0, "textDocument/hover", params, function(results)
    local config = { border = "single" }
    config.focus_id = "textDocument/hover"
    local contents = {}
    for _, result in pairs(results) do
      if result and result.result and result.result.contents then
        table.insert(contents, result.result.contents)
      end
    end
    if vim.tbl_isempty(contents) then
      vim.notify("No information available")
      return
    end
    local markdown_lines = util.convert_input_to_markdown_lines(contents)
    if vim.tbl_isempty(markdown_lines) then
      vim.notify("No information available")
      return
    end
    return util.open_floating_preview(markdown_lines, "markdown", config)
  end)
end

vim.lsp.buf.rename = function(new_name, options)
  options = options or {}
  local bufnr = options.bufnr or vim.api.nvim_get_current_buf()
  local clients = vim.lsp.buf_get_clients(bufnr)

  if options.filter then
    clients = options.filter(clients)
  elseif options.name then
    clients = vim.tbl_filter(function(client)
      return client.name == options.name
    end, clients)
  end

  -- Clients must at least support rename, prepareRename is optional
  clients = vim.tbl_filter(function(client)
    return client.supports_method("textDocument/rename")
  end, clients)

  if #clients == 0 then
    vim.notify("[LSP] Rename, no matching language servers with rename capability.")
  end

  local win = vim.api.nvim_get_current_win()

  -- Compute early to account for cursor movements after going async
  local cword = vfn.expand("<cword>")

  ---@private
  local function get_text_at_range(range)
    return vim.api.nvim_buf_get_text(
      bufnr,
      range.start.line,
      range.start.character,
      range["end"].line,
      range["end"].character,
      {}
    )[1]
  end

  local try_use_client
  try_use_client = function(client)
    if not client then
      return
    end

    ---@private
    local function rename(name)
      local params = util.make_position_params(win, client.offset_encoding)
      params.newName = name
      local handler = client.handlers["textDocument/rename"] or vim.lsp.handlers["textDocument/rename"]
      client.request("textDocument/rename", params, function(...)
        handler(...)
      end, bufnr)
    end

    if client.supports_method("textDocument/prepareRename") then
      local params = util.make_position_params(win, client.offset_encoding)
      client.request("textDocument/prepareRename", params, function(err, result)
        if err or result == nil then
          local msg = err and ("Error on prepareRename: " .. (err.message or "")) or "Nothing to rename"
          vim.notify(msg, vim.log.levels.INFO)
          return
        end

        if new_name then
          rename(new_name)
          return
        end

        local prompt_opts = {
          prompt = "New Name: ",
        }
        -- result: Range | { range: Range, placeholder: string }
        if result.placeholder then
          prompt_opts.default = result.placeholder
        elseif result.start then
          prompt_opts.default = get_text_at_range(result)
        elseif result.range then
          prompt_opts.default = get_text_at_range(result.range)
        else
          prompt_opts.default = cword
        end
        vim.ui.input(prompt_opts, function(input)
          if not input or #input == 0 then
            return
          end
          rename(input)
        end)
      end, bufnr)
    else
      assert(client.supports_method("textDocument/rename"), "Client must support textDocument/rename")
      if new_name then
        rename(new_name)
        return
      end

      local prompt_opts = {
        prompt = "New Name: ",
        default = cword,
      }
      vim.ui.input(prompt_opts, function(input)
        if not input or #input == 0 then
          return
        end
        rename(input)
      end)
    end
  end

  if #clients == 1 then
    try_use_client(clients[1])
  end

  if #clients > 1 then
    vim.ui.select(clients, {
      prompt = "Select a language server:",
      format_item = function(item)
        return item.name
      end,
    }, try_use_client)
  end
end

vim.lsp.buf.format = function(options)
  options = options or {}
  local bufnr = options.bufnr or vim.api.nvim_get_current_buf()
  local clients = vim.lsp.buf_get_clients(bufnr)

  if options.filter then
    clients = options.filter(clients)
  elseif options.id then
    clients = vim.tbl_filter(function(client)
      return client.id == options.id
    end, clients)
  elseif options.name then
    clients = vim.tbl_filter(function(client)
      return client.name == options.name
    end, clients)
  end

  clients = vim.tbl_filter(function(client)
    return client.supports_method("textDocument/formatting")
  end, clients)

  if #clients == 0 then
    vim.notify("[LSP] Format request failed, no matching language servers.")
  end

  if options.async then
    local do_format
    do_format = function(idx, client)
      if not client then
        return
      end
      local params = util.make_formatting_params(options.formatting_options)
      client.request("textDocument/formatting", params, function(...)
        local handler = client.handlers["textDocument/formatting"] or vim.lsp.handlers["textDocument/formatting"]
        handler(...)
        do_format(next(clients, idx))
      end, bufnr)
    end
    if #clients > 0 then
      vim.ui.select(clients, {
        prompt = "Select a language server:",
        format_item = function(item)
          return item.name
        end,
      }, do_format)
    end
  else
    local timeout_ms = options.timeout_ms or 1000
    if #clients > 0 then
      vim.ui.select(clients, {
        prompt = "Select a language server:",
        format_item = function(item)
          return item.name
        end,
      }, function(client)
        if not client then
          return
        end
        local params = util.make_formatting_params(options.formatting_options)
        local result, err = client.request_sync("textDocument/formatting", params, timeout_ms, bufnr)
        if result and result.result then
          util.apply_text_edits(result.result, bufnr, client.offset_encoding)
        elseif err then
          vim.notify(string.format("[LSP][%s] %s", client.name, err), vim.log.levels.WARN)
        end
      end)
    end
  end
end

vim.lsp.handlers.hover = function(_, result, ctx, config)
  config = config or {}
  config.focus_id = ctx.method
  if not (result and result.contents) then
    return
  end
  local markdown_lines = util.convert_input_to_markdown_lines(result.contents)
  markdown_lines = util.trim_empty_lines(markdown_lines)
  if vim.tbl_isempty(markdown_lines) then
    return
  end
  return util.open_floating_preview(markdown_lines, "markdown", config)
end
