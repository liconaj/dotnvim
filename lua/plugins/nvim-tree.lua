g.nvim_tree_quit_on_open = 0
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_disable_window_picker = 1
g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_width_allow_resize  = 1
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

g.nvim_tree_icons = {
	default = "‣"
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require 'nvim-tree'.setup{
  disable_netrw = true,
  update_cwd = true,
  update_to_buf_dir = {
    enable = true,
    auto_open = true
  },
  update_focused_file = {
    enable = false
  },
  hijack_cursor = true,
  filters = {
    dotfiles = true
  },
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = {"<2-RightMouse>", "CD"},    cb = tree_cb("cd") },
      }
    }
  }
}
