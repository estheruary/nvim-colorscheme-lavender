-- SPDX-License-Identifier: LGPL-3.0-only
---@mod moonlight.colors.cterm colour mappings for cterm

-- These mappings are best-effort, and generated from the hex colours based
-- on closeness to the standard 256-color palette by the CIEDE2000 metric.
-- See src/HexToCterm

---@alias ANSIPalette table<string,integer>

---@type MoonlightOpts
local config = require("moonlight.config")

---@type ANSIPalette
local M = {
  -- HexToCterm: START
  white = 195,
  gray = 147,
  black = 0,
  red = 210,
  green = 50,
  yellow = 222,
  paleblue = 254,
  lightblue = 152,
  cyan = 14,
  blue = 45,
  purple = 147,
  purple2 = 140,
  orange = 210,
  pink = 219,
  bg = 235,
  bg_alt = 234,
  fg = 255,
  text = 103,
  comments = 104,
  selection = 60,
  contrast = 234,
  active = 60,
  border = 60,
  line_numbers = 61,
  highlight = 147,
  disabled = 60,
  cursor = 75,
  accent = 147,
  error = 204,
  link = 116,
  -- HexToCterm: END
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
