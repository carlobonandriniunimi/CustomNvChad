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
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSUninstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
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
    "windwp/nvim-autopairs",
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      -- setup cmp for autopairs
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())

      require("nvim-autopairs").get_rule("'")[1].not_filetypes =
        { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" }
    end,
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
