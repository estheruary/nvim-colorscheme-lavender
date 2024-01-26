-- SPDX-License-Identifier: LGPL-3.0-only

---@type Highlights
local theme = require("moonlight.theme")
---@type table<string,function>
local util  = require("moonlight.util")

---@type table<string,function>
local M = {}

function M.load()
  -- Clear existing highlights only if a colorscheme has been set
  if vim.g.colors_name then vim.cmd("highlight clear") end
  vim.o.termguicolors = true
  vim.g.colors_name = "moonlight"

  -- Load terminal colours
  util.hl_terminal(theme)

  -- TODO:load main highlights; autocmds
end

return M
