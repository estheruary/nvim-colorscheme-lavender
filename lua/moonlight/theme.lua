-- SPDX-License-Identifier: LGPL-3.0-only
---@mod moonlight.theme highlight definitions

---:help nvim_set_hl
---@class (exact) Highlight
---@field fg? string foreground
---@field bg? string background
---@field sp? string background
---@field blend? integer between 0 and 100
---@field bold? boolean
---@field standout? boolean
---@field underline? boolean
---@field undercurl? boolean
---@field underdouble? boolean
---@field underdotted? boolean
---@field underdashed? boolean
---@field strikethrough? boolean
---@field italic? boolean
---@field reverse? boolean
---@field nocombine? boolean
---@field link? string another highlight group to link to :help highlight-link
---@field default? boolean :help highlight-default
---@field ctermfg? integer foreground of cterm color :help ctermfg
---@field ctermbg? integer background of cterm color :help ctermbg
---@field cterm? string cterm attribute map :help highlight-args
---@field force? boolean
-- For custom style overrides
--- field style? string | Highlight legacy/custom style overrides; cannot be passed to nvim_set_hl

---@alias Highlights table<string,Highlight>

---@type Highlights
local M = {}

return M
