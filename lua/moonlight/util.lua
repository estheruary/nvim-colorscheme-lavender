-- SPDX-License-Identifier: LGPL-3.0-only
---@mod moonlight.util utility functions

---@type table<string,function>
local M = {}

---Load terminal colours
---@param c Palette moonlight.colors
function M.hl_terminal(c)
  -- terminfo(5)
  vim.g.terminal_color_0  = c.black
  vim.g.terminal_color_8  = c.gray

  vim.g.terminal_color_1  = c.red
  vim.g.terminal_color_9  = c.red

  vim.g.terminal_color_2  = c.green
  vim.g.terminal_color_10 = c.green

  vim.g.terminal_color_3  = c.yellow
  vim.g.terminal_color_11 = c.yellow

  vim.g.terminal_color_4  = c.blue
  vim.g.terminal_color_12 = c.blue

  vim.g.terminal_color_5  = c.purple
  vim.g.terminal_color_13 = c.purple

  vim.g.terminal_color_6  = c.cyan
  vim.g.terminal_color_14 = c.cyan

  vim.g.terminal_color_7  = c.white
  vim.g.terminal_color_15 = c.white
end

return M
