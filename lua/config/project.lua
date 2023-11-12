require("project_nvim").setup {
  show_hidden = true,
  detection_methods = {
    "pattern",
    "lsp",
  },
  patterns = {
    'composer.json',
    '.git',
    'Makefile',
    '_darcs',
    '.hg',
    '.bzr',
    '.svn',
    'node_modules',
    'CMakeLists.txt',
    'init.lua',
    'pom.xml',
    'go.mod',
  },
}
