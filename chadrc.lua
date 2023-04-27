---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
  transparency = false,

  hl_override = highlights.override,
  hl_add = highlights.add,

  extended_integrations = {}, -- "alpha, notify", check base46 repo

  lsp_semantic_tokens = true,
  cmp = {
    lspkind_text = true,
    style = "default",
  },

  telescope = { style = "borderless" },

  statusline = {
    theme = "vscode_colored",
    separator_style = "default",
  },

  nvdash = {
    load_on_startup = true,
    buttons = {
      { "  Find File", "Spc Spc", "Telescope find_files" },
      { "  Recent Files", "Spc f r", "Telescope oldfiles" },
      { "  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc b m", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    }
  },

  lsp = {
    signature = {
      disabled = false, -- signature as you type
    }
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
