-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/edwarmv/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/edwarmv/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/edwarmv/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/edwarmv/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/edwarmv/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { 'require("config.comment")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    config = { 'require("config.LuaSnip")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["SchemaStore.nvim"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/SchemaStore.nvim",
    url = "https://github.com/b0o/SchemaStore.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["color-picker.nvim"] = {
    config = { 'require("config.color-picker")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/color-picker.nvim",
    url = "https://github.com/ziontee113/color-picker.nvim"
  },
  ["context_filetype.vim"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/context_filetype.vim",
    url = "https://github.com/Shougo/context_filetype.vim"
  },
  ["csv.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/opt/csv.vim",
    url = "https://github.com/chrisbra/csv.vim"
  },
  ["cutlass.nvim"] = {
    config = { 'require("config.cutlass")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/cutlass.nvim",
    url = "https://github.com/gbprod/cutlass.nvim"
  },
  ["diffview.nvim"] = {
    config = { 'require("config.diffview")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["dirbuf.nvim"] = {
    config = { 'require("config.dirbuf")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/dirbuf.nvim",
    url = "https://github.com/elihunter173/dirbuf.nvim"
  },
  ["dressing.nvim"] = {
    config = { 'require("config.dressing")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["fidget.nvim"] = {
    config = { 'require("config.fidget")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["flit.nvim"] = {
    config = { 'require("config.flit")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/flit.nvim",
    url = "https://github.com/ggandor/flit.nvim"
  },
  ["fm-nvim"] = {
    config = { 'require("config.fm-nvim")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/fm-nvim",
    url = "https://github.com/is0n/fm-nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/fzf",
    url = "/usr/local/opt/fzf"
  },
  ["fzf-lsp.nvim"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/fzf-lsp.nvim",
    url = "https://github.com/gfanto/fzf-lsp.nvim"
  },
  ["fzf.vim"] = {
    config = { 'require("config.fzf")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["git-conflict.nvim"] = {
    config = { 'require("config.git-conflict")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { 'require("config.gitsigns")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["hop.nvim"] = {
    config = { 'require("config.hop")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["hydra.nvim"] = {
    config = { 'require("config.hydra")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/hydra.nvim",
    url = "https://github.com/anuvyklack/hydra.nvim"
  },
  ["inc-rename.nvim"] = {
    config = { 'require("config.inc-rename")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/inc-rename.nvim",
    url = "https://github.com/smjonas/inc-rename.nvim"
  },
  ["incline.nvim"] = {
    config = { 'require("config.incline")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/incline.nvim",
    url = "https://github.com/b0o/incline.nvim"
  },
  ["leap.nvim"] = {
    config = { 'require("config.leap")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { 'require("config.lsp_signature")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { 'require("config.lspkind-nvim")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require("config.lualine")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-tool-installer.nvim"] = {
    config = { 'require("config.mason-tool-installer")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/mason-tool-installer.nvim",
    url = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"
  },
  ["mason-update-all"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/mason-update-all",
    url = "https://github.com/RubixDev/mason-update-all"
  },
  ["mason.nvim"] = {
    config = { 'require("config.mason")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["noice.nvim"] = {
    config = { 'require("config.noice")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { 'require("config.null-ls")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require("config.nvim-autopairs")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    config = { 'require("config.nvim-bqf")' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { 'require("config.nvim-cmp")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-hlslens"] = {
    config = { 'require("config.nvim-hlslens")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("config.nvim-lspconfig")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { 'require("config.nvim-notify")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { 'require("config.nvim-surround")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { 'require("config.nvim-tree")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'require("config.treesitter")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    config = { 'require("config.nvim-web-devicons")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["nvim-window.git"] = {
    config = { 'require("config.nvim-window")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/nvim-window.git",
    url = "https://gitlab.com/yorickpeterse/nvim-window"
  },
  ["open-browser.vim"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/open-browser.vim",
    url = "https://github.com/tyru/open-browser.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plantuml-previewer.vim"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/plantuml-previewer.vim",
    url = "https://github.com/weirongxu/plantuml-previewer.vim"
  },
  playground = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rest.nvim"] = {
    config = { 'require("config.rest")' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/opt/rest.nvim",
    url = "https://github.com/NTBBloodbath/rest.nvim"
  },
  ["substitute.nvim"] = {
    config = { 'require("config.substitute")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/substitute.nvim",
    url = "https://github.com/gbprod/substitute.nvim"
  },
  tabular = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    config = { 'require("config.telescope")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { 'require("config.todo-comments")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { 'require("config.toggleterm")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["typescript.nvim"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vim-better-whitespace"] = {
    config = { 'require("config.vim-better-whitespace")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-eunuch"] = {
    config = { 'require("config.vim-eunuch")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-hexokinase",
    url = "https://github.com/RRethy/vim-hexokinase"
  },
  ["vim-illuminate"] = {
    config = { 'require("config.vim-illuminate")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-kitty"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-kitty",
    url = "https://github.com/fladson/vim-kitty"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-lastplace",
    url = "https://github.com/farmergreg/vim-lastplace"
  },
  ["vim-markdown"] = {
    config = { 'require("config.vim-markdown")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-matchup"] = {
    after_files = { "/Users/edwarmv/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-move"] = {
    config = { 'require("config.vim-move")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-move",
    url = "https://github.com/matze/vim-move"
  },
  ["vim-obsession"] = {
    config = { 'require("config.vim-obsession")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-scriptease"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-scriptease",
    url = "https://github.com/tpope/vim-scriptease"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["vim-windowswap"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-windowswap",
    url = "https://github.com/wesQ3/vim-windowswap"
  },
  ["vim-zoom"] = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/vim-zoom",
    url = "https://github.com/dhruvasagar/vim-zoom"
  },
  ["which-key.nvim"] = {
    config = { 'require("config.which-key")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  winresizer = {
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/winresizer",
    url = "https://github.com/simeji/winresizer"
  },
  ["workspaces.nvim"] = {
    config = { 'require("config.workspaces")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/workspaces.nvim",
    url = "https://github.com/natecraddock/workspaces.nvim"
  },
  ["yanky.nvim"] = {
    config = { 'require("config.yanky")' },
    loaded = true,
    path = "/Users/edwarmv/.local/share/nvim/site/pack/packer/start/yanky.nvim",
    url = "https://github.com/gbprod/yanky.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
require("config.hop")
time([[Config for hop.nvim]], false)
-- Config for: fm-nvim
time([[Config for fm-nvim]], true)
require("config.fm-nvim")
time([[Config for fm-nvim]], false)
-- Config for: substitute.nvim
time([[Config for substitute.nvim]], true)
require("config.substitute")
time([[Config for substitute.nvim]], false)
-- Config for: inc-rename.nvim
time([[Config for inc-rename.nvim]], true)
require("config.inc-rename")
time([[Config for inc-rename.nvim]], false)
-- Config for: incline.nvim
time([[Config for incline.nvim]], true)
require("config.incline")
time([[Config for incline.nvim]], false)
-- Config for: workspaces.nvim
time([[Config for workspaces.nvim]], true)
require("config.workspaces")
time([[Config for workspaces.nvim]], false)
-- Config for: fzf.vim
time([[Config for fzf.vim]], true)
require("config.fzf")
time([[Config for fzf.vim]], false)
-- Config for: yanky.nvim
time([[Config for yanky.nvim]], true)
require("config.yanky")
time([[Config for yanky.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
require("config.todo-comments")
time([[Config for todo-comments.nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
require("config.lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require("config.toggleterm")
time([[Config for toggleterm.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require("config.lualine")
time([[Config for lualine.nvim]], false)
-- Config for: mason-tool-installer.nvim
time([[Config for mason-tool-installer.nvim]], true)
require("config.mason-tool-installer")
time([[Config for mason-tool-installer.nvim]], false)
-- Config for: vim-better-whitespace
time([[Config for vim-better-whitespace]], true)
require("config.vim-better-whitespace")
time([[Config for vim-better-whitespace]], false)
-- Config for: vim-eunuch
time([[Config for vim-eunuch]], true)
require("config.vim-eunuch")
time([[Config for vim-eunuch]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
require("config.mason")
time([[Config for mason.nvim]], false)
-- Config for: noice.nvim
time([[Config for noice.nvim]], true)
require("config.noice")
time([[Config for noice.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("config.nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
require("config.LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
require("config.null-ls")
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("config.nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
require("config.vim-illuminate")
time([[Config for vim-illuminate]], false)
-- Config for: nvim-hlslens
time([[Config for nvim-hlslens]], true)
require("config.nvim-hlslens")
time([[Config for nvim-hlslens]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
require("config.nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: flit.nvim
time([[Config for flit.nvim]], true)
require("config.flit")
time([[Config for flit.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
require("config.nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: color-picker.nvim
time([[Config for color-picker.nvim]], true)
require("config.color-picker")
time([[Config for color-picker.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require("config.nvim-tree")
time([[Config for nvim-tree.lua]], false)
-- Config for: vim-markdown
time([[Config for vim-markdown]], true)
require("config.vim-markdown")
time([[Config for vim-markdown]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("config.treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-window.git
time([[Config for nvim-window.git]], true)
require("config.nvim-window")
time([[Config for nvim-window.git]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
require("config.nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: vim-move
time([[Config for vim-move]], true)
require("config.vim-move")
time([[Config for vim-move]], false)
-- Config for: cutlass.nvim
time([[Config for cutlass.nvim]], true)
require("config.cutlass")
time([[Config for cutlass.nvim]], false)
-- Config for: vim-obsession
time([[Config for vim-obsession]], true)
require("config.vim-obsession")
time([[Config for vim-obsession]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
require("config.diffview")
time([[Config for diffview.nvim]], false)
-- Config for: hydra.nvim
time([[Config for hydra.nvim]], true)
require("config.hydra")
time([[Config for hydra.nvim]], false)
-- Config for: dirbuf.nvim
time([[Config for dirbuf.nvim]], true)
require("config.dirbuf")
time([[Config for dirbuf.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("config.telescope")
time([[Config for telescope.nvim]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
require("config.dressing")
time([[Config for dressing.nvim]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
require("config.leap")
time([[Config for leap.nvim]], false)
-- Config for: git-conflict.nvim
time([[Config for git-conflict.nvim]], true)
require("config.git-conflict")
time([[Config for git-conflict.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require("config.gitsigns")
time([[Config for gitsigns.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
require("config.lsp_signature")
time([[Config for lsp_signature.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
require("config.fidget")
time([[Config for fidget.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require("config.which-key")
time([[Config for which-key.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
vim.cmd [[au FileType csv ++once lua require("packer.load")({'csv.vim'}, { ft = "csv" }, _G.packer_plugins)]]
vim.cmd [[au FileType http ++once lua require("packer.load")({'rest.nvim'}, { ft = "http" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'Comment.nvim', 'emmet-vim', 'nvim-autopairs', 'vim-matchup'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/edwarmv/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]], true)
vim.cmd [[source /Users/edwarmv/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]]
time([[Sourcing ftdetect script at: /Users/edwarmv/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]], false)
time([[Sourcing ftdetect script at: /Users/edwarmv/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]], true)
vim.cmd [[source /Users/edwarmv/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]]
time([[Sourcing ftdetect script at: /Users/edwarmv/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
