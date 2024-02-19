-- SPDX-License-Identifier: LGPL-3.0-only
---@mod lavender.colors.hex colour definitions in hex

---@alias Palette table<string,string>

---@type LavenderOpts
local config = require("lavender.config")

-- https://en.wikipedia.org/wiki/X11_color_names
---@type Palette
local M = {
  -- HexToCterm: START
  black        = "#000000",
  lightblue    = "#add8e6", -- LightBlue
  paleblue     = "#d6e7f0",
  white        = "#eeffff",
  red          = "#ff757f",
  red2         = "#f67f81",
  orange       = "#ff9e7b",
  yellow       = "#ffc777",
  green2       = "#59d6b5",
  green        = "#2df4c0",
  cyan         = "#16fcf8",
  blue         = "#04d1f9",
  blue2        = "#5fafff",
  purple2      = "#ad82ed",
  purple3      = "#b994f1",
  purple       = "#b4a4f4",
  pink         = "#ecb2f0",
  pink2        = "#f77eae",

  bg           = "#212337",
  bg_alt       = "#1b1e2b",
  fg           = "#e4f3fa",
  text         = "#757dac",
  comments     = "#7486d6",
  selection    = "#403c64",
  contrast     = "#1b1c2b",
  border       = "#414863",
  line_numbers = "#596399",
  highlight    = "#a1abe0",
  disabled     = "#515772",
  cursor       = "#a19bb5",
  accent       = "#a3ace1",
  error        = "#ff5370",
  link         = "#80cbc4",
  -- HexToCterm: END
}

-- High(er) contrast backgrounds for sidebars and floating windows
if config.contrast then
  M.sidebar = M.bg_alt
  M.float   = M.bg_alt
else
  M.sidebar = M.bg
  M.float   = M.bg
end

-- Merge user-defined config
M = vim.tbl_extend("force", M, config.overrides.colors.hex or {})

return M
