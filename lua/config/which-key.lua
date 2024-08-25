local wk = require("which-key")

-- Language Server Protocols
wk.add({
  { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Show Signature Help" },
  { "<space>", group = "lsp" },
  { "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "Goto Type Definition" },
  { "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
  { "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open float with diagnostic" },
  { "<space>f", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Formats the buffer" },
  { "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Set diagnostic to location list" },
  { "<space>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename variable" },
  { "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", desc = "Add Workspace Folder" },
  { "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", desc = "List Workspace Folders" },
  { "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", desc = "Remove Workspace Folder" },
  { "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Show Information" },
  { "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Goto prev diagnostic" },
  { "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Goto next diagnostic" },
  { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Goto declaration" },
  { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Goto definition" },
  { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Goto implementation" },
  { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "References" },
})


-- Normal Mode
wk.add({
  { "<C-b>", desc = "Scroll Full Page Up" },
  { "<C-d>", desc = "Scroll Half Page Down" },
  { "<C-e>", desc = "Scroll Quarter Page Down" },
  { "<C-f>", group = "file" },
  { "<C-f>F", "<cmd>Telescope find_files find_command=rg,--no-ignore,--files<cr>", desc = "Find File" },
  { "<C-f>G", "<cmd>lua require('telescope.builtin').live_grep({ additional_args = { \"--hidden\", \"--no-ignore\" }})<cr>", desc = "Search Inside Ignored Files Also" },
  { "<C-f>a", "<cmd>Telescope git_bcommits<cr>", desc = "List buffer's git commits with diff preview" },
  { "<C-f>b", "<cmd>Telescope buffers<cr>", desc = "Find Buffer" },
  { "<C-f>f", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<C-f>g", "<cmd>Telescope live_grep<cr>", desc = "Search Inside Files" },
  { "<C-f>o", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
  { "<C-f>p", "<cmd>Telescope projects<cr>", desc = "Open Projects" },
  { "<C-f>r", "<cmd>Telescope registers<cr>", desc = "Find Register" },
  { "<C-f>t", "<cmd>Telescope treesitter<cr>", desc = "Find Treesitter Symbols" },
  { "<C-f>x", "<cmd>Telescope colorscheme<cr>", desc = "Change colorscheme" },
  { "<C-h>", "<C-w><C-h>", desc = "Goto Left Split" },
  { "<C-j>", "<C-w><C-j>", desc = "Goto Bottom Split" },
  { "<C-k>", "<C-w><C-k>", desc = "Goto Top Split" },
  { "<C-l>", "<C-w><C-l>", desc = "Goto Right Split" },
  { "<C-u>", desc = "Scroll Half Page Up" },
  { "<C-y>", desc = "Scroll Quarter Page Up" },
  { "<leader>", group = "custom" },
  { "<leader><space>", ":nohlsearch<cr>", desc = "Search Highlight Off" },
  { "<leader>f", group = "SnipRun" },
  { "<leader>f", "<Plug>SnipRunOperator", desc = "Operator Mode" },
  { "<leader>ff", "<Plug>SnipRun", desc = "Run current line" },
  { "<leader>g", group = "gitsigns" },
  { "<leader>gN", "<cmd>Gitsigns prev_hunk<cr>", desc = "Jump to prev hunk" },
  { "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Git Blame current line" },
  { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Git diff buffer" },
  { "<leader>gl", "<cmd>LazyGit<cr>", desc = "Start Lazy Git" },
  { "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", desc = "Jump to next hunk" },
  { "<leader>gr", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset buffer" },
  { "<leader>grh", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk" },
  { "<leader>gs", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage buffer" },
  { "<leader>gsh", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
  { "<leader>gush", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Unstage hunk" },
  { "<leader>mc", ":lua require('material.functions').find_style()<cr>", desc = "Cycle themes" },
  { "<leader>mp", "<cmd>Glow<cr>", desc = "Markdown Preview" },
  { "<leader>p", '"+p', desc = "Paste from System Clipboard" },
  { "<leader>s", group = "sidebar" },
  { "<leader>sh", "<C-w>K", desc = "Swap vertical to horizontal splits" },
  { "<leader>si", "<cmd>NvimTreeToggle<cr>", desc = "File Tree Sidebar" },
  { "<leader>ss", "<cmd>SymbolsOutline<cr>", desc = "Symbols Sidebar" },
  { "<leader>st", "<cmd>TroubleToggle<cr>", desc = "Diagnostics Sidebar" },
  { "<leader>sv", "<C-w>H", desc = "Swap horizontal to vertical splits" },
  { "<leader>t", group = "Split/Join blocks" },
  { "<leader>tj", "<cmd>TSJJoin<cr>", desc = "Join" },
  { "<leader>ts", "<cmd>TSJSplit<cr>", desc = "Split" },
  { "<leader>tt", "<cmd>TSJToggle<cr>", desc = "Toggle" },
  { "<leader>v", group = "vimrc" },
  { "<leader>ve", "<cmd>e $MYVIMRC<CR>", desc = "Edit vimrc" },
  { "<leader>vs", ":luafile %<CR>", desc = "Soucre vimrc" },
  { "<leader>y", '"+y', desc = "Copy to System Clipboard" },
  { "N", "Nzzzv", desc = "Force Prev Search Term to center" },
  { "n", "nzzzv", desc = "Force Next Search Term to center" },
  { "Y", desc = "Copy from cursor to EOL" },
  { "gb", group = "Blockwise Comments" },
  { "gbc", desc = "Comment Current Line" },
  { "gc", group = "Linewise Comments" },
  { "gcA", desc = "Comment EOL and enter INSERT mode" },
  { "gcO", desc = "Comment prev line and enter INSERT mode" },
  { "gcc", desc = "Comment Current Line" },
  { "gco", desc = "Comment next line and enter INSERT mode" },
  { "zM", ":lua require('ufo').closeAllFolds()<cr>", desc = "Close All Folds" },
  { "zR", ":lua require('ufo').openAllFolds()<cr>", desc = "Open All Folds" },
})

-- Insert Mode
wk.add({
  mode = { "i" },
  {
    "<S-Tab>",
    "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'",
    desc = "Jump to prev selection in snippet",
    expr = true,
    remap = true,
    replace_keycodes = false
  },
  {
    "<Tab>",
    "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'",
    desc = "Jump to next selection in snippet",
    expr = true,
    remap = true,
    replace_keycodes = false
  },
})

-- Select Mode
wk.add({
  mode = { "s" },
  {
    "<S-Tab>",
    "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'",
    desc = "Jump to prev selection in snippet",
    expr = true,
    remap = true,
    replace_keycodes = false
  },
  {
    "<Tab>",
    "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'",
    desc = "Jump to next selection in snippet",
    expr = true,
    remap = true,
    replace_keycodes = false
  },
})

-- Visual Mode
wk.add({
  {
    mode = { "v" },
    { "<leader>f", "<Plug>SnipRun", desc = "Run selected code" },
    { "<leader>p", '"+p', desc = "Paste from System Clipboard" },
    { "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename selected" },
    { "<leader>y", '"+y', desc = "Copy to System Clipboard" },
  },
})

wk.setup {}
