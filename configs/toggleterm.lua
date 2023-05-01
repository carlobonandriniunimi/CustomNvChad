require "base46.term" --  Loading themes
require("toggleterm").setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<C-t>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = false,
  autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  start_in_insert = true,
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  direction = "float",
  close_on_exit = true, -- close the terminal window when the process exits
  -- Change the default shell. Can be a string or a function returning a string
  shell = vim.o.shell,
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    border = "curved",
    winblend = 0,
  },
}

local Terminal = require("toggleterm.terminal").Terminal

function _LAZYGIT_TOGGLE()
  local lazygit = Terminal:new { cmd = "lazygit", hidden = true, dir = "git_dir" }
  lazygit:toggle()
end
