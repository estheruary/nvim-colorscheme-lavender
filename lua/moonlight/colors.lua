-- SPDX-License-Identifier: LGPL-3.0-only
---@mod moonlight.colors colour definitions

---@alias Palette table<string,string>

---@type MoonlightOpts
local config = require("moonlight.config")

-- https://en.wikipedia.org/wiki/X11_color_names
---@type Palette
local M = {
  white        = "#eeffff",
  gray         = "#a1abe0",
  black        = "#000000",
  red          = "#ff757f",
  green        = "#2df4c0",
  yellow       = "#ffc777",
  paleblue     = "#d6e7f0",
  lightblue    = "#add8e6", -- LightBlue
  -- cyan         = "#16fcf8",
  blue         = "#04d1f9",
  purple       = "#b4a4f4",
  purple2      = "#b994f1", -- FIX: old cyan
  orange       = "#f67f81",
  pink         = "#ecb2f0",

  bg           = "#212337",
  bg_alt       = "#1b1e2b",
  fg           = "#e4f3fa",
  text         = "#757dac",
  comments     = "#7486d6",
  selection    = "#403c64",
  contrast     = "#1b1c2b",
  active       = "#414863", -- border
  border       = "#414863",
  line_numbers = "#596399",
  highlight    = "#a1abe0", -- gray
  disabled     = "#515772",
  cursor       = "#5cb4fc",
  accent       = "#a3ace1",
  error        = "#ff5370",
  link         = "#80cbc4",

  none         = "NONE",
}
M.grey = M.gray
-- FIX: Deprecate
M.cyan = M.purple2

-- TODO: bg transparency check cannot happen here as "bg" is used directly
-- as a colour elsewhere
--
-- if not config.background then
--   M.bg      = M.none
--   M.sidebar = M.none
--   M.float   = M.none
-- elseif config.contrast then

-- High(er) contrast backgrounds for sidebars and floating windows
if config.contrast then
  M.sidebar = M.bg_alt
  M.float   = M.bg_alt
else
  M.sidebar = M.bg
  M.float   = M.bg
end

-- Merge user-defined config
M = vim.tbl_extend("force", M, config.overrides.colors or {})

return M
