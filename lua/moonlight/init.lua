-- SPDX-License-Identifier: LGPL-3.0-only

---@type Highlights
local theme = require("moonlight.theme")
---@type table<string,function>
local util  = require("moonlight.util")

local M = {}

function M.load()
  -- Clear existing highlights only if a colorscheme has been set
  if vim.g.colors_name then
    vim.cmd("highlight clear")
    -- vim.cmd("syntax reset")
    -- if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
  end
  vim.o.termguicolors = true
  vim.o.background    = "dark"
  vim.g.colors_name   = "moonlight"

  -- Load terminal colours
  util.hl_terminal(theme)

  -- TODO: load main highlights; autocmds
  -- util.apply_theme(theme)
  -- util.autocmds()
end

return M
