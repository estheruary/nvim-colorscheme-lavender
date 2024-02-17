-- SPDX-License-Identifier: LGPL-3.0-only
---@mod lavender.theme highlight definitions

---@type LavenderOpts
local config = require("lavender.config")

---:help nvim_set_hl
---@class (exact) Highlight
---@field fg? string foreground - name of a colour defined in lavender.colors.hex
---@field bg? string background - name of a colour as above
---@field sp? string special - name of a colour as above
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
---@field ctermfg? integer | string foreground of cterm color :help ctermfg
---@field ctermbg? integer | string background of cterm color :help ctermbg
---@field cterm? string cterm attribute map :help highlight-args
---@field force? boolean

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
  DiffAdd = { bg = "green" }, -- diff mode: Added line |diff.txt|
  DiffChange = { bg = "yellow" }, -- diff mode: Changed line |diff.txt|
  DiffDelete = { bg = "red" }, -- diff mode: Deleted line |diff.txt|
  DiffText = { bg = "selection" }, -- diff mode: Changed text within a changed line |diff.txt|
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
  SpellBad = { sp = "error", undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
  SpellCap = { sp = "blue", undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
  SpellLocal = { sp = "yellow", undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
  SpellRare = { sp = "purple", undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
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
  Delimiter = { link = "Special" }, -- character that needs attention
  -- SpecialComment = {}, -- special things inside a comment
  Debug = { fg = "red2" }, -- debugging statements

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

  DiagnosticError = { fg = "error" }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
  DiagnosticWarn = { fg = "yellow" }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
  DiagnosticInfo = { fg = "paleblue" }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
  DiagnosticHint = { fg = "purple" }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
  DiagnosticUnnecessary = {}, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

  DiagnosticVirtualTextError = { link = "DiagnosticError", italic = true }, -- Used for "Error" diagnostic virtual text
  DiagnosticVirtualTextWarn = { link = "DiagnosticWarn", italic = true }, -- Used for "Warning" diagnostic virtual text
  DiagnosticVirtualTextInfo = { link = "DiagnosticInfo", italic = true }, -- Used for "Information" diagnostic virtual text
  DiagnosticVirtualTextHint = { link = "DiagnosticHint", italic = true }, -- Used for "Hint" diagnostic virtual text

  DiagnosticUnderlineError = { fg = "error", undercurl = true }, -- Used to underline "Error" diagnostics
  DiagnosticUnderlineWarn = { fg = "yellow", undercurl = true }, -- Used to underline "Warning" diagnostics
  DiagnosticUnderlineInfo = { fg = "paleblue", undercurl = true }, -- Used to underline "Information" diagnostics
  DiagnosticUnderlineHint = { fg = "purple", undercurl = true }, -- Used to underline "Hint" diagnostics

  LspSignatureActiveParameter = {},
  LspCodeLens = {},
  LspInlayHint = {},

  LspInfoBorder = {},

  ALEErrorSign = {},
  ALEWarningSign = {},

  DapStoppedLine = {}, -- Used for "Warning" diagnostic virtual text

  -- These groups are for the Neovim tree-sitter highlights.
  ["@annotation"] = { link = "PreProc" },
  ["@attribute"] = { link = "PreProc" },
  ["@boolean"] = { link = "Boolean" },
  ["@character"] = { link = "Character" },
  ["@character.special"] = { link = "SpecialChar" },
  ["@comment"] = { link = "Comment" },
  ["@keyword.conditional"] = { link = "Conditional" },
  ["@constant"] = { link = "Constant" },
  ["@constant.builtin"] = { link = "Special" },
  ["@constant.macro"] = { link = "Define" },
  ["@keyword.debug"] = { link = "Debug" },
  ["@keyword.directive.define"] = { link = "Define" },
  ["@keyword.exception"] = { link = "Exception" },
  ["@number.float"] = { link = "Float" },
  ["@function"] = { link = "Function" },
  ["@function.builtin"] = { link = "Special" },
  ["@function.call"] = { link = "@function" },
  ["@function.macro"] = { link = "Macro" },
  ["@keyword.import"] = { link = "Include" },
  ["@keyword.coroutine"] = { link = "@keyword" },
  ["@keyword.operator"] = { link = "@operator" },
  ["@keyword.return"] = { link = "@keyword" },
  ["@function.method"] = { link = "Function" },
  ["@function.method.call"] = { link = "@function.method" },
  ["@namespace.builtin"] = { link = "@variable.builtin" },
  ["@none"] = {},
  ["@number"] = { link = "Number" },
  ["@keyword.directive"] = { link = "PreProc" },
  ["@keyword.repeat"] = { link = "Repeat" },
  ["@keyword.storage"] = { link = "StorageClass" },
  ["@string"] = { link = "String" },
  ["@markup.link.label"] = { link = "SpecialChar" },
  ["@markup.link.label.symbol"] = { link = "Identifier" },
  ["@tag"] = { link = "Label" },
  ["@tag.attribute"] = { link = "@property" },
  ["@tag.delimiter"] = { link = "Delimiter" },
  ["@markup"] = { link = "@none" },
  ["@markup.environment"] = { link = "Macro" },
  ["@markup.environment.name"] = { link = "Type" },
  ["@markup.raw"] = { link = "String" },
  ["@markup.math"] = { link = "Special" },
  ["@markup.strong"] = { bold = true },
  ["@markup.emphasis"] = { italic = true },
  ["@markup.strikethrough"] = { strikethrough = true },
  ["@markup.underline"] = { underline = true },
  ["@markup.heading"] = { link = "Title" },
  ["@comment.note"] = { link = "DiagnosticHint" },
  ["@comment.error"] = { link = "DiagnosticError" },
  ["@comment.hint"] = { link = "DiagnosticHint" },
  ["@comment.info"] = { link = "DiagnosticInfo" },
  ["@comment.warning"] = { link = "DiagnosticWarn" },
  ["@comment.todo"] = { fg = "lightblue" },
  ["@markup.link.url"] = { link = "Underlined" },
  ["@type"] = { link = "Type" },
  ["@type.definition"] = { link = "Typedef" },
  ["@type.qualifier"] = { link = "@keyword" },

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

  -- HiPhish/nvim-ts-rainbow2
  TSRainbowRed = { fg = "red" },
  TSRainbowOrange = { fg = "orange" },
  TSRainbowYellow = { fg = "yellow" },
  TSRainbowGreen = { fg = "green" },
  TSRainbowBlue = { fg = "blue" },
  TSRainbowViolet = { fg = "purple2" },
  TSRainbowCyan = { fg = "cyan" },

  -- HiPhish/rainbow-delimiters.nvim
  RainbowDelimiterRed = { link = "TSRainbowRed" },
  RainbowDelimiterOrange = { link = "TSRainbowOrange" },
  RainbowDelimiterYellow = { link = "TSRainbowYellow" },
  RainbowDelimiterGreen = { link = "TSRainbowGreen" },
  RainbowDelimiterBlue = { link = "TSRainbowBlue" },
  RainbowDelimiterViolet = { link = "TSRainbowViolet" },
  RainbowDelimiterCyan = { link = "TSRainbowCyan" },

  -- folke/trouble.nvim
  TroubleText = { fg = "text" },
  TroubleCount = { fg = "purple", bg = "active" },
  TroubleNormal = { fg = "fg", bg = "sidebar" },

  -- RRethy/vim-illuminate
  illuminatedWord = {},
  illuminatedCurWord = {},
  IlluminatedWordText = {},
  IlluminatedWordRead = {},
  IlluminatedWordWrite = {},

  -- diff
  diffAdded = { fg = "green" },
  diffRemoved = { fg = "red" },
  diffChanged = { fg = "yellow" },
  diffOldFile = { fg = "yelow" },
  diffNewFile = { fg = "red2" },
  diffFile = { fg = "blue" },
  diffLine = { fg = "comments" },
  diffIndexLine = { fg = "purple" },

  -- NeogitOrg/neogit
  NeogitBranch = {},
  NeogitRemote = {},
  NeogitHunkHeader = {},
  NeogitHunkHeaderHighlight = {},
  NeogitDiffContextHighlight = {},
  NeogitDiffDeleteHighlight = { link = "diffRemoved" },
  NeogitDiffAddHighlight = { link = "diffAdded" },

  -- nvim-neotest/neotest
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
  -- NeotestUnknown = {},

  -- airblade/vim-gitgutter
  GitGutterAdd = { link = "diffAdded" }, -- diff mode: Added line |diff.txt|
  GitGutterChange = { link = "diffChanged" }, -- diff mode: Changed line |diff.txt|
  GitGutterDelete = { link = "diffRemoved" }, -- diff mode: Deleted line |diff.txt|
  GitGutterAddLineNr = { link = "diffAdded" },
  GitGutterChangeLineNr = { link = "diffChanged" },
  GitGutterDeleteLineNr = { link = "diffRemoved" },

  -- lewis6991/gitsigns.nvim
  GitSignsAdd = { link = "diffAdded" }, -- diff mode: Added line |diff.txt|
  GitSignsChange = { link = "diffChanged" }, -- diff mode: Changed line |diff.txt|
  GitSignsDelete = { link = "diffRemoved" }, -- diff mode: Deleted line |diff.txt|

  -- nvim-telescope/telescope.nvim
  TelescopeNormal = { fg = "fg", bg = "float" },
  TelescopeBorder = { fg = "purple3" },
  TelescopePreviewBorder = { fg = "green" },
  TelescopeSelection = { fg = "purple" },
  TelescopeMatching = { fg = "purple3" },

  -- nvim-tree/nvim-tree.lua
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

  -- nvim-neo-tree/neo-tree.nvim
  NeoTreeNormal = {},
  NeoTreeNormalNC = {},
  NeoTreeDimText = {},

  -- lambdalisue/fern.vim
  FernBranchText = {},

  -- lambdalisue/glyph-palette.vim
  GlyphPalette1 = { fg = "red2" },
  GlyphPalette2 = { fg = "green" },
  GlyphPalette3 = { fg = "yellow" },
  GlyphPalette4 = { fg = "blue" },
  GlyphPalette6 = { fg = "cyan" },
  GlyphPalette7 = { fg = "fg" },
  GlyphPalette9 = { fg = "orange" },
  GlyphPaletteDirectory = { fg = "text" },

  -- nvimdev/dashboard-nvim
  DashboardShortCut = {},
  DashboardHeader = {},
  DashboardCenter = {},
  DashboardFooter = {},
  DashboardKey = {},
  DashboardDesc = {},
  DashboardIcon = {},

  -- goolord/alpha-nvim
  AlphaShortcut = {},
  AlphaHeader = {},
  AlphaHeaderLabel = {},
  AlphaFooter = {},
  AlphaButtons = {},

  -- folke/which-key.nvim
  WhichKey = { fg = "accent", bold = true },
  WhichKeyGroup = { fg = "text" },
  WhichKeyDesc = { fg = "blue", italic = true },
  WhichKeySeparator = { fg = "fg" },
  WhichKeyFloat = { bg = "float" },
  WhichKeyValue = { bg = "float" },

  -- nvimdev/lspsaga.nvim
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

  -- Neovim
  healthError = { link = "DiagnosticError" },
  healthSuccess = { fg = "green" },
  healthWarning = { link = "DiagnosticWarn" },

  -- akinsho/bufferline.nvim
  BufferLineIndicatorSelected = {},

  -- romgrk/barbar.nvim
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

  -- justinmk/vim-sneak
  Sneak = { fg = "bg", bg = "accent" },
  SneakScope = { bg = "selection" },

  -- smoka7/hop.nvim
  HopNextKey = {},
  HopNextKey1 = {},
  HopNextKey2 = {},
  HopUnmatched = {},

  -- mfussenegger/nvim-treehopper
  TSNodeKey = {},
  TSNodeUnmatched = {},

  -- ggandor/leap.nvim
  LeapMatch = {},
  LeapLabelPrimary = {},
  LeapLabelSecondary = {},
  LeapBackdrop = {},

  -- folke/flash.nvim
  FlashBackdrop = {},
  FlashLabel = {},

  -- ggandor/lightspeed.nvim
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

  -- hrsh7th/nvim-cmp
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

  -- lukas-reineke/headlines.nvim
  CodeBlock = {},

  -- SmiteshP/nvim-navic
  NavicSeparator = {},
  NavicText = {},

  -- stevearc/aerial.nvim
  AerialNormal = {},
  AerialGuide = {},
  AerialLine = { link = "LspInlayHint" },

  -- lukas-reineke/indent-blankline.nvim
  IblIndent = { link = "Whitespace" },
  IblWhitespace = { link = "Whitespace" },
  IblScope = { fg = "highlight" },

  -- petertriho/nvim-scrollbar
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

  -- gbprod/yanky.nvim
  YankyPut = { link = "IncSearch" },
  YankyYanked = { link = "IncSearch" },

  -- folke/lazy.nvim
  LazyProgressDone = {},
  LazyProgressTodo = {},

  -- rcarriga/nvim-notify
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

  -- echasnovski/mini.nvim
  -- mini.completion
  MiniCompletionActiveParameter = {},

  -- mini.cursorword
  MiniCursorword = {},
  MiniCursorwordCurrent = {},

  -- mini.indentscope
  MiniIndentscopeSymbol = {},
  MiniIndentscopePrefix = {}, -- Make it invisible

  -- mini.jump
  MiniJump = {},

  -- mini.jump2d
  MiniJump2dSpot = {},

  -- mini.starter
  MiniStarterCurrent = {},
  MiniStarterFooter = {},
  MiniStarterHeader = {},
  MiniStarterInactive = {},
  MiniStarterItem = {},
  MiniStarterItemBullet = {},
  MiniStarterItemPrefix = {},
  MiniStarterSection = {},
  MiniStarterQuery = {},

  -- mini.statusline
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

  -- mini.surround
  MiniSurround = {},

  -- mini.tabline
  MiniTablineCurrent = {},
  MiniTablineFill = {},
  MiniTablineHidden = {},
  MiniTablineModifiedCurrent = {},
  MiniTablineModifiedHidden = {},
  MiniTablineModifiedVisible = {},
  MiniTablineTabpagesection = {},
  MiniTablineVisible = {},

  -- mini.test
  MiniTestEmphasis = {},
  MiniTestFail = {},
  MiniTestPass = {},

  -- mini.trailspace
  MiniTrailspace = {},

  -- folke/noice.nvim
  NoiceCompletionItemKindDefault = {},

  -- nvim-treesitter/nvim-treesitter-context
  TreesitterContext = {},

  -- m-demare/hlargs.nvim
  Hlargs = {},

  -- nvim-lualine/lualine.nvim (custom)
  LualineNormalA = { fg = "bg", bg = "accent", bold = true },
  LualineNormalB = { fg = "title", bg = "border" },
  LualineNormalC = { fg = "fg", bg = "selection" },

  LualineInsertA = { fg = "bg", bg = "green", bold = true },
  LualineInsertB = { link = "LualineNormalB" },

  LualineVisualA = { fg = "bg", bg = "purple", bold = true },
  LualineVisualB = { link = "LualineNormalB" },

  LualineReplaceA = { fg = "bg", bg = "red", bold = true },
  LualineReplaceB = { link = "LualineNormalB" },

  LualineCommandA = { fg = "bg", bg = "yellow", bold = true },
  LualineCommandB = { link = "LualineNormalB" },

  LualineInactiveA = { fg = "disabled", bg = "bg", bold = true },
  LualineInactiveB = { fg = "disabled", bg = "bg" },
  LualineInactiveC = { fg = "disabled", bg = "selection" },
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
-- local h_rainbow = { "blue", "yellow", "green", "teal", "magenta", "purple" }
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

-- Apply user-defined config
-- if config.transparent.background then
-- if config.transparent.float then
-- if config.transparent.popup then
-- if config.transparent.sidebar then
-- if config.borders then
-- if config.contrast then
-- if config.italic.comments then
-- if config.italic.functions then
-- if config.italic.keywords then
-- if config.italic.variables then

-- Merge user-defined overrides
M = vim.tbl_extend("force", M, config.overrides.theme or {})

return M
