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
    opts = overrides.nvimtree,
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
      require "base46.term"
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
  {
    "ahmedkhalf/project.nvim",
    opts = {
      detection_methods = { "pattern" },
    },
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
