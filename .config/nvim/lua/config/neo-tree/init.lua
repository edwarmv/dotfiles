vim.g.neo_tree_remove_legacy_commands = 1

require("config.neo-tree.custom")

local fold_commands = require("config.neo-tree.fold-commands")
local commands = require("config.neo-tree.commands")

local icons = require("icons")

require("neo-tree").setup({
  source_selector = {
    winbar = false,
    statusline = false,
  },
  hide_root_node = false,
  renderers = {
    message = {
      { "indent", with_markers = true },
      { "name", highlight = "NeoTreeMessage" },
    },
    directory = {
      { "indent" },
      { "clipboard" },
      { "icon" },
      -- { "diagnostics", errors_only = true },
      { "current_filter" },
      { "name", use_git_status_colors = false },
    },
    file = {
      { "indent" },
      { "clipboard" },
      { "modified" },
      { "git_status" },
      { "icon" },
      -- { "diagnostics" },
      { "bufnr" },
      { "name", use_git_status_colors = false },
    },
  },
  use_popups_for_input = true,
  close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "single",
  enable_git_status = true,
  enable_diagnostics = false,
  use_default_mappings = false,
  sort_case_insensitive = true, -- used when sorting files and directories in the tree
  default_component_configs = {
    container = {
      enable_character_fade = false,
      -- width = "fit_content",
    },
    indent = {
      indent_size = 2,
      padding = 0, -- extra padding on left hand side
      -- indent guides
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
      -- expander config, needed for nesting files
      with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
      -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
      -- then these will never be used.
      default = "",
      highlight = "NeoTreeFileIcon",
    },
    modified = {
      symbol = "[+]",
      highlight = "NeoTreeModified",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },
    git_status = {
      symbols = {
        -- Change type
        added = "A", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified = "M", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted = "D", -- this can only be used in the git_status source
        renamed = "R", -- this can only be used in the git_status source
        -- Status type
        untracked = "?",
        ignored = "!",
        unstaged = "U",
        staged = "S",
        conflict = "C",
      },
    },
  },
  window = {
    position = "left",
    width = 40,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<tab>"] = {
        "toggle_node",
        nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
      },
      ["<2-LeftMouse>"] = "open",
      -- ["o"] = "open",
      -- ["S"] = "open_split",
      -- ["s"] = "open_vsplit",
      ["<c-s>"] = "split_with_window_picker",
      ["<c-v>"] = "vsplit_with_window_picker",
      ["t"] = "open_tabnew",
      ["o"] = "open_with_window_picker",
      ["<bs>"] = "close_node",
      ["P"] = { "toggle_preview", config = { use_float = true } },
      ["z"] = "",
      -- ["Z"] = "expand_all_nodes",
      ["a"] = {
        "add",
        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
        config = {
          show_path = "absolute", -- "none", "relative", "absolute"
        },
      },
      ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
      -- ["c"] = {
      --  "copy",
      --  config = {
      --    show_path = "none" -- "none", "relative", "absolute"
      --  }
      --}
      ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
      ["q"] = "close_window",
      ["R"] = "refresh",
      ["?"] = "show_help",
      ["<"] = "prev_source",
      [">"] = "next_source",
      ["zo"] = fold_commands.neotree_zo,
      ["zO"] = fold_commands.neotree_zO,
      ["zc"] = fold_commands.neotree_zc,
      ["zC"] = fold_commands.neotree_zC,
      ["za"] = fold_commands.neotree_za,
      ["zA"] = fold_commands.neotree_zA,
      ["zx"] = fold_commands.neotree_zx,
      ["zX"] = fold_commands.neotree_zX,
      ["zm"] = fold_commands.neotree_zm,
      ["zM"] = fold_commands.neotree_zM,
      ["zr"] = fold_commands.neotree_zr,
      ["zR"] = fold_commands.neotree_zR,
    },
  },
  nesting_rules = {},
  filesystem = {
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_hidden = true, -- only works on Windows for hidden files/directories
    },
    follow_current_file = false, -- This will find and focus the file in the active buffer every
    -- time the current file is changed while the tree is open.
    group_empty_dirs = false, -- when true, empty folders will be grouped together
    hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
    -- in whatever position is specified in window.position
    -- "open_current",  -- netrw disabled, opening a directory opens within the
    -- window like netrw would, regardless of window.position
    -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
    -- instead of relying on nvim autocmd events.
    window = {
      mappings = {
        ["{"] = "navigate_up",
        ["}"] = "set_root",
        ["H"] = "toggle_hidden",
        ["F"] = "fuzzy_finder",
        ["D"] = "fuzzy_finder_directory",
        ["f"] = "filter_on_submit",
        ["<c-x>"] = "clear_filter",
        ["[c"] = "prev_git_modified",
        ["<cr>"] = "system_open",
        ["K"] = "print_file_name",
        ["T"] = "trash",
      },
    },
    commands = {
      print_file_name = commands.print_file_name,
      system_open = commands.system_open,
      trash = commands.trash,
      trash_visual = commands.trash_visual,
    },
  },
  buffers = {
    follow_current_file = true, -- This will find and focus the file in the active buffer every
    -- time the current file is changed while the tree is open.
    group_empty_dirs = true, -- when true, empty folders will be grouped together
    show_unloaded = true,
    window = {
      position = "left",
      mappings = {
        ["bd"] = "buffer_delete",
        ["{"] = "navigate_up",
        ["}"] = "set_root",
      },
    },
  },
  git_status = {
    window = {
      position = "left",
      mappings = {
        ["A"] = "git_add_all",
        ["gu"] = "git_unstage_file",
        ["ga"] = "git_add_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "git_commit_and_push",
      },
    },
  },
  event_handlers = {
    -- {
    --   event = "neo_tree_window_before_open",
    --   handler = function(args) end,
    -- },
    {
      event = "neo_tree_window_after_open",
      handler = function(args)
        if args.position == "left" or args.position == "right" then
          vim.cmd("wincmd =")
        end
      end,
    },
    -- {
    --   event = "neo_tree_window_before_close",
    --   handler = function(args)
    --     require("neo-tree").setup(getOptions(vim.fn.winwidth(0)))
    --   end,
    -- },
    {
      event = "neo_tree_window_after_close",
      handler = function(args)
        if args.position == "left" or args.position == "right" then
          vim.cmd("wincmd =")
        end
      end,
    },
  },
})

vim.keymap.set("n", "<space>e", "<cmd>Neotree toggle=true<cr>")
vim.keymap.set("n", "<space>E", "<cmd>Neotree reveal<cr>")
