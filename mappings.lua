---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>n"] = "", -- Toggle line numbers
    ["<leader>rn"] = "", -- Toggle relative numbers
    ["<leader>b"] = "", -- New buffer
    ["<tab>"] = "", -- Next buffer
    ["<S-tab>"] = "", -- Prev buffer
    ["<leader>th"] = "", -- Theme switching
    ["<leader>f"] = "", -- Float diagnostic
    ["<leader>e"] = "", -- NvimTree Focus
    ["<C-n>"] = "", -- NvimTree Toggle
    ["<leader>ff"] = "", -- Telescope find_files
    ["<leader>fo"] = "", -- Telescope find_files
    ["<leader>ls"] = "", -- Lsp signature_help
    ["<A-i>"] = "", -- Terminal float
    ["<A-h>"] = "", -- Terminal horizontal
    ["<A-v>"] = "", -- Terminal vertical
    ["<leader>h"] = "", -- New Terminal horizontal
    ["<leader>v"] = "", -- New Terminal floating
    ["<leader>pv"] = "", -- Pick hidden Terminal
  },
  t = {
    ["<C-x>"] = "", -- Escape terminal mode
    ["<A-i>"] = "", -- Terminal float
    ["<A-h>"] = "", -- Terminal horizontal
    ["<A-v>"] = "", -- Terminal vertical
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.lazy = {
  n = {
    ["<leader>l"] = { "<cmd>Lazy<cr>", "Lazy" },
  },
}

M.config = {
  n = {
    ["<leader>cc"] = { "<cmd>cd ~/.config/nvim/lua/custom<cr>", "Cd Config/Custom" },
    ["<leader>cn"] = { "<cmd>cd ~/.config/nvim<cr>", "Cd Config" },
  },
}

M.quit = {
  n = {
    ["<leader>qa"] = { "<cmd>qa<cr>", "Quit all" },
    ["<leader>qq"] = { "<cmd>q<cr>", "Quit / Quit Window" },
  },
  t = {
    ["<esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape Terminal" },
  },
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
  },
}

M.lspconfig = {
  n = {
    ["gl"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating Diagnostic",
    },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "NvimTree" },
  },
}

M.telescope = {
  n = {
    ["<leader><leader>"] = { "<cmd> Telescope find_files<cr>", "Find Files" },
    ["<leader>fr"] = { "<cmd> Telescope oldfiles<cr>", "Recent Files" },
    ["<leader>ct"] = { "<cmd> Telescope themes<cr>", "Colorscheme Picker" },
  },
}

M.toggleterm = {
  --plugin = true,
  n = {
    ["<C-t>"] = { "<cmd>ToggleTerm<cr>", "ToggleTerm" },
    ["<leader>th"] = { "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal" },
    ["<leader>tv"] = { "<cmd>ToggleTerm direction=vertical<cr>", "Vertical" },
    ["<leader>tf"] = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    ["<leader>tt"] = { "<cmd>ToggleTerm direction=tab<cr>", "Tab" },
  },
}

return M
