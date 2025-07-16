-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
  return function()
    require("config/" .. name)
  end
end

return {
  -- ledger
  "ledger/vim-ledger",
  -- Helm Yaml
  "towolf/vim-helm",
  -- Change surround tags faster
  "tpope/vim-repeat",
  "tpope/vim-surround",
  -- Snippets
  "rafamadriz/friendly-snippets",
  -- Learn Vim Game
  "ThePrimeagen/vim-be-good",
  -- Terraform SyntaxHighlight
  "hashivim/vim-terraform",
  -- Pictograms for LSP completion
  "onsails/lspkind.nvim",
  -- Notifications
  "rcarriga/nvim-notify",
  -- Remove trailing spaces
  "lewis6991/spaceless.nvim",
  -- Highlight cursor when moved
  "danilamihailov/beacon.nvim",
  -- Diffview
  "sindrets/diffview.nvim",
  -- Change Root directory
  { "DrKJeff16/project.nvim",         config = get_config("project"), main = "project_nvim" },
  -- Material Theme
  { "marko-cerovac/material.nvim",     config = get_config("material") },
  -- Catpuccin Theme
  { "catppuccin/nvim",                 name = "catppuccin",            priority = 1000 },
  -- Tree to view symbols in source code
  { "simrat39/symbols-outline.nvim",   config = get_config("outline") },
  -- LSP
  { "neovim/nvim-lspconfig",           config = get_config("lsp") },
  -- Rainbow Delimiters
  { "HiPhish/rainbow-delimiters.nvim", config = get_config("rainbow") },
  -- Key bindings pop-up
  {
    "folke/which-key.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.icons",
    },
    config = get_config("which-key")
  },
  -- Highlight usage of variables
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        filetypes_denylist = {
          'NvimTree',
        }
      })
    end
  },
  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = get_config("barbecue-nvim"),
  },
  -- Better folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "luukvbaal/statuscol.nvim",
    },
    event = "BufReadPost",
    config = get_config("nvim-ufo")
  },
  {
    "luukvbaal/statuscol.nvim",
    lazy = false,
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = true,
        segments = {
          { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
          { text = { "%s" },                  click = "v:lua.ScSa" },
          { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
        },
      })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = get_config("flash")
  },
  -- Smooth Scrolling
  {
    "karb94/neoscroll.nvim",
    opts = {},
  },
  -- Indent blank lines (just like the name)
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {},
    main = "ibl"
  },
  -- Markdown Preview
  {
    "ellisonleao/glow.nvim",
    opts = {},
  },
  -- Commenter
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  -- Color highlighter
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup()
    end
  },
  -- Automatic Bracket Closing
  {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    branch = 'v0.6', --recomended as each new version will have breaking changes
    opts = {},
  },
  -- {
  --   "windwp/nvim-autopairs",
  --   event = "InsertEnter",
  --   opts = {}
  -- },
  -- Git UI
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- Git UI 2
  {
    'SuperBo/fugit2.nvim',
    opts = {
      libgit2_path = '/opt/homebrew/lib/libgit2.dylib'
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      {
        'chrisgrieser/nvim-tinygit', -- optional: for Github PR view
        dependencies = { 'stevearc/dressing.nvim' }
      },
    },
    cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2Graph' },
    keys = {
      { '<leader>F', mode = 'n', '<cmd>Fugit2<cr>' }
    }
  },
  -- Run parts of code directly
  {
    "michaelb/sniprun",
    build = "bash ./install.sh",
    config = get_config("sniprun")
  },
  -- Dashboard
  -- {
  --   "goolord/alpha-nvim",
  --   dependencies = {
  --     "kyazdani42/nvim-web-devicons"
  --   },
  --   lazy = false,
  --   config = get_config("alpha")
  -- },
  -- Git decorations that's show changed lines
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    opts = {}
  },
  -- Awesome Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = get_config("lualine"),
  },
  -- Code Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip-integ",
      "f3fora/cmp-spell",
      "octaltree/cmp-look",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",

    },
    config = get_config("cmp"),
  },
  -- Well, should I explain more?
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = get_config("treesitter"),
  },
  -- Show window with diagnostics
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  -- Better fuzzy search
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "kyazdani42/nvim-web-devicons",

    },
    config = get_config("telescope"),
    lazy = false,
  },
  -- File explorer
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {

      "kyazdani42/nvim-web-devicons",
    },
    config = get_config("nvim-tree"),
  },
  -- Split and join blocks of code
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {}
  },
  -- File explorer
  {
    'stevearc/oil.nvim',
    config = get_config("oil"),
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  }
}
