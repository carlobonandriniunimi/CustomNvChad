---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
  transparency = true,
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
  lsp = {
    signature = {
      disabled = false, -- signature as you type
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
