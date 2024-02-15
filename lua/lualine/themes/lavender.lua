-- SPDX-License-Identifier: LGPL-3.0-only
---@mod lualine.themes.lavender lavender lualine theme

---@type Palette
local c = require("lavender.colors")

---@type table<string,Highlights>
local M = {
  normal = {
    a = { fg = c.bg, bg = c.accent, gui = "bold" },
    b = { fg = c.title, bg = c.active },
    c = { fg = c.fg, bg = c.selection },
  },

  insert = {
    a = { fg = c.bg, bg = c.green, gui = "bold" },
    b = { fg = c.title, bg = c.active },
  },

  visual = {
    a = { fg = c.bg, bg = c.purple, gui = "bold" },
    b = { fg = c.title, bg = c.active },
  },

  replace = {
    a = { fg = c.bg, bg = c.red, gui = "bold" },
    b = { fg = c.title, bg = c.active },
  },

  command = {
    a = { fg = c.bg, bg = c.yellow, gui = "bold" },
    b = { fg = c.title, bg = c.active },
  },

  inactive = {
    a = { fg = c.disabled, bg = c.bg, gui = "bold" },
    b = { fg = c.disabled, bg = c.bg },
    c = { fg = c.disabled, bg = c.selection },
  },
}

return M
