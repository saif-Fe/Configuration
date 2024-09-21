require('nvim-treesitter.install').prefer_git = true

-- Custom settings
vim.cmd.colorscheme 'lush_theme'
vim.g.netrw_banner = 0
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3
vim.opt.shell = 'pwsh'
vim.diagnostic.config { virtual_text = false }
vim.opt.wrap = false

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<A-]>', '<CMD>cnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-[>', '<CMD>cprev<CR>', { noremap = true, silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Harpoon Configure
local harpoon = require 'harpoon'
-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set('n', '<A-a>', function()
  harpoon:list():add()
end)
vim.keymap.set('n', '<A-;>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set('n', '<A-u>', function()
  harpoon:list():select(1)
end)
vim.keymap.set('n', '<A-i>', function()
  harpoon:list():select(2)
end)
vim.keymap.set('n', '<A-o>', function()
  harpoon:list():select(3)
end)
vim.keymap.set('n', '<A-p>', function()
  harpoon:list():select(4)
end)
vim.keymap.set('n', '<A-q>', function()
  harpoon:list():select(5)
end)
vim.keymap.set('n', '<A-w>', function()
  harpoon:list():select(6)
end)
vim.keymap.set('n', '<A-e>', function()
  harpoon:list():select(7)
end)
vim.keymap.set('n', '<A-r>', function()
  harpoon:list():select(8)
end)
vim.keymap.set('n', '<A-,>', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<A-.>', function()
  harpoon:list():next()
end)

require('oil').setup({
  keymaps = {
    ["q"] = "actions.close",
  },
      float = {
        padding = 2,
        max_width = 120,
        max_height = 20,
      },
})
vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' })

-- Undo Tree
vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)

vim.opt.termguicolors = true

local ccc = require 'ccc'
local mapping = ccc.mapping

ccc.setup {
  -- Your preferred settings
  -- Example: enable highlighter
  highlighter = {
    auto_enable = true,
    lsp = true,
  },
}

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
    desc = "Disable autoformat-on-save",
    bang = true,
  })
vim.keymap.set("", "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "[F]ormat" })
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
    desc = "Re-enable autoformat-on-save",
  })
vim.keymap.set("n", "<leader>F", function()
  if vim.b.disable_autoformat or vim.g.disable_autoformat then
    vim.cmd("FormatEnable")
  else
    vim.cmd("FormatDisable")
  end
end, { desc = "Toggle [F]ormat" })

vim.api.nvim_create_user_command("Q", function()
  local uis = vim.api.nvim_list_uis() -- Get the list of active UIs
  if #uis > 0 then
    local channel_id = uis[1].chan -- Access the channel ID from the first UI
    print("Closing Channel ID:", channel_id)
    vim.fn.chanclose(channel_id) -- Close the channel using the chanclose function
  else
    print("No active UIs found.")
  end
end, {
    desc = "Exit",
  })


--    },
--  },

--
--
--<<<<<<< HEAD
--
--local lspconfig = require('lspconfig')
--local configs = require('lspconfig/configs')
--capabilities.textDocument.completion.completionItem.snippetSupport = true
--
--lspconfig.emmet_ls.setup({
--  -- on_attach = on_attach,
--  capabilities = capabilities,
--  filetypes = { "css", "html", "javascript", "javascriptreact", "less", "sass", "scss", "typescriptreact" },
--  init_options = {
--    html = {
--      options = {
--        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--        ["bem.enabled"] = true,
--      },
--    },
--  }
--})
--
--
---- nvim-cmp supports additional completion capabilities, so broadcast that to servers
--capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
---- Ensure the servers above are installed
--local mason_lspconfig = require 'mason-lspconfig'
--
--mason_lspconfig.setup {
--  ensure_installed = vim.tbl_keys(servers),
--}
--
--mason_lspconfig.setup_handlers {
--  function(server_name)
--    require('lspconfig')[server_name].setup {
--      capabilities = capabilities,
--      on_attach = on_attach,
--      settings = servers[server_name],
--      filetypes = (servers[server_name] or {}).filetypes,
--    }
--  end
--}
