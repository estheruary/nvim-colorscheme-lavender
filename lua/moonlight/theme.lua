-- SPDX-License-Identifier: LGPL-3.0-only
---@mod moonlight.theme highlight definitions

-- renovate: tokyonight@610179f7f12db3d08540b6cc61434db2eaecbcff

---@type Palette
local c = require("moonlight.colors")
---@type MoonlightOpts
local config = require("moonlight.config")

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
local M = {
  Foo = {},

  Comment = {}, -- any comment
  ColorColumn = {}, -- used for the columns set with 'colorcolumn'
  Conceal = {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
  Cursor = {}, -- character under the cursor
  lCursor = {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
  CursorIM = {}, -- like Cursor, but used when in IME mode |CursorIM|
  CursorColumn = {}, -- Screen-column at the cursor, when 'cursorcolumn' is set.
  CursorLine = {}, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
  Directory = {}, -- directory names (and other special names in listings)
  DiffAdd = { bg = c.green }, -- diff mode: Added line |diff.txt|
  DiffChange = { bg = c.yellow }, -- diff mode: Changed line |diff.txt|
  DiffDelete = { bg = c.red }, -- diff mode: Deleted line |diff.txt|
  DiffText = { bg = c.selection }, -- diff mode: Changed text within a changed line |diff.txt|
  EndOfBuffer = {}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
  -- TermCursor = {}, -- cursor in a focused terminal
  -- TermCursorNC = {}, -- cursor in an unfocused terminal
  ErrorMsg = {}, -- error messages on the command line
  VertSplit = {}, -- the column separating vertically split windows
  WinSeparator = {}, -- the column separating vertically split windows
  Folded = {}, -- line used for closed folds
  FoldColumn = {}, -- 'foldcolumn'
  SignColumn = {}, -- column where |signs| are displayed
  SignColumnSB = {}, -- column where |signs| are displayed
  Substitute = {}, -- |:substitute| replacement text highlighting
  LineNr = {}, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  CursorLineNr = {}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
  MatchParen = {}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
  ModeMsg = {}, -- 'showmode' message (e.g., "-- INSERT -- ")
  MsgArea = {}, -- Area for messages and cmdline
  -- MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
  MoreMsg = {}, -- |more-prompt|
  NonText = {}, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
  Normal = {}, -- normal text
  NormalNC = {}, -- normal text in non-current windows
  NormalSB = {}, -- normal text in sidebar
  NormalFloat = {}, -- Normal text in floating windows.
  FloatBorder = {},
  FloatTitle = {},
  Pmenu = {}, -- Popup menu: normal item.
  PmenuSel = {}, -- Popup menu: selected item.
  PmenuSbar = {}, -- Popup menu: scrollbar.
  PmenuThumb = {}, -- Popup menu: Thumb of the scrollbar.
  Question = {}, -- |hit-enter| prompt and yes/no questions
  QuickFixLine = {}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
  Search = {}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
  IncSearch = {}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
  CurSearch = { link = "IncSearch" },
  SpecialKey = {}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
  SpellBad = {}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
  SpellCap = {}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
  SpellLocal = {}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
  SpellRare = {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
  StatusLine = {}, -- status line of current window
  StatusLineNC = {}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
  TabLine = {}, -- tab pages line, not active tab page label
  TabLineFill = {}, -- tab pages line, where there are no labels
  TabLineSel = {}, -- tab pages line, active tab page label
  Title = {}, -- titles for output from ":set all", ":autocmd" etc.
  Visual = {}, -- Visual mode selection
  VisualNOS = {}, -- Visual mode selection when vim is "Not Owning the Selection".
  WarningMsg = {}, -- warning messages
  Whitespace = {}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
  WildMenu = {}, -- current match in 'wildmenu' completion
  WinBar = { link = "StatusLine" }, -- window bar
  WinBarNC = { link = "StatusLineNC" }, -- window bar in inactive windows


  -- These groups are not listed as default vim groups,
  -- but they are defacto standard group names for syntax highlighting.
  -- commented out groups should chain up to their "preferred" group by
  -- default,
  -- Uncomment and edit if you want more specific syntax highlighting.

  Constant = {}, -- (preferred) any constant
  String = {}, -- a string constant: "this is a string"
  Character = {}, -- a character constant: 'c', '\n'
  -- Number = {}, -- a number constant: 234, 0xff
  -- Boolean = {}, -- a boolean constant: TRUE, false
  -- Float = {}, -- a floating point constant: 2.3e10

  Identifier = {}, -- (preferred) any variable name
  Function = {}, -- function name (also: methods for classes)

  Statement = {}, -- (preferred) any statement
  -- Conditional = {}, -- if, then, else, endif, switch, etc.
  -- Repeat = {}, -- for, do, while, etc.
  -- Label = {}, -- case, default, etc.
  Operator = {}, -- "sizeof", "+", "*", etc.
  Keyword = {}, -- any other keyword
  -- Exception = {}, -- try, catch, throw

  PreProc = {}, -- (preferred) generic Preprocessor
  -- Include = {}, -- preprocessor #include
  -- Define = {}, -- preprocessor #define
  -- Macro = {}, -- same as Define
  -- PreCondit = {}, -- preprocessor #if, #else, #endif, etc.

  Type = {}, -- (preferred) int, long, char, etc.
  -- StorageClass = {}, -- static, register, volatile, etc.
  -- Structure = {}, -- struct, union, enum, etc.
  -- Typedef = {}, -- A typedef

  Special = {}, -- (preferred) any special symbol
  -- SpecialChar = {}, -- special character in a constant
  -- Tag = {}, -- you can use CTRL-] on this
  -- Delimiter = {}, -- character that needs attention
  -- SpecialComment = {}, -- special things inside a comment
  Debug = { fg = c.orange }, -- debugging statements

  Underlined = {}, -- (preferred) text that stands out, HTML links
  Bold = {},
  Italic = {},

  -- ("Ignore", below, may be invisible...)
  -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

  Error = {}, -- (preferred) any erroneous construct
  Todo = {}, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

  qfLineNr = {},
  qfFileName = {},

  htmlH1 = {},
  htmlH2 = {},

  -- mkdHeading = {},
  -- mkdCode = {},
  mkdCodeDelimiter = {},
  mkdCodeStart = {},
  mkdCodeEnd = {},
  -- mkdLink = {},

  markdownHeadingDelimiter = {},
  markdownCode = {},
  markdownCodeBlock = {},
  markdownH1 = {},
  markdownH2 = {},
  markdownLinkText = {},

  ["helpCommand"] = {},

  debugPC = {}, -- used for highlighting the current line in terminal-debug
  debugBreakpoint = {}, -- used for breakpoint colors in terminal-debug

  dosIniLabel = { link = "@property" },

  -- These groups are for the native LSP client. Some other LSP clients may
  -- use these groups, or use their own. Consult your LSP client's
  -- documentation.
  LspReferenceText = {}, -- used for highlighting "text" references
  LspReferenceRead = {}, -- used for highlighting "read" references
  LspReferenceWrite = {}, -- used for highlighting "write" references

  DiagnosticError = { fg = c.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
  DiagnosticWarn = { fg = c.yellow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
  DiagnosticInfo = { fg = c.paleblue }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
  DiagnosticHint = { fg = c.purple }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
  DiagnosticUnnecessary = {}, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

  DiagnosticVirtualTextError = { link = "DiagnosticError" }, -- Used for "Error" diagnostic virtual text
  DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" }, -- Used for "Warning" diagnostic virtual text
  DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" }, -- Used for "Information" diagnostic virtual text
  DiagnosticVirtualTextHint = { link = "DiagnosticHint" }, -- Used for "Hint" diagnostic virtual text

  DiagnosticUnderlineError = { fg = c.error, undercurl = true }, -- Used to underline "Error" diagnostics
  DiagnosticUnderlineWarn = { fg = c.yellow, undercurl = true }, -- Used to underline "Warning" diagnostics
  DiagnosticUnderlineInfo = { fg = c.paleblue, undercurl = true }, -- Used to underline "Information" diagnostics
  DiagnosticUnderlineHint = { fg = c.purple, undercurl = true }, -- Used to underline "Hint" diagnostics

  LspSignatureActiveParameter = {},
  LspCodeLens = {},
  LspInlayHint = {},

  LspInfoBorder = {},

  ALEErrorSign = {},
  ALEWarningSign = {},

  DapStoppedLine = {}, -- Used for "Warning" diagnostic virtual text

  -- These groups are for the Neovim tree-sitter highlights.
  -- TODO: link like tokyonight or manually dictate like moonlight?
  ["@annotation"] = {},
  ["@attribute"] = {},
  ["@boolean"] = {},
  ["@character"] = {},
  ["@character.special"] = {},
  ["@comment"] = {},
  ["@keyword.conditional"] = {},
  ["@constant"] = {},
  ["@constant.builtin"] = {},
  ["@constant.macro"] = {},
  ["@keyword.debug"] = {},
  ["@keyword.directive.define"] = {},
  ["@keyword.exception"] = {},
  ["@number.float"] = {},
  ["@function"] = {},
  ["@function.builtin"] = {},
  ["@function.call"] = {},
  ["@function.macro"] = {},
  ["@keyword.import"] = {},
  ["@keyword.coroutine"] = {},
  ["@keyword.operator"] = {},
  ["@keyword.return"] = {},
  ["@function.method"] = {},
  ["@function.method.call"] = {},
  ["@namespace.builtin"] = {},
  ["@none"] = {},
  ["@number"] = {},
  ["@keyword.directive"] = {},
  ["@keyword.repeat"] = {},
  ["@keyword.storage"] = {},
  ["@string"] = {},
  ["@markup.link.label"] = {},
  ["@markup.link.label.symbol"] = {},
  ["@tag"] = {},
  ["@tag.attribute"] = {},
  ["@tag.delimiter"] = {},
  ["@markup"] = {},
  ["@markup.environment"] = {},
  ["@markup.environment.name"] = {},
  ["@markup.raw"] = {},
  ["@markup.math"] = {},
  ["@markup.strong"] = {},
  ["@markup.emphasis"] = {},
  ["@markup.strikethrough"] = {},
  ["@markup.underline"] = {},
  ["@markup.heading"] = {},
  ["@comment.note"] = {},
  ["@comment.error"] = {},
  ["@comment.hint"] = {},
  ["@comment.info"] = {},
  ["@comment.warning"] = {},
  ["@comment.todo"] = {},
  ["@markup.link.url"] = {},
  ["@type"] = {},
  ["@type.definition"] = {},
  ["@type.qualifier"] = {},

  --- Misc
  -- TODO:
  -- ["@comment.documentation"] = {},
  ["@operator"] = {}, -- For any operator: `+`, but also `->` and `*` in C.

  --- Punctuation
  ["@punctuation.delimiter"] = {}, -- For delimiters ie: `.`
  ["@punctuation.bracket"] = {}, -- For brackets and parens.
  ["@punctuation.special"] = {}, -- For special symbols (e.g. `{}` in string interpolation)
  ["@markup.list"] = {}, -- For special punctutation that does not fall in the catagories before.
  ["@markup.list.markdown"] = {},

  --- Literals
  ["@string.documentation"] = {},
  ["@string.regexp"] = {}, -- For regexes.
  ["@string.escape"] = {}, -- For escape characters within a string.

  --- Functions
  ["@constructor"] = {}, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
  ["@variable.parameter"] = {}, -- For parameters of a function.
  ["@variable.parameter.builtin"] = {}, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

  --- Keywords
  ["@keyword"] = {}, -- For keywords that don't fall in previous categories.
  ["@keyword.function"] = {}, -- For keywords used to define a fuction.

  ["@label"] = {}, -- For labels: `label:` in C and `:label:` in Lua.

  --- Types
  ["@type.builtin"] = {},
  ["@variable.member"] = {}, -- For fields.
  ["@property"] = {},

  --- Identifiers
  ["@variable"] = {}, -- Any variable name that does not have another highlight.
  ["@variable.builtin"] = {}, -- Variable names that are defined by the languages, like `this` or `self`.
  ["@module.builtin"] = {}, -- Variable names that are defined by the languages, like `this` or `self`.

  --- Text
  -- ["@markup.raw.markdown"] = {},
  ["@markup.raw.markdown_inline"] = {},
  ["@markup.link"] = {},

  ["@markup.list.unchecked"] = {}, -- For brackets and parens.
  ["@markup.list.checked"] = {}, -- For brackets and parens.

  ["@diff.plus"] = { link = "DiffAdd" },
  ["@diff.minus"] = { link = "DiffDelete" },
  ["@diff.delta"] = { link = "DiffChange" },

  ["@module"] = { link = "Include" },

  -- tsx
  ["@tag.tsx"] = {},
  ["@constructor.tsx"] = {},
  ["@tag.delimiter.tsx"] = {},

  -- LSP Semantic Token Groups
  ["@lsp.type.boolean"] = { link = "@boolean" },
  ["@lsp.type.builtinType"] = { link = "@type.builtin" },
  ["@lsp.type.comment"] = { link = "@comment" },
  ["@lsp.type.decorator"] = { link = "@attribute" },
  ["@lsp.type.deriveHelper"] = { link = "@attribute" },
  ["@lsp.type.enum"] = { link = "@type" },
  ["@lsp.type.enumMember"] = { link = "@constant" },
  ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
  ["@lsp.type.formatSpecifier"] = { link = "@markup.list" },
  ["@lsp.type.generic"] = { link = "@variable" },
  ["@lsp.type.interface"] = {},
  ["@lsp.type.keyword"] = { link = "@keyword" },
  ["@lsp.type.lifetime"] = { link = "@keyword.storage" },
  ["@lsp.type.namespace"] = { link = "@module" },
  ["@lsp.type.number"] = { link = "@number" },
  ["@lsp.type.operator"] = { link = "@operator" },
  ["@lsp.type.parameter"] = { link = "@variable.parameter" },
  ["@lsp.type.property"] = { link = "@property" },
  ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
  ["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
  ["@lsp.type.string"] = { link = "@string" },
  ["@lsp.type.typeAlias"] = { link = "@type.definition" },
  ["@lsp.type.unresolvedReference"] = {},
  ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
  ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
  ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
  ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
  ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
  ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
  ["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
  ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
  ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
  ["@lsp.typemod.operator.injected"] = { link = "@operator" },
  ["@lsp.typemod.string.injected"] = { link = "@string" },
  ["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
  ["@lsp.typemod.type.defaultLibrary"] = {},
  ["@lsp.typemod.typeAlias.defaultLibrary"] = {},
  ["@lsp.typemod.variable.callable"] = { link = "@function" },
  ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
  ["@lsp.typemod.variable.injected"] = { link = "@variable" },
  ["@lsp.typemod.variable.static"] = { link = "@constant" },
  -- NOTE: maybe add these with distinct highlights?
  -- ["@lsp.typemod.variable.globalScope"] (global variables)

  -- ts-rainbow
  -- rainbowcol1 = {},
  -- rainbowcol2 = {},
  -- rainbowcol3 = {},
  -- rainbowcol4 = {},
  -- rainbowcol5 = {},
  -- rainbowcol6 = {},
  -- rainbowcol7 = {},

  -- ts-rainbow2 (maintained fork)
  -- TSRainbowRed = {},
  -- TSRainbowOrange = {},
  -- TSRainbowYellow = {},
  -- TSRainbowGreen = {},
  -- TSRainbowBlue = {},
  -- TSRainbowViolet = {},
  -- TSRainbowCyan = {},

  -- rainbow-delimiters
  -- RainbowDelimiterRed = {},
  -- RainbowDelimiterOrange = {},
  -- RainbowDelimiterYellow = {},
  -- RainbowDelimiterGreen = {},
  -- RainbowDelimiterBlue = {},
  -- RainbowDelimiterViolet = {},
  -- RainbowDelimiterCyan = {},

  -- LspTrouble
  TroubleText = { fg = c.text },
  TroubleCount = { fg = c.purple, bg = c.active },
  TroubleNormal = { fg = c.fg, bg = c.sidebar },

  -- Illuminate
  illuminatedWord = {},
  illuminatedCurWord = {},
  IlluminatedWordText = {},
  IlluminatedWordRead = {},
  IlluminatedWordWrite = {},

  -- diff
  diffAdded = { fg = c.green },
  diffRemoved = { fg = c.red },
  diffChanged = { fg = c.yellow },
  diffOldFile = { fg = c.yelow },
  diffNewFile = { fg = c.orange },
  diffFile = { fg = c.blue },
  diffLine = { fg = c.comments },
  diffIndexLine = { fg = c.purple },

  -- Neogit
  NeogitBranch = {},
  NeogitRemote = {},
  NeogitHunkHeader = {},
  NeogitHunkHeaderHighlight = {},
  NeogitDiffContextHighlight = {},
  NeogitDiffDeleteHighlight = { link = "diffRemoved" },
  NeogitDiffAddHighlight = { link = "diffAdded" },

  -- Neotest
  NeotestPassed = {},
  NeotestRunning = {},
  NeotestFailed = {},
  NeotestSkipped = {},
  NeotestTest = {},
  NeotestNamespace = {},
  NeotestFocused = {},
  NeotestFile = {},
  NeotestDir = {},
  NeotestBorder = {},
  NeotestIndent = {},
  NeotestExpandMarker = {},
  NeotestAdapterName = {},
  NeotestWinSelect = {},
  NeotestMarked = {},
  NeotestTarget = {},
  --[[ NeotestUnknown = {}, ]]

  -- GitGutter
  GitGutterAdd = { link = "diffAdded" }, -- diff mode: Added line |diff.txt|
  GitGutterChange = { link = "diffChanged" }, -- diff mode: Changed line |diff.txt|
  GitGutterDelete = { link = "diffRemoved" }, -- diff mode: Deleted line |diff.txt|
  GitGutterAddLineNr = { link = "diffAdded" },
  GitGutterChangeLineNr = { link = "diffChanged" },
  GitGutterDeleteLineNr = { link = "diffRemoved" },

  -- GitSigns
  GitSignsAdd = { link = "diffAdded" }, -- diff mode: Added line |diff.txt|
  GitSignsChange = { link = "diffChanged" }, -- diff mode: Changed line |diff.txt|
  GitSignsDelete = { link = "diffRemoved" }, -- diff mode: Deleted line |diff.txt|

  -- Telescope
  TelescopeBorder = {},
  TelescopeNormal = {},

  -- NvimTree
  NvimTreeNormal = {},
  NvimTreeWinSeparator = {},
  NvimTreeNormalNC = {},
  NvimTreeRootFolder = {},
  NvimTreeGitDirty = { link = "diffChanged" },
  NvimTreeGitNew = { link = "diffAdded" },
  NvimTreeGitDeleted = { link = "diffDeleted" },
  NvimTreeOpenedFile = {},
  NvimTreeSpecialFile = {},
  NvimTreeIndentMarker = {},
  NvimTreeImageFile = {},
  NvimTreeSymlink = {},
  NvimTreeFolderIcon = {},
  -- NvimTreeFolderName= {},

  NeoTreeNormal = {},
  NeoTreeNormalNC = {},
  NeoTreeDimText = {},

  -- Fern
  FernBranchText = {},

  -- glyph palette
  -- GlyphPalette1 = {},
  -- GlyphPalette2 = {},
  -- GlyphPalette3 = {},
  -- GlyphPalette4 = {},
  -- GlyphPalette6 = {},
  -- GlyphPalette7 = {},
  -- GlyphPalette9 = {},

  -- Dashboard
  DashboardShortCut = {},
  DashboardHeader = {},
  DashboardCenter = {},
  DashboardFooter = {},
  DashboardKey = {},
  DashboardDesc = {},
  DashboardIcon = {},

  -- Alpha
  AlphaShortcut = {},
  AlphaHeader = {},
  AlphaHeaderLabel = {},
  AlphaFooter = {},
  AlphaButtons = {},

  -- WhichKey
  WhichKey = {},
  WhichKeyGroup = {},
  WhichKeyDesc = {},
  WhichKeySeperator = {},
  WhichKeySeparator = {},
  WhichKeyFloat = {},
  WhichKeyValue = {},

  -- LspSaga
  DiagnosticWarning = { link = "DiagnosticWarn" },
  DiagnosticInformation = { link = "DiagnosticInfo" },

  LspFloatWinNormal = {},
  LspFloatWinBorder = {},
  LspSagaBorderTitle = {},
  LspSagaHoverBorder = {},
  LspSagaRenameBorder = {},
  LspSagaDefPreviewBorder = {},
  LspSagaCodeActionBorder = {},
  LspSagaFinderSelection = {},
  LspSagaCodeActionTitle = {},
  LspSagaCodeActionContent = {},
  LspSagaSignatureHelpBorder = {},
  ReferencesCount = {},
  DefinitionCount = {},
  DefinitionIcon = {},
  ReferencesIcon = {},
  TargetWord = {},

  -- NeoVim
  healthError = { link = "DiagnosticError" },
  healthSuccess = { fg = c.green },
  healthWarning = { link = "DiagnosticWarn" },

  -- BufferLine
  BufferLineIndicatorSelected = {},

  -- Barbar
  BufferCurrent = {},
  BufferCurrentERROR = {},
  BufferCurrentHINT = {},
  -- BufferCurrentIcon = {},
  BufferCurrentINFO = {},
  BufferCurrentWARN = {},
  BufferCurrentIndex = {},
  BufferCurrentMod = {},
  BufferCurrentSign = {},
  BufferCurrentTarget = {},
  BufferAlternate = {},
  BufferAlternateERROR = {},
  BufferAlternateHINT = {},
  -- BufferAlternateIcon = {},
  BufferAlternateIndex = {},
  BufferAlternateINFO = {},
  BufferAlternateMod = {},
  BufferAlternateSign = {},
  BufferAlternateTarget = {},
  BufferAlternateWARN = {},
  BufferVisible = {},
  BufferVisibleERROR = {},
  BufferVisibleHINT = {},
  -- BufferVisibleIcon = {},
  BufferVisibleINFO = {},
  BufferVisibleWARN = {},
  BufferVisibleIndex = {},
  BufferVisibleMod = {},
  BufferVisibleSign = {},
  BufferVisibleTarget = {},
  BufferInactive = {},
  BufferInactiveERROR = {},
  BufferInactiveHINT = {},
  -- BufferInactiveIcon = {},
  BufferInactiveINFO = {},
  BufferInactiveWARN = {},
  BufferInactiveIndex = {},
  BufferInactiveMod = {},
  BufferInactiveSign = {},
  BufferInactiveTarget = {},
  BufferOffset = {},
  BufferTabpageFill = {},
  BufferTabpages = {},

  -- Sneak
  Sneak = {},
  SneakScope = {},

  -- Hop
  HopNextKey = {},
  HopNextKey1 = {},
  HopNextKey2 = {},
  HopUnmatched = {},

  TSNodeKey = {},
  TSNodeUnmatched = {},

  LeapMatch = {},
  LeapLabelPrimary = {},
  LeapLabelSecondary = {},
  LeapBackdrop = {},

  FlashBackdrop = {},
  FlashLabel = {},

  LightspeedGreyWash = {},
  -- LightspeedCursor = { link = "Cursor" },
  LightspeedLabel = {},
  LightspeedLabelDistant = {},
  LightspeedLabelDistantOverlapped = {},
  LightspeedLabelOverlapped = {},
  LightspeedMaskedChar = {},
  LightspeedOneCharMatch = {},
  LightspeedPendingOpArea = {},
  LightspeedShortcut = {},
  -- LightspeedShortcutOverlapped = { link = "LightspeedShortcut" },
  -- LightspeedUniqueChar = { link = "LightspeedUnlabeledMatch" },
  LightspeedUnlabeledMatch = {},

  -- Cmp
  CmpDocumentation = {},
  CmpDocumentationBorder = {},
  CmpGhostText = {},

  CmpItemAbbr = {},
  CmpItemAbbrDeprecated = {},
  CmpItemAbbrMatch = {},
  CmpItemAbbrMatchFuzzy = {},

  CmpItemMenu = {},

  CmpItemKindDefault = {},

  CmpItemKindCodeium = {},
  CmpItemKindCopilot = {},
  CmpItemKindTabNine = {},

  -- headlines.nvim
  CodeBlock = {},

  -- navic
  NavicSeparator = {},
  NavicText = {},

  AerialNormal = {},
  AerialGuide = {},
  AerialLine = { link = "LspInlayHint" },

  IndentBlanklineChar = {},
  IndentBlanklineContextChar = {},
  IblIndent = {},
  IblScope = {},

  -- Scrollbar
  ScrollbarHandle = {},

  ScrollbarSearchHandle = {},
  ScrollbarSearch = {},

  ScrollbarErrorHandle = {},
  ScrollbarError = {},

  ScrollbarWarnHandle = {},
  ScrollbarWarn = {},

  ScrollbarInfoHandle = {},
  ScrollbarInfo = {},

  ScrollbarHintHandle = {},
  ScrollbarHint = {},

  ScrollbarMiscHandle = {},
  ScrollbarMisc = {},

  -- Yanky
  YankyPut = { link = "IncSearch" },
  YankyYanked = { link = "IncSearch" },

  -- Lazy
  LazyProgressDone = {},
  LazyProgressTodo = {},

  -- Notify
  NotifyBackground = {},
  --- Border
  NotifyERRORBorder = {},
  NotifyWARNBorder = {},
  NotifyINFOBorder = {},
  NotifyDEBUGBorder = {},
  NotifyTRACEBorder = {},
  --- Icons
  NotifyERRORIcon = {},
  NotifyWARNIcon = {},
  NotifyINFOIcon = {},
  NotifyDEBUGIcon = {},
  NotifyTRACEIcon = {},
  --- Title
  NotifyERRORTitle = {},
  NotifyWARNTitle = {},
  NotifyINFOTitle = {},
  NotifyDEBUGTitle = {},
  NotifyTRACETitle = {},
  --- Body
  NotifyERRORBody = {},
  NotifyWARNBody = {},
  NotifyINFOBody = {},
  NotifyDEBUGBody = {},
  NotifyTRACEBody = {},

  -- Mini
  MiniCompletionActiveParameter = {},

  MiniCursorword = {},
  MiniCursorwordCurrent = {},

  MiniIndentscopeSymbol = {},
  MiniIndentscopePrefix = {}, -- Make it invisible

  MiniJump = {},

  MiniJump2dSpot = {},

  MiniStarterCurrent = {},
  MiniStarterFooter = {},
  MiniStarterHeader = {},
  MiniStarterInactive = {},
  MiniStarterItem = {},
  MiniStarterItemBullet = {},
  MiniStarterItemPrefix = {},
  MiniStarterSection = {},
  MiniStarterQuery = {},

  MiniStatuslineDevinfo = {},
  MiniStatuslineFileinfo = {},
  MiniStatuslineFilename = {},
  MiniStatuslineInactive = {},
  MiniStatuslineModeCommand = {},
  MiniStatuslineModeInsert = {},
  MiniStatuslineModeNormal = {},
  MiniStatuslineModeOther = {},
  MiniStatuslineModeReplace = {},
  MiniStatuslineModeVisual = {},

  MiniSurround = {},

  MiniTablineCurrent = {},
  MiniTablineFill = {},
  MiniTablineHidden = {},
  MiniTablineModifiedCurrent = {},
  MiniTablineModifiedHidden = {},
  MiniTablineModifiedVisible = {},
  MiniTablineTabpagesection = {},
  MiniTablineVisible = {},

  MiniTestEmphasis = {},
  MiniTestFail = {},
  MiniTestPass = {},

  MiniTrailspace = {},

  -- Noice
  NoiceCompletionItemKindDefault = {},

  TreesitterContext = {},
  Hlargs = {},
}

-- lsp symbol kind and completion kind highlights
local kinds = {
  Array = "@punctuation.bracket",
  Boolean = "@boolean",
  Class = "@type",
  Color = "Special",
  Constant = "@constant",
  Constructor = "@constructor",
  Enum = "@lsp.type.enum",
  EnumMember = "@lsp.type.enumMember",
  Event = "Special",
  Field = "@variable.member",
  File = "Normal",
  Folder = "Directory",
  Function = "@function",
  Interface = "@lsp.type.interface",
  Key = "@variable.member",
  Keyword = "@lsp.type.keyword",
  Method = "@function.method",
  Module = "@module",
  Namespace = "@module",
  Null = "@constant.builtin",
  Number = "@number",
  Object = "@constant",
  Operator = "@operator",
  Package = "@module",
  Property = "@property",
  Reference = "@markup.link",
  Snippet = "Conceal",
  String = "@string",
  Struct = "@lsp.type.struct",
  Unit = "@lsp.type.struct",
  Text = "@markup",
  TypeParameter = "@lsp.type.typeParameter",
  Variable = "@variable",
  Value = "@string",
}
local kind_groups = {
  "NavicIcons%s",
  "Aerial%sIcon",
  "CmpItemKind%s",
  "NoiceCompletionItemKind%s"
}
for kind, link in pairs(kinds) do
  local base = "LspKind" .. kind
  M[base] = { link = link }
  for _, plugin in pairs(kind_groups) do
    M[plugin:format(kind)] = { link = base }
  end
end

---@type string[]
-- local h_rainbow = { c.blue, c.yellow, c.green, c.teal, c.magenta, c.purple }
-- for i, color in ipairs(h_rainbow) do
--   M["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
--   M["Headline" .. i] = { bg = util.darken(color, 0.05) }
-- end
-- M["Headline"] = { link = "Headline1" }

-- diagnostic group links
if not vim.diagnostic then
  local severity_map = {
    Error = "Error",
    Warn = "Warning",
    Info = "Information",
    Hint = "Hint",
  }
  local types = { "Default", "VirtualText", "Underline" }

  for _, type in ipairs(types) do
    for snew, sold in pairs(severity_map) do
      M["LspDiagnostics" .. type .. sold] = {
        link = "Diagnostic" .. (type == "Default" and "" or type) .. snew,
      }
    end
  end
end

-- Merge user-defined config
M = vim.tbl_extend("force", M, config.overrides.colors or {})

return M
