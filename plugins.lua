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
}

return plugins
