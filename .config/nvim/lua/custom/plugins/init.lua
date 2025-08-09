return {
  { 'tpope/vim-fugitive' },
  {
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { '<leader><F5>', "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  { 'uga-rosa/ccc.nvim' },
  {
    'samjwill/nvim-unception',
    init = function() end,
  },
  {
    'stevearc/oil.nvim',
    opts = {
      win_options = {
        signcolumn = 'yes:2',
      },
      keymaps = {
        ['q'] = 'actions.close',
      },
      float = {
        padding = 2,
        max_width = 120,
        max_height = 20,
      },
    },
  },
  {
    'refractalize/oil-git-status.nvim',
    dependencies = {
      'stevearc/oil.nvim',
    },
    config = true,
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
    end,
  },
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {}
    end,
  },
  {
    'rbong/vim-flog',
    lazy = true,
    cmd = { 'Flog', 'Flogsplit', 'Floggit' },
    dependencies = {
      'tpope/vim-fugitive',
    },
  },
  {
    'mistweaverco/kulala.nvim',
    opts = {
      global_keymaps = true,
      kulala_keymaps = true,
      ui = {
        display_mode = 'float',
      },
      scratchpad_default_contents = {
        '@MY_TOKEN_NAME=my_token_value',
        '@URL=url',
        '',
        '# @name post',
        'POST {{URL}}/post HTTP/1.1',
        'accept: application/json',
        'content-type: application/json',
        'Authorization: Bearer {{MY_TOKEN_NAME}}',
        '',
        '{',
        '  "foo": "bar"',
        '}',
        '',
        '###',
        '',
        '# @name post-form-data',
        'POST {{URL}}/post HTTP/1.1',
        'Content-Type: multipart/form-data; boundary=----WebKitFormBoundary{{$timestamp}}',
        'Authorization: Bearer {{MY_TOKEN_NAME}}',
        '',
        '------WebKitFormBoundary{{$timestamp}}',
        'Content-Disposition: form-data; name="logo"; filename="logo.png"',
        'Content-Type: image/jpeg',
        '',
        '< /home/giraffe/Pictures/logo.png',
        '',
        '------WebKitFormBoundary{{$timestamp}}',
        'Content-Disposition: form-data; name="x"',
        '',
        '0',
        '------WebKitFormBoundary{{$timestamp}}',
        'Content-Disposition: form-data; name="y"',
        '',
        '1.4333333333333333',
        '------WebKitFormBoundary{{$timestamp}}',
        'Content-Disposition: form-data; name="w"',
        '',
        '514.5666666666667',
        '------WebKitFormBoundary{{$timestamp}}',
        'Content-Disposition: form-data; name="h"',
        '',
        '514.5666666666667',
        '------WebKitFormBoundary{{$timestamp}}--',
      },
    },
  },
  {
    'olrtg/nvim-emmet',
    config = function()
      vim.keymap.set({ 'n', 'v' }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
    end,
  },
  { 'shortcuts/no-neck-pain.nvim', version = '*', opts = {} },
}
