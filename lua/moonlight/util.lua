-- SPDX-License-Identifier: LGPL-3.0-only
---@mod moonlight.util utility functions

local M = {}

---Apply a highlight to a group (tokyonight.util.highlight)
---@param group string
---@param hl Highlight
function M.highlight(group, hl)
  -- Uncomment if hl.style is used for custom style overrides
  -- if hl.style then
  --   if type(hl.style) == "table" then
  --     hl = vim.tbl_extend("force", hl, hl.style)
  --   elseif hl.style:lower() ~= "none" then
  --     -- handle old string style definitions
  --     for s in string.gmatch(hl.style, "([^,]+)") do
  --       hl[s] = true
  --     end
  --   end
  --   hl.style = nil
  -- end
  vim.api.nvim_set_hl(0, group, hl)
end

---Load main theme highlights (tokyonight.util.syntax)
---@param theme Highlights moonlight.theme
function M.apply_theme(theme)
  for group, hl in pairs(theme) do
    M.highlight(group, hl)
  end
end

---Load terminal colours (tokyonight.util.terminal)
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
