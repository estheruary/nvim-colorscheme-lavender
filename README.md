<!-- SPDX-License-Identifier: LGPL-3.0-only -->
# Lavender

Canonical: <https://codeberg.org/jthvai/lavender.nvim><br />
Mirror: <https://forge.jthv.ai/elias/lavender.nvim>

Purple-hued dark mode colorscheme for [Neovim](https://neovim.io/).

Palette inspired by [atomiks/moonlight-vscode-theme](https://github.com/atomiks/moonlight-vscode-theme); a complete
rewrite of [shaunsingh/moonlight.nvim](https://github.com/shaunsingh/moonlight.nvim), which is no longer maintained.

## Features

Support is provided for each item from the listed version to the next breaking change, as well as whatever is
backwards compatible from that verion.

- [Neovim](https://neovim.io/) `0.9.5` (including LSP client)
  - markdown regex parser
  <!-- - asciidoc regex parser -->
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) `main@8e1df60b`
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

If something is wrong (particularly if highlights are missing[^4]) with one of these, please [submit an
issue](https://codeberg.org/jthvai/lavender.nvim/issues).

Several popular plugins are also supported. See [theme.lua](lua/lavender/theme.lua) (about midway through) for details.

In general, I am not too keen on providing tailored support for plugins that I use[^3], as I'm unlikely to notice if
something breaks or looks bad. **But!** It is really easy to extend this colorscheme - see [Examples](#examples) below.

[^3]: [my plugins, and their config](https://forge.jthv.ai/elias/nvim-config/src/branch/main/lua/plugins/README.md)
[^4]: use `:Inspect` with your cursor over an element to inspect the syntax tokens

## Requirements

- Neovim >= 0.9.2

_Julia is **not** a runtime dependency._

## Installation

[lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  url = "https://codeberg.org/jthvai/lavender.nvim",
  branch = "stable",
  lazy = false,
  priority = 1000,
}
```

## Usage

```vim
" Vimscript
colorscheme lavender
```

```lua
-- Lua
vim.cmd "colorscheme lavender"
```

## Configuration

**WARNING**: Do not call `require("lavender").setup()` — it does not exist, and is not used to configure this
plugin[^1].

Add `vim.g.lavender` to `init.lua` or wherever else global variables may be set in lua[^2], _e.g._ lazy.nvim's `config`
function. Do this before calling `:colorscheme lavender`.

```lua
-- Default config in lua
vim.g.lavender = {
  transparent = {
    background = false, -- do not render the main background
    float      = false, -- do not render the background in floating windows
    popup      = false, -- do not render the background in popup menus
    sidebar    = false, -- do not render the background in sidebars
  },
  contrast    = true, -- colour the sidebar and floating windows differently to the main background

  italic      = {
    comments  = true, -- italic comments
    functions = true, -- italic function names
    keywords  = false, -- italic keywords
    variables = false, -- italic variables
  },

  -- new values will be merged in
  overrides = {
    -- highlight groups - see theme.lua
    -- existing groups will be entirely replaced
    theme = {},

    colors = {
      cterm = {}, -- cterm colours - see colors/cterm.lua
      hex = {}, -- hex (true) colours - see colors/hex.lua
    },
  },
}
```

Custom hex colours are not mapped to 256-color on the fly for performance reasons.

[^1]: I took [advice](https://mrcjkb.dev/posts/2023-08-22-setup.html) on config design from
      [@mrcjkb](https://github.com/mrcjkb), developer of
      [haskell-tools.nvim](https://github.com/mrcjkb/haskell-tools.nvim).
[^2]: You could _probably_ do it in vimscript if you really wanted to, but I don't know how and certainly couldn't tell
      you.

### Examples

```lua
vim.g.lavender = {
  overrides = {
    theme = {
      NormalFoo = { fg = "fg", bg = "purple3", bold = true }, -- add a new highlight group using lavender's colours
      NormalBar = { fg = "Red", bg = "#303030", ctermfg = 196, ctermbg = 236 }, -- using colours directly
      NormalBaz = { fg = "custom_red", ctermfg = "custom_blue" }, -- using colours added in colour overrides below
      -- lavender's colours are lowercase, while nvim's internal colour names are pascal case

      Normal = { fg = "white", bg = "bg_alt", ctermfg = "white", ctermbg = "bg_alt" }, -- override a highlight group
      -- overriding existing highlight groups will replace the entire definition
    },
    colors = {
      hex = {
        custom_red = "#ff3300", -- add a new colour; this can now be used in any highlight group
      },
      cterm = {
        custom_blue = 33,
      },
    },
  },
}
```

## Palette

| <!-- -->                                                  | <!-- -->                                                  |
| ---                                                       | ---                                                       |
| `#000000` ![swatch](https://placehold.co/1/000000/000000) | `#b4a4f4` ![swatch](https://placehold.co/1/b4a4f4/b4a4f4) |
| `#1b1c2b` ![swatch](https://placehold.co/1/1b1c2b/1b1c2b) | `#b994f1` ![swatch](https://placehold.co/1/b994f1/b994f1) |
| `#1b1e2b` ![swatch](https://placehold.co/1/1b1e2b/1b1e2b) | `#ad82ed` ![swatch](https://placehold.co/1/ad82ed/ad82ed) |
| `#212337` ![swatch](https://placehold.co/1/212337/212337) | `#ecb2f0` ![swatch](https://placehold.co/1/ecb2f0/ecb2f0) |
| `#403c64` ![swatch](https://placehold.co/1/403c64/403c64) | `#f77eae` ![swatch](https://placehold.co/1/f77eae/f77eae) |
| `#414863` ![swatch](https://placehold.co/1/414863/414863) | `#ff5370` ![swatch](https://placehold.co/1/ff5370/ff5370) |
| `#515772` ![swatch](https://placehold.co/1/515772/515772) | `#ff757f` ![swatch](https://placehold.co/1/ff757f/ff757f) |
| `#596399` ![swatch](https://placehold.co/1/596399/596399) | `#f67f81` ![swatch](https://placehold.co/1/f67f81/f67f81) |
| `#7486d6` ![swatch](https://placehold.co/1/7486d6/7486d6) | `#ff9e7b` ![swatch](https://placehold.co/1/ff9e7b/ff9e7b) |
| `#757dac` ![swatch](https://placehold.co/1/757dac/757dac) | `#ffc777` ![swatch](https://placehold.co/1/ffc777/ffc777) |
| `#a19bb5` ![swatch](https://placehold.co/1/a19bb5/a19bb5) | `#add8e6` ![swatch](https://placehold.co/1/add8e6/add8e6) |
| `#a1abe0` ![swatch](https://placehold.co/1/a1abe0/a1abe0) | `#80cbc4` ![swatch](https://placehold.co/1/80cbc4/80cbc4) |
| `#a3ace1` ![swatch](https://placehold.co/1/a3ace1/a3ace1) | `#59d6b5` ![swatch](https://placehold.co/1/59d6b5/59d6b5) |
| `#d6e7f0` ![swatch](https://placehold.co/1/d6e7f0/d6e7f0) | `#2df4c0` ![swatch](https://placehold.co/1/2df4c0/2df4c0) |
| `#e4f3fa` ![swatch](https://placehold.co/1/e4f3fa/e4f3fa) | `#04d1f9` ![swatch](https://placehold.co/1/04d1f9/04d1f9) |
| `#eeffff` ![swatch](https://placehold.co/1/eeffff/eeffff) | `#5fafff` ![swatch](https://placehold.co/1/5fafff/5fafff) |                                                           |

## License

Copyright 2024 Elias Elwyn <a@jthv.ai>, [GNU LGPL v3.0 only](./LICENSE).

```txt
This program is free software: you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License, version 3 only, as
published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License
for more details.

You should have received a copy of the GNU Lesser General Public License
along with this program. If not, see <https://www.gnu.org/licenses/>.
```

### Acknowledgements

- [atomiks/moonlight-vscode-theme](https://github.com/atomiks/moonlight-vscode-theme) for the aesthetic,
  [MIT License](https://github.com/atomiks/moonlight-vscode-theme/blob/master/LICENSE)
- [shaunsingh/moonlight.nvim](https://github.com/shaunsingh/moonlight.nvim) for the initial Neovim port of Moonlight,
  [GNU GPL v2.0](https://github.com/shaunsingh/moonlight.nvim/blob/pure-lua/LICENSE)
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) for the up-to-date highlight groups and plugin
  structure, [Apache License, Version 2.0](https://github.com/folke/tokyonight.nvim/blob/main/LICENSE)
