local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- saving when an actual file opened
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
    keys = {
      {
        "<leader>ql",
        function()
          require("persistence").load { last = true }
        end,
        desc = "Reload Last Session",
      },
      {
        "<leader>qs",
        function()
          require("persistence").load()
        end,
        desc = "Reload Directory Session",
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        local function options(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", "?", api.tree.toggle_help, options "Help")
        vim.keymap.set("n", ".", api.tree.change_root_to_node, options "CD")
      end,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = overrides.nvimtree,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = {
      {
        "<leader>gg",
        "<cmd>lua _LAZYGIT_TOGGLE()<cr>",
        desc = "Lazygit",
      },
    },
    config = function()
      require "custom.configs.toggleterm"
    end,
  },
  { import = "custom.configs.extras.mason-extras" },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require "custom.configs.null-ls" -- require your null-ls config here (example below)
    end,
  },
  -- Install a plugin
  -- {
  --   "max397574/better-escape.nvim",
  --   event = "InsertEnter",
  --   config = function()
  --     require("better_escape").setup()
  --   end,
  -- },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
