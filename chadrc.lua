---@type ChadrcConfig 
local M = {}

M.ui = {
  theme_toggle = { "onedark", "one_light" },
  theme = "onedark",
  transparency = true,
  lsp_semantic_tokens = true,
  cmp = {
    lspkind_text = true,
    style = "default"
  },
}

M.plugins = "custom.plugins"

-- Every other entry apart from plugins needs the require keyword
M.mappings = require "custom.mappings"

return M
