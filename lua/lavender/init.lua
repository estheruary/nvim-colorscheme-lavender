-- SPDX-License-Identifier: LGPL-3.0-only

---@type Highlights
local theme     = require("lavender.theme")
---@type Palette
local hexcolors = require("lavender.colors.hex")
local util      = require("lavender.util")

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
  vim.g.colors_name   = "lavender"

  -- Load terminal colours
  util.hl_terminal(hexcolors)
  -- Load main highlights
  util.apply_theme(theme)
  -- Define autocommands
  util.autocmds()
end

return M
