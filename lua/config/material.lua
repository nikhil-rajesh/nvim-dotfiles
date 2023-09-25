-- Set the theme style
vim.g.material_style = 'deep ocean'

require('material').setup({
  lualine_style = 'default',
  async_loading = true,
  contrast = {
    sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = false, -- Enable contrast for floating windows
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
})

-- Enable the colorscheme
vim.cmd 'colorscheme material'
