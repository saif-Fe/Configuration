return {
  { 'tpope/vim-fugitive' },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader><F5>", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  { 'ThePrimeagen/harpoon', branch = 'harpoon2' },
  { 'uga-rosa/ccc.nvim' },
  { 'stevearc/oil.nvim', opts = {} },
  {
    'samjwill/nvim-unception',
    init = function() end,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
  },
  {
    'uga-rosa/ccc.nvim',
  },
  { 'rktjmp/lush.nvim' },
  { dir = 'C:/Users/Admin/AppData/Local/nvim/lush_theme', lazy = true },
  {
    'hat0uma/csvview.nvim',
    config = function()
      require('csvview').setup()
    end
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },
}

