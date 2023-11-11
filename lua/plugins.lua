-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
  return function()
    require("config/" .. name)
  end
end

return {
  -- Change surround tags faster
  "tpope/vim-repeat",
  "tpope/vim-surround",
  -- Snippets
  "rafamadriz/friendly-snippets",
  -- Learn Vim Game
  "ThePrimeagen/vim-be-good",
  "davidgranstrom/nvim-markdown-preview",
  -- Terraform SyntaxHighlight
  "hashivim/vim-terraform",
  -- Pictograms for LSP completion
  "onsails/lspkind.nvim",
  -- Change Root directory
  { "ahmedkhalf/project.nvim",             config = get_config("project"),          main = "project_nvim" },
  -- Markdown Preview
  { "ellisonleao/glow.nvim",               config = get_config("glow") },
  -- Key bindings pop-up
  { "folke/which-key.nvim",                config = get_config("which-key") },
  -- Notifications
  { "rcarriga/nvim-notify",                config = get_config("notify") },
  -- Indent blank lines (just like the name)
  { "lukas-reineke/indent-blankline.nvim", config = get_config("indent_blankline"), main = "ibl" },
  -- Color highlighter
  { "norcalli/nvim-colorizer.lua",         config = get_config("colorizer") },
  -- Smooth Scrolling
  { "karb94/neoscroll.nvim",               config = get_config("neoscroll") },
  -- Material Theme
  { "marko-cerovac/material.nvim",         config = get_config("material") },
  -- Commenter
  { "numToStr/Comment.nvim",               config = get_config("comment") },
  -- Tree to view symbols in source code
  { "simrat39/symbols-outline.nvim",       config = get_config("outline") },
  -- Automatic Bracket Closing
  { "windwp/nvim-autopairs",               config = get_config("autopairs") },
  -- Remove trailing spaces
  { "lewis6991/spaceless.nvim",            config = get_config("spaceless") },
  -- LSP
  { "neovim/nvim-lspconfig",               config = get_config("lsp") },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "michaelb/sniprun",
    build = "bash ./install.sh",
    config = get_config("sniprun")
  },
  -- Dashboard
  {
    "goolord/alpha-nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons"
    },
    lazy = false,
    config = get_config("alpha")
  },
  -- Git decorations that's show changed lines
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = get_config("gitsigns")
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
  },
  -- File explorer
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {

      "kyazdani42/nvim-web-devicons",
    },
    config = get_config("nvim-tree"),
  }
}
