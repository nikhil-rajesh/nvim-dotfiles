require("project").setup {
  show_hidden = true,
  detection_methods = {
    "pattern",
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
  exclude_dirs = {
    '~/.Projects/traceable-installer-workflow/*'
  }
}
