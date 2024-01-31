return {
  { "junegunn/goyo.vim" },
  { "elzr/vim-json" },
  { "plasticboy/vim-markdown" },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "fei6409/log-highlight.nvim",
    config = function()
      require("log-highlight").setup({})
    end,
  },

  -- Colorschemes
  { "ellisonleao/gruvbox.nvim" },
  { "sainnhe/everforest" },
  { "metalelf0/jellybeans-nvim" },
  { "NLKNguyen/papercolor-theme" },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "PaperColor",
    },
  },
  -- Org mode
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter", lazy = true },
    },
    event = "VeryLazy",
    config = function()
      -- Load treesitter grammar for org
      require("orgmode").setup_ts_grammar()

      -- Setup treesitter
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { "org" },
        },
        ensure_installed = { "org" },
      })

      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
      })
    end,
  },
}
