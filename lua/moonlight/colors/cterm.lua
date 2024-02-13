-- SPDX-License-Identifier: LGPL-3.0-only
---@mod moonlight.colors.cterm colour mappings for cterm

-- These mappings are best-effort, and generated from the hex colours based
-- on closeness in the CIELAB colour space to the standard 256-color palette.
-- See src/HexToCterm

---@alias ANSIPalette table<string,integer>

---@type MoonlightOpts
local config = require("moonlight.config")

---@type ANSIPalette
local M = {
  white = 0,
  gray = 0,
  black = 0,
  red = 0,
  green = 0,
  yellow = 0,
  paleblue = 0,
  lightblue = 0,
  cyan = 0,
  blue = 0,
  purple = 0,
  purple2 = 0,
  orange = 0,
  pink = 0,

  bg = 0,
  bg_alt = 0,
  fg = 0,
  text = 0,
  comments = 0,
  selection = 0,
  contrast = 0,
  active = 0,
  border = 0,
  line_numbers = 0,
  highlight = 0,
  disabled = 0,
  cursor = 0,
  accent = 0,
  error = 0,
  link = 0,
}
M.grey = M.gray
-- FIX: Deprecate
M.cyan = M.purple2

if config.contrast then
  M.sidebar = M.bg_alt
  M.float   = M.bg_alt
else
  M.sidebar = M.bg
  M.float   = M.bg
end

-- Merge user-defined config
M = vim.tbl_extend("force", M, config.overrides.colors.cterm or {})

return M
