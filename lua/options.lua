vim.o.nu = true -- Show line numbers
vim.o.relativenumber = true -- Relative line numbering
vim.o.cursorline = true -- Show cursor line
vim.o.mouse = 'a'

-- Change default notification function
-- vim.notify = require("notify")

-- Set Leader
vim.g.mapleader = ','

-- Completion
vim.o.completeopt = "menu,menuone,noselect"

-- Set folding
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- Using nvim-ufo
-- vim.o.foldmethod = 'expr'
-- vim.o.foldlevel = 30
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

-- Sane Tab Settings
vim.o.tabstop = 2
vim.o.softtabstop = -1
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true

-- Rooter
-- vim.g.rooter_pattern = {'composer.json', '.git', 'Makefile', '_darcs', '.hg', '.bzr', '.svn', 'node_modules', 'CMakeLists.txt', 'init.lua', 'pom.xml', 'go.mod'}
-- vim.g.outermost_root = false

-- Misc
vim.o.termguicolors = true
vim.o.spell = true
vim.o.title = true
