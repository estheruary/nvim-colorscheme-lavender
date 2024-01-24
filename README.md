<!-- SPDX-License-Identifier: LGPL-3.0-only -->
# Moonlight

Canonical: <https://codeberg.org/jthvai/moonlight.nvim><br />
Mirror: <https://forge.jthv.ai/elias/moonlight.nvim>

Purple-hued dark mode colorscheme for [Neovim](https://neovim.io/).

Palette taken from [atomiks/moonlight-vscode-theme](https://github.com/atomiks/moonlight-vscode-theme); a complete
rewrite of [shaunsingh/moonlight.nvim](https://github.com/shaunsingh/moonlight.nvim), which is no longer maintained.

## Features

<!-- TODO: -->

## Requirements

<!-- FIX: Find the actual version requirement -->
- [Neovim](https://neovim.io/) >= [0.7.2](https://github.com/neovim/neovim/releases/tag/v0.7.2)

## Installation

**WARNING**: Conflicts with [shaunsingh/moonlight.nvim](https://github.com/shaunsingh/moonlight.nvim), as the names of
the colorschemes are the same.

[lazy.nvim](https://github.com/folke/lazy.nvim):
```lua
{
  url = "https://codeberg.org/jthvai/moonlight.nvim.git",
  branch = "stable",
  lazy = false,
  priority = 1000,
}
```

## Usage

```vim
" Vimscript
colorscheme moonlight
```

```lua
-- Lua
vim.cmd "colorscheme moonlight"
```

## Configuration

```lua
-- Default config in lua
vim.g.moonlight = {
  background = true,
  borders    = false,
  contrast   = true,
  italic = {
    comments  = false,
    functions = false,
    keywords  = false,
    variables = false,
  },
}
```

_I took [advice](https://mrcjkb.dev/posts/2023-08-22-setup.html) on config design from
[@mrcjkb](https://github.com/mrcjkb), developer of [haskell-tools.nvim](https://github.com/mrcjkb/haskell-tools.nvim)._

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

- [atomiks/moonlight-vscode-theme](https://github.com/atomiks/moonlight-vscode-theme) for the palette,
  [MIT License](https://github.com/atomiks/moonlight-vscode-theme/blob/master/LICENSE)
- [shaunsingh/moonlight.nvim](https://github.com/shaunsingh/moonlight.nvim) for the initial Neovim port,
  [GNU GPL v2.0](https://github.com/shaunsingh/moonlight.nvim/blob/pure-lua/LICENSE)
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) for the up-to-date highlight groups and plugin
  structure inspiration, [Apache License, Version 2.0](https://github.com/folke/tokyonight.nvim/blob/main/LICENSE)
