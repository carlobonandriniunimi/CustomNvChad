local plugins = {
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- saving when an actual file opened
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
    keys = {
      {"<leader>ql", function () require("persistence").load({ last = true }) end, desc = "Reload Last Session"},
      {"<leader>qs", function () require("persistence").load() end, desc = "Reload Directory Session"},
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')

        local function options(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set('n', '?', api.tree.toggle_help, options('Help'))
        vim.keymap.set('n', '.', api.tree.change_root_to_node, options('CD'))
      end
    },
  },
}

return plugins
