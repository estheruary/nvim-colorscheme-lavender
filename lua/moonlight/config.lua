-- SPDX-License-Identifier: LGPL-3.0-only
---@mod moonlight.config plugin configuration

---@class (exact) MoonlightOpts
---@field transparent? MoonlightTransparentOpts
---@field borders? boolean render the border between vertical splits
---@field contrast? boolean colour the sidebar and floating windows differently to the main background
---@field italic? MoonlightItalicOpts
---@field overrides? MoonlightOverrides

---@class (exact) MoonlightTransparentOpts
---@field background? boolean do not render the main background
---@field float? boolean do not render the background in floating windows
---@field popup? boolean do not render the background in popup menus
---@field sidebar? boolean do not render the background in sidebars

---@class (exact) MoonlightItalicOpts
---@field comments? boolean italic comments
---@field functions? boolean italic function names
---@field keywords? boolean italic keywords
---@field variables? boolean italic variables

---@class (exact) MoonlightOverrides
---@field theme? Highlights highlight group overrides - see theme.lua
---@field colors? MoonlightColorOverrides

---@class (exact) MoonlightColorOverrides
---@field cterm? ANSIPalette cterm colour overrides - see colors/cterm.lua
---@field hex? Palette hex (true) colour overrides - see colors/hex.lua

---@type MoonlightOpts
local M = {
  transparent = {
    background = false,
    float      = false,
    popup      = false,
    sidebar    = false,
  },
  borders     = true,
  contrast    = true,

  italic      = {
    comments  = true,
    functions = true,
    keywords  = false,
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
M = vim.tbl_deep_extend("force", M, vim.g.moonlight or {})

return M
