<!-- SPDX-License-Identifier: LGPL-3.0-only -->
# Moonlight

Canonical: <https://codeberg.org/jthvai/lavender.nvim><br />
Mirror: <https://forge.jthv.ai/elias/lavender.nvim>

Purple-hued dark mode colorscheme for [Neovim](https://neovim.io/).

Palette inspired by [atomiks/moonlight-vscode-theme](https://github.com/atomiks/moonlight-vscode-theme); a complete
rewrite of [shaunsingh/moonlight.nvim](https://github.com/shaunsingh/moonlight.nvim), which is no longer maintained.

## Features

<!-- TODO: -->

## Requirements

- [Neovim](https://neovim.io/) >= [0.9.2](https://github.com/neovim/neovim/releases/tag/v0.9.2)

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
  borders     = true, -- render the border between vertical splits
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
| `#a1abe0` ![swatch](https://placehold.co/1/a1abe0/a1abe0) | `#add8e6` ![swatch](https://placehold.co/1/add8e6/add8e6) |
| `#a3ace1` ![swatch](https://placehold.co/1/a3ace1/a3ace1) | `#80cbc4` ![swatch](https://placehold.co/1/80cbc4/80cbc4) |
| `#d6e7f0` ![swatch](https://placehold.co/1/d6e7f0/d6e7f0) | `#2df4c0` ![swatch](https://placehold.co/1/2df4c0/2df4c0) |
| `#e4f3fa` ![swatch](https://placehold.co/1/e4f3fa/e4f3fa) | `#04d1f9` ![swatch](https://placehold.co/1/04d1f9/04d1f9) |
| `#eeffff` ![swatch](https://placehold.co/1/eeffff/eeffff) | `#5cb4fc` ![swatch](https://placehold.co/1/5cb4fc/5cb4fc) |

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
