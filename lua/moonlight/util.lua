-- SPDX-License-Identifier: LGPL-3.0-only
---@mod moonlight.util utility functions

local M = {}

---Load main theme highlights (tokyonight.util.syntax)
---@param theme Highlights moonlight.theme
function M.apply_theme(theme)
  -- TODO: map fg,bg to ctermfg,ctermbg
  for group, hl in pairs(theme) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

---Load terminal colours (tokyonight.util.terminal)
---@param c Palette moonlight.colors
function M.hl_terminal(c)
  -- terminfo(5)
  vim.g.terminal_color_0  = c.black
  vim.g.terminal_color_8  = c.gray

  vim.g.terminal_color_1  = c.red
  vim.g.terminal_color_9  = c.red

  vim.g.terminal_color_2  = c.green
  vim.g.terminal_color_10 = c.green

  vim.g.terminal_color_3  = c.yellow
  vim.g.terminal_color_11 = c.yellow

  vim.g.terminal_color_4  = c.blue
  vim.g.terminal_color_12 = c.blue

  vim.g.terminal_color_5  = c.purple
  vim.g.terminal_color_13 = c.purple

  vim.g.terminal_color_6  = c.cyan
  vim.g.terminal_color_14 = c.cyan

  vim.g.terminal_color_7  = c.white
  vim.g.terminal_color_15 = c.white
end

---Define autocommands
function M.autocmds()
  local group = vim.api.nvim_create_augroup("moonlight", { clear = true })

  -- Clear autocommands when loading a colorscheme
  -- (mostly useful when loading other colorschemes)
  vim.api.nvim_create_autocmd("ColorSchemePre", {
    group = group,
    callback = function() vim.api.nvim_del_augroup_by_id(group) end,
  })

  -- Window local backgrounds
  -- TODO: does this even look good?
  local alt_hl = { "Normal:NormalFloat", "SignColumn:NormalFloat" }
  vim.api.nvim_create_autocmd("TermOpen", {
    group = group,
    callback = function() vim.wo.winhighlight = alt_hl end
  })
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { "packer", "qf" },
    callback = function() vim.wo.winhighlight = alt_hl end
  })
end

return M
