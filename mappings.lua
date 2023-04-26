local M = {}

M.disabled = {
  n = {
    ["<leader>n"] = "",  -- Toggle line numbers
    ["<leader>rn"] = "", -- Toggle relative numbers
    ["<leader>b"] = "",  -- New buffer
    ["<tab>"] = "",      -- Next buffer
    ["<S-tab>"] = "",    -- Prev buffer
    ["<leader>f"] = "",  -- Float diagnostic
    ["<leader>e"] = "",  -- NvimTree Focus
    ["<C-n>"] = "",      -- NvimTree Toggle
  },
  t = {
    ["<C-x>"] = "", -- Escape terminal mode
  }
}

M.quit = {
  n = {
    ["<leader>qa"] = { "<cmd>qa<cr>", "Quit all" },
    ["<leader>qq"] = { "<cmd>q<cr>", "Quit / Quit Window" }
  },
  t = {
    ["<esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape Terminal" },
  }
}

M.tabufline = {
  n = {
    ["L"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },
    ["H"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },
  }
}

M.lspconfig = {
  n = {
    ["gl"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating Diagnostic",
    },
  }
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "NvimTree" },
  }
}

return M
