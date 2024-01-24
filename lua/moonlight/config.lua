-- SPDX-License-Identifier: LGPL-3.0-only
---@mod moonlight.config plugin configuration

---@class MoonlightOpts
---@field background? boolean | nil
---@field borders? boolean | nil
---@field contrast? boolean | nil
---@field italic? MoonlightItalicOpts | nil

---@class MoonlightItalicOpts
---@field comments? boolean | nil
---@field functions? boolean | nil
---@field keywords? boolean | nil
---@field variables? boolean | nil

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
