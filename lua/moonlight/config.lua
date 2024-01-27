-- SPDX-License-Identifier: LGPL-3.0-only
---@mod moonlight.config plugin configuration

---@class (exact) MoonlightOpts
---@field background? boolean render the background colour
---@field borders? boolean render the border between vertical splits
---@field contrast? boolean colour the sidebar and floating windows differently to the main background
---@field italic? MoonlightItalicOpts

---@class (exact) MoonlightItalicOpts
---@field comments? boolean italic comments
---@field functions? boolean italic function names
---@field keywords? boolean italic keywords
---@field variables? boolean italic variables

---@type MoonlightOpts
local M = {
  background = true,
  borders    = false,
  contrast   = true,
  italic     = {
    comments  = false,
    functions = false,
    keywords  = false,
    variables = false,
  },
}

-- Apply user-defined config
M = vim.tbl_deep_extend("keep", vim.g.moonlight or {}, M)

return M
