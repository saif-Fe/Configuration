return {
  { 'tpope/vim-fugitive' },
  { 'mbbill/undotree' },
  { 'ThePrimeagen/harpoon', branch = 'harpoon2' },
  { 'uga-rosa/ccc.nvim' },
  { 'stevearc/oil.nvim', opts = {} },
  {
    'samjwill/nvim-unception',
    init = function() end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      color_overrides = {
        mocha = {
          base = '#000000',
          mantle = '#000000',
          crust = '#000000',
        },
      },
    },
  },
  {
    'stevearc/oil.nvim',
    opts = {},
  },
  {
    'uga-rosa/ccc.nvim',
  },
  {
    'mbbill/undotree',
  },
  { 'rktjmp/lush.nvim' },
  { dir = 'C:/Users/Admin/AppData/Local/nvim/lush_theme', lazy = true },
  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        width = 100, -- width of the Zen window
        options = {
          signcolumn = 'no', -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
          cursorline = false, -- disable cursorline
          cursorcolumn = false, -- disable cursor column
          foldcolumn = '0', -- disable fold column
          list = false, -- disable whitespace characters
        },
      },
      plugins = {
        wezterm = {
          enabled = true,
          font = '16',
        },
      },
    },
  },
  {
    'hat0uma/csvview.nvim',
    config = function()
      require('csvview').setup()
    end
  }
}
