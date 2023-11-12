-- Set the theme style
vim.g.material_style = 'palenight'

require('material').setup({
  lualine_style = 'default',
  async_loading = true,
  contrast = {
    sidebars = true,            -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = false,   -- Enable contrast for floating windows
    non_current_windows = true, -- Enable darker background for non-current windows
    -- popup_menu = false, -- Enable lighter background for the popup menu
  },
  styles = { -- Give comments style such as bold, italic, underline etc.
    comments = { --[[ italic = true ]] },
    strings = { --[[ bold = true ]] },
    keywords = { --[[ underline = true ]] },
    functions = { --[[ bold = true, undercurl = true ]] },
    variables = {},
    operators = {},
    types = {},
  },
  plugins = {
    -- "dap",
    -- "dashboard",
    -- "eyeliner",
    -- "fidget"
    "flash",
    -- "gitsigns",
    -- "harpoon",
    -- "hop",
    "illuminate",
    "indent-blankline",
    -- "lspsaga",
    -- "mini",
    -- "neogit",
    -- "neotest",
    -- "neorg",
    -- "noice"
    "nvim-cmp",
    -- "nvim-navic",
    "nvim-tree",
    "nvim-web-devicons",
    -- "rainbow-delimiters",
    -- "sneak",
    "telescope",
    "trouble",
    "which-key",
  }
})
