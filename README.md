<!-- SPDX-License-Identifier: LGPL-3.0-only -->
# Moonlight

Canonical: <https://codeberg.org/jthvai/moonlight.nvim><br />
Mirror: <https://forge.jthv.ai/elias/moonlight.nvim>

<!-- ## Features -->

<!-- ## Requirements -->

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
