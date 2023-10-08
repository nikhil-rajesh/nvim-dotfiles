require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "vimdoc", "go", "json", "java", "javascript", "yaml", "regex", "python", "promql" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}
