require('nvim-tree').setup {
  -- auto_close = true
  update_focused_file = {
    enable = true,
    update_root = {
      enable = true
    }
  },
  view = {
    adaptive_size = true
  },
  renderer = {
    group_empty = true
  },
}
