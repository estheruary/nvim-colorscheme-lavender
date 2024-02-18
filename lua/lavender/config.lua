-- SPDX-License-Identifier: LGPL-3.0-only
---@mod lavender.config plugin configuration

---@class (exact) LavenderOpts
---@field transparent? LavenderTransparentOpts
---@field contrast? boolean colour the sidebar and floating windows differently to the main background
---@field italic? LavenderItalicOpts
---@field overrides? LavenderOverrides

---@class (exact) LavenderTransparentOpts
---@field background? boolean do not render the main background
---@field float? boolean do not render the background in floating windows
---@field popup? boolean do not render the background in popup menus
---@field sidebar? boolean do not render the background in sidebars

---@class (exact) LavenderItalicOpts
---@field comments? boolean italic comments
---@field functions? boolean italic function names
---@field keywords? boolean italic keywords
---@field variables? boolean italic variables

---@class (exact) LavenderOverrides
---@field theme? Highlights highlight group overrides - see theme.lua
---@field colors? LavenderColorOverrides

---@class (exact) LavenderColorOverrides
---@field cterm? ANSIPalette cterm colour overrides - see colors/cterm.lua
---@field hex? Palette hex (true) colour overrides - see colors/hex.lua

---@type LavenderOpts
local M = {
  transparent = {
    background = false,
    float      = false,
    popup      = false,
    sidebar    = false,
  },
  contrast    = true,

  italic      = {
    comments  = true,
    functions = false,
    keywords  = true,
    variables = false,
  },

  overrides = {
    theme  = {},
    colors = {
      cterm = {},
      hex = {},
    },
  },
}

-- Merge user-defined config
-- FIX: need to validate config!!
M = vim.tbl_deep_extend("force", M, vim.g.lavender or {})

return M
