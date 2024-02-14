# SPDX-License-Identifier: LGPL-3.0-only
module HexToCterm

using Colors
using FixedPointNumbers
import TOML as T

const hexf   = "../../lua/moonlight/colors/hex.lua"
const ctermf = "../../lua/moonlight/colors/cterm.lua"

const HexRGB = RGB{N0f8}

const ansi::Dict{String,HexRGB} =
  (function()
    d = Dict{String,HexRGB}()
    for (k, v) ∈ (pairs ∘ (T.parsefile))("ansi_rgb.toml")
      d[k] = parse(HexRGB, "#$v")
    end
    return d
  end)()

const theme::Dict{String,HexRGB} =
  (function()
    d = Dict{String,HexRGB}()
    started = false

    for l ∈ readlines(hexf)
      occursin(r"^ *-- HexToCterm: END$", l) && return d
      if !started
        occursin(r"^ *-- HexToCterm: START$", l) && (started = true)
        continue
      end

      m = match(r"^ +(?<name>\S+) += \"#(?<hex>[A-Za-z0-9]{3,8})\",", l)
      m === nothing && continue
      d[m[:name]] = parse(HexRGB, "#" * m[:hex])
    end
  end)()

_find_closest(name::AbstractString)::String =
  reduce((x, y) -> colordiff(theme[name], ansi[x]) ≤
                   colordiff(theme[name], ansi[y]) ? x : y,
               keys(ansi))

function convert()
  started = false
  doc = ""

  for l ∈ readlines(ctermf; keep=true)
    occursin(r"^ *-- HexToCterm: END$", l) && (started = false)
    if !started
      occursin(r"^ *-- HexToCterm: START$", l) && (started = true)
      doc *= l
      continue
    end

    m = match(r"^(?<head> +)(?<name>\S+) = \d{1,3},$", l)
    if m === nothing
      doc *= l
      continue
    end

    doc *= m[:head] * m[:name] * " = " * _find_closest(m[:name]) * ",\n"
  end

  open(ctermf, "w") do f
    write(f, doc)
  end
end

end # module HexToCterm
