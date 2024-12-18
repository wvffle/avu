--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--


local lush = require('lush')
local hsl = lush.hsl

local colors = {
  white = hsl('#FFFFFF'),
  black = hsl('#000000'),

  -- Ayu dark colors from https://github.com/Shatur/neovim-ayu/blob/2839c88cd297a069e93df1aab542c087e8f6e8c0/lua/ayu/colors.lua#L52-L91
  accent = hsl('#E6B450'),
  bg = hsl('#0B0E14'),
  fg = hsl('#BFBDB6'),
  ui = hsl('#565B66'),

  tag = hsl('#39BAE6'),
  func = hsl('#FFB454'),
  entity = hsl('#59C2FF'),
  string = hsl('#AAD94C'),
  regexp = hsl('#95E6CB'),
  markup = hsl('#F07178'),
  keyword = hsl('#FF8F40'),
  special = hsl('#E6B673'),
  comment = hsl('#636A72'),
  constant = hsl('#D2A6FF'),
  operator = hsl('#F29668'),
  error = hsl('#D95757'),
  lsp_parameter = hsl('#CB9FF8'),

  line = hsl('#11151C'),
  panel_bg = hsl('#0F131A'),
  panel_shadow = hsl('#05070A'),
  panel_border = hsl('#000000'),
  gutter_normal = hsl('#454B55'),
  gutter_active = hsl('#626975'),
  guide_active = hsl('#3C414A'),
  guide_normal = hsl('#1E222A'),

  vcs_added = hsl('#7FD962'),
  vcs_modified = hsl('#73B8FF'),
  vcs_removed = hsl('#F26D78'),

  vcs_added_bg = hsl('#1D2214'),
  vcs_removed_bg = hsl('#2D2220'),

  fg_idle = hsl('#565B66'),
  warning = hsl('#FF8F40'),
}


colors.selection_bg = colors.bg
colors.selection_inactive = colors.panel_bg
colors.selection_border = colors.panel_border

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- Base.
    Normal { fg = colors.fg, bg = colors.bg },
    NormalFloat { bg = colors.bg },
    FloatBorder { fg = colors.comment },
    FloatTitle { fg = colors.fg },
    ColorColumn { bg = colors.line },
    Cursor { fg = colors.bg, bg = colors.fg },
    CursorColumn { bg = colors.line },
    CursorLine { bg = colors.line },
    CursorLineNr { fg = colors.accent, bg = colors.line, bold = true },

    -- LineNr { fg = colors.guide_normal },
    LineNrAbove { fg = colors.entity.mix(Normal.bg, 40) },
    LineNrBelow { fg = colors.func.mix(Normal.bg, 40) },

    Directory { fg = colors.func },
    ErrorMsg { fg = colors.error },
    WinSeparator { fg = colors.panel_border, bg = colors.bg },
    VertSplit { WinSeparator },
    Folded { fg = colors.fg_idle, bg = colors.panel_bg },
    FoldColumn { bg = colors.bg },
    SignColumn { bg = colors.bg },

    MatchParen { sp = colors.func, underline = true },
    ModeMsg { fg = colors.string },
    MoreMsg { fg = colors.string },
    NonText { fg = colors.guide_normal },
    Pmenu { fg = colors.fg, bg = colors.selection_inactive },
    PmenuSel { fg = colors.fg, bg = colors.selection_inactive, reverse = true },
    Question { fg = colors.string },
    Search { fg = colors.bg, bg = colors.constant },
    CurSearch { fg = colors.bg, bg = colors.special },
    IncSearch { fg = colors.keyword, bg = colors.selection_inactive },
    SpecialKey { fg = colors.selection_inactive },
    SpellCap { sp = colors.tag, undercurl = true },
    SpellLocal { sp = colors.keyword, undercurl = true },
    SpellBad { sp = colors.error, undercurl = true },
    SpellRare { sp = colors.regexp, undercurl = true },
    StatusLine { fg = colors.fg, bg = colors.panel_bg },
    StatusLineNC { fg = colors.fg_idle, bg = colors.panel_bg },
    WildMenu { fg = colors.fg, bg = colors.markup },
    TabLine { fg = colors.comment, bg = colors.panel_shadow },
    TabLineFill { fg = colors.fg, bg = colors.panel_border },
    TabLineSel { fg = colors.fg, bg = colors.bg },
    Title { fg = colors.keyword },
    Visual { CursorLine },
    WarningMsg { fg = colors.warning },

    Comment { fg = colors.comment, italic = true },
    Constant { fg = colors.constant },
    String { fg = colors.string },
    Identifier { fg = colors.entity },
    Function { fg = colors.func },
    Statement { fg = colors.keyword },
    Operator { fg = colors.operator },
    Exception { fg = colors.markup },
    PreProc { fg = colors.accent },
    Type { fg = colors.entity },
    Structure { fg = colors.special },
    Special { fg = colors.accent },
    Delimiter { fg = colors.special },
    Underlined { sp = colors.tag, underline = true },
    Ignore { fg = colors.fg },
    Error { fg = colors.white, bg = colors.error },
    Todo { fg = colors.markup },
    qfLineNr { fg = colors.keyword },
    qfError { fg = colors.error },
    Conceal { fg = colors.comment },
    CursorLineConceal { fg = colors.guide_normal, bg = colors.line },

    Added { fg = colors.vcs_added },
    Removed { fg = colors.vcs_removed },
    Changed { fg = colors.vcs_modified },
    DiffAdd { bg = colors.vcs_added_bg },
    DiffAdded { fg = colors.vcs_added },
    DiffDelete { bg = colors.vcs_removed_bg },
    DiffRemoved { fg = colors.vcs_removed },
    DiffText { bg = colors.gutter_normal },
    DiffChange { bg = colors.selection_inactive },

    -- LSP.
    DiagnosticError { fg = colors.error },
    DiagnosticWarn { fg = colors.keyword },
    DiagnosticInfo { fg = colors.tag },
    DiagnosticHint { fg = colors.regexp },

    DiagnosticUnderlineError { sp = colors.error, undercurl = true },
    DiagnosticUnderlineWarn { sp = colors.keyword, undercurl = true },
    DiagnosticUnderlineInfo { sp = colors.tag, undercurl = true },
    DiagnosticUnderlineHint { sp = colors.regexp, undercurl = true },

    -- Markdown.
    markdownCode { fg = colors.special },

    -- TreeSitter.
    sym'@property' { fg = colors.tag },
    sym'@tag' { fg = colors.keyword },
    sym'@tag.attribute' { fg = colors.entity },
    sym'@tag.delimiter' { Delimiter },
    sym'@type.qualifier' { fg = colors.keyword },
    sym'@variable' { fg = colors.fg },
    sym'@variable.builtin' { fg = colors.func },
    sym'@variable.member' { fg = colors.tag },
    sym'@variable.parameter' { fg = colors.fg },
    sym'@module' { fg = colors.func },
    sym'@markup.heading' { fg = colors.keyword },
    sym'@keyword.storage' { fg = colors.keyword },

    sym'@lsp.type.namespace' { sym'@module' },
    -- sym'@lsp.type.type' { sym'@type' },
    -- sym'@lsp.type.class' { sym'@type' },
    -- sym'@lsp.type.enum' { sym'@type' },
    -- sym'@lsp.type.interface' { sym'@type' },
    -- sym'@lsp.type.struct' { sym'@variable.member' },
    -- sym'@lsp.type.field' { sym'@variable.member' },
    sym'@lsp.type.parameter' { fg = colors.lsp_parameter },
    sym'@lsp.type.variable' { sym'@variable' },
    -- sym'@lsp.type.property' { sym'@property' },
    -- sym'@lsp.type.enumMember' { sym'@constant' },
    -- sym'@lsp.type.function' { sym'@function' },
    -- sym'@lsp.type.method' { sym'@function.method' },
    -- sym'@lsp.type.macro' { sym'@function.macro' },
    -- sym'@lsp.type.decorator' { sym'@function' },
    -- sym'@lsp.mod.constant' { sym'@constant' },

    -- TreesitterContext.
    TreesitterContext { bg = colors.selection_inactive },

    -- Telescope.
    TelescopePromptBorder { fg = colors.accent },

    -- BlinkCmp.
    BlinkCmpMenu { Pmenu },
    BlinkCmpMenuSelection { fg = BlinkCmpMenu.bg, bg = colors.accent },
    BlinkCmpScrollBarGutter { bg = BlinkCmpMenu.bg.lighten(2) },
    BlinkCmpScrollBarThumb { bg = BlinkCmpMenu.bg.lighten(10) },
    BlinkCmpLabelMatch { fg = colors.entity },

    BlinkCmpKindText { fg = colors.string },
    BlinkCmpKindMethod { fg = colors.keyword },
    BlinkCmpKindFunction { fg = colors.func },
    BlinkCmpKindConstructor { fg = colors.keyword },
    BlinkCmpKindField { fg = colors.entity },
    BlinkCmpKindVariable { fg = colors.tag },
    BlinkCmpKindClass { fg = colors.entity },
    BlinkCmpKindInterface { fg = colors.entity },
    BlinkCmpKindModule { fg = colors.keyword },
    BlinkCmpKindProperty { fg = colors.keyword },
    BlinkCmpKindUnit { fg = colors.constant },
    BlinkCmpKindValue { fg = colors.constant },
    BlinkCmpKindEnum { fg = colors.entity },
    BlinkCmpKindKeyword { fg = colors.keyword },
    BlinkCmpKindSnippet { fg = colors.regexp },
    BlinkCmpKindColor { fg = colors.special },
    BlinkCmpKindFile { fg = colors.special },
    BlinkCmpKindReference { fg = colors.special },
    BlinkCmpKindFolder { fg = colors.special },
    BlinkCmpKindEnumMember { fg = colors.constant },
    BlinkCmpKindConstant { fg = colors.constant },
    BlinkCmpKindStruct { fg = colors.entity },
    BlinkCmpKindEvent { fg = colors.tag },
    BlinkCmpKindOperator { fg = colors.operator },
    BlinkCmpKindTypeParameter { fg = colors.tag },

    -- Cmp.
    CmpItemAbbrMatch { fg = colors.keyword },
    CmpItemAbbrMatchFuzzy { fg = colors.func },
    CmpItemKindText { BlinkCmpKindText },
    CmpItemKindMethod { BlinkCmpKindMethod },
    CmpItemKindFunction { BlinkCmpKindFunction },
    CmpItemKindConstructor { BlinkCmpKindConstructor },
    CmpItemKindField { BlinkCmpKindField },
    CmpItemKindVariable { BlinkCmpKindVariable },
    CmpItemKindClass { BlinkCmpKindClass },
    CmpItemKindInterface { BlinkCmpKindInterface },
    CmpItemKindModule { BlinkCmpKindModule },
    CmpItemKindProperty { BlinkCmpKindProperty },
    CmpItemKindUnit { BlinkCmpKindUnit },
    CmpItemKindValue { BlinkCmpKindValue },
    CmpItemKindEnum { BlinkCmpKindEnum },
    CmpItemKindKeyword { BlinkCmpKindKeyword },
    CmpItemKindSnippet { BlinkCmpKindSnippet },
    CmpItemKindColor { BlinkCmpKindColor },
    CmpItemKindFile { BlinkCmpKindFile },
    CmpItemKindReference { BlinkCmpKindReference },
    CmpItemKindFolder { BlinkCmpKindFolder },
    CmpItemKindEnumMember { BlinkCmpKindEnumMember },
    CmpItemKindConstant { BlinkCmpKindConstant },
    CmpItemKindStruct { BlinkCmpKindStruct },
    CmpItemKindEvent { BlinkCmpKindEvent },
    CmpItemKindOperator { BlinkCmpKindOperator },
    CmpItemKindTypeParameter { BlinkCmpKindTypeParameter },
    CmpItemMenu { fg = colors.comment },

    -- Word under cursor.
    CursorWord { bg = Normal.bg.lighten(7) },
    CursorWord0 { CursorWord },
    CursorWord1 { CursorWord },

    -- Noice
    NoiceLspProgressTitle { fg = colors.fg },
    NoiceLspProgressClient { fg = colors.special },

    -- NvimTree.
    NvimTreeGitDirty { fg = colors.accent },
    NvimTreeGitStaged { fg = colors.vcs_modified },
    NvimTreeGitMerge { fg = colors.error },
    NvimTreeGitNew { fg = colors.vcs_added },
    NvimTreeGitDeleted { fg = colors.vcs_removed },

    NvimTreeFolderName { fg = colors.special },
    NvimTreeFolderIcon { fg = colors.accent },
    NvimTreeOpenedFolderName { fg = colors.special },
    NvimTreeRootFolder { fg = colors.keyword },
    NvimTreeSpecialFile { fg = colors.fg },
    NvimTreeExecFile { fg = colors.fg },
    NvimTreeIndentMarker { fg = colors.guide_normal },

    NvimTreeWindowPicker { fg = colors.keyword, bg = colors.panel_border, bold = true },

    -- Neo-tree.
    NeoTreeRootName { fg = colors.fg, bold = true },
    NeoTreeGitConflict { fg = colors.warning, italic = false, bold = true },
    NeoTreeGitUnstaged { fg = colors.accent, italic = false },
    NeoTreeGitUntracked { fg = colors.comment, italic = false },

    -- WhichKey.
    WhichKeyFloat { bg = colors.bg },

    -- Indent blankline.
    IndentBlanklineContextChar { fg = colors.comment },

    -- Neogit.
    NeogitDiffContextHighlight { bg = colors.line },
    NeogitHunkHeader { fg = colors.tag },
    NeogitHunkHeaderHighlight { fg = colors.tag, bg = colors.line },
    NeogitDiffAddHighlight { bg = colors.vcs_added_bg },
    NeogitDiffDeleteHighlight { bg = colors.vcs_removed_bg },

    -- Hop.
    HopNextKey { fg = colors.keyword, bold = true, underline = true },
    HopNextKey1 { fg = colors.entity, bold = true, underline = true },
    HopNextKey2 { fg = colors.tag },
    HopUnmatched { fg = colors.comment },

    -- Leap.
    LeapBackdrop { Comment },
    LeapMatch { fg = colors.regexp, underline = true },
    LeapLabelPrimary { fg = colors.bg, bg = colors.regexp },
    LeapLabelSecondary { fg = colors.bg, bg = colors.entity },
    LeapLabelSelected { fg = colors.bg, bg = colors.tag },

    -- LSP Signature.
    LspSignatureActiveParameter { italic = true },

    -- Notify.
    NotifyERROR { fg = colors.vcs_removed },
    NotifyWARN { fg = colors.func },
    NotifyINFO { fg = colors.vcs_added },
    NotifyDEBUG { fg = colors.comment },
    NotifyTRACE { fg = colors.vcs_modified },
    NotifyERRORTitle { fg = colors.error },
    NotifyWARNTitle { fg = colors.warning },
    NotifyINFOTitle { fg = colors.string },
    NotifyDEBUGTitle { fg = colors.ui },
    NotifyTRACETitle { fg = colors.entity },

    -- Dap.
    NvimDapVirtualText { fg = colors.regexp },

    -- DAP UI.
    DapUIScope { fg = colors.func },
    DapUIType { fg = colors.entity },
    DapUIDecoration { fg = colors.tag },
    DapUIThread { fg = colors.string },
    DapUIStoppedThread { fg = colors.special },
    DapUISource { fg = colors.regexp },
    DapUILineNumber { fg = colors.constant },
    DapUIFloatBorder { fg = colors.panel_border },
    DapUIWatchesEmpty { fg = colors.warning },
    DapUIWatchesValue { fg = colors.string },
    DapUIWatchesError { fg = colors.error },
    DapUIBreakpointsPath { fg = colors.regexp },
    DapUIBreakpointsInfo { fg = colors.constant },
    DapUIBreakpointsCurrentLine { fg = colors.constant, bold = true },

    -- Visual Multi.
    VM_Extend { bg = colors.selection_inactive },
    VM_Cursor { bg = colors.selection_inactive, sp = colors.fg, underline = true },
    VM_Insert { sp = colors.fg, underline = true },
    VM_Mono { fg = colors.bg, bg = colors.comment },

    -- Mini.
    MiniFilesTitleFocused { fg = colors.fg, bold = true },
    MiniHipatternsFixme { fg = colors.bg, bg = colors.error, bold = true },
    MiniHipatternsHack { fg = colors.bg, bg = colors.keyword, bold = true },
    MiniHipatternsTodo { fg = colors.bg, bg = colors.tag, bold = true },
    MiniHipatternsNote { fg = colors.bg, bg = colors.regexp, bold = true },
    MiniIconsAzure { fg = colors.tag },
    MiniIconsBlue { fg = colors.entity },
    MiniIconsCyan { fg = colors.regexp },
    MiniIconsGreen { fg = colors.string },
    MiniIconsGrey { fg = colors.fg },
    MiniIconsOrange { fg = colors.keyword },
    MiniIconsPurple { fg = colors.lsp_parameter },
    MiniIconsRed { fg = colors.error },
    MiniIconsYellow { fg = colors.special },
    MiniIndentscopeSymbol { fg = colors.comment },
    MiniIndentscopeSymbolOff { fg = colors.keyword },
    MiniJump { sp = colors.keyword, undercurl = true },
    MiniJump2dDim { fg = colors.comment, nocombine = true },
    MiniJump2dSpot { fg = colors.keyword, bold = true, underline = true, nocombine = true },
    MiniJump2dSpotAhead { fg = colors.entity, underline = true, nocombine = true },
    MiniJump2dSpotUnique { fg = colors.tag, bold = true, underline = true, nocombine = true },
    MiniStarterItemPrefix { fg = colors.accent },
    MiniStarterFooter { Comment },
    MiniStatuslineDevinfo { fg = colors.accent, bg = colors.panel_bg },
    MiniStatuslineFileinfo { fg = colors.fg, bg = colors.panel_bg },
    MiniStatuslineFilename { fg = colors.fg_idle, bg = colors.panel_bg },
    MiniStatuslineInactive { fg = colors.fg_idle, bg = colors.panel_bg },
    MiniStatuslineModeCommand { fg = colors.bg, bg = colors.keyword, bold = true },
    MiniStatuslineModeInsert { fg = colors.bg, bg = colors.string, bold = true },
    MiniStatuslineModeNormal { fg = colors.bg, bg = colors.entity, bold = true },
    MiniStatuslineModeOther { fg = colors.bg, bg = colors.entity, bold = true },
    MiniStatuslineModeReplace { fg = colors.bg, bg = colors.markup, bold = true },
    MiniStatuslineModeVisual { fg = colors.bg, bg = colors.accent, bold = true },
    MiniTablineCurrent { fg = colors.fg, bg = colors.bg, bold = true },
    MiniTablineFill { fg = colors.fg, bg = colors.panel_bg },
    MiniTablineHidden { fg = colors.comment, bg = colors.panel_shadow },
    MiniTablineModifiedCurrent { fg = colors.bg, bg = colors.fg, bold = true },
    MiniTablineModifiedHidden { fg = colors.panel_shadow, bg = colors.comment },
    MiniTablineModifiedVisible { fg = colors.bg, bg = colors.fg },
    MiniTablineVisible { fg = colors.fg, bg = colors.bg },
    MiniTestFail { fg = colors.error, bold = true },
    MiniTestPass { fg = colors.string, bold = true },
    MiniTrailspace { bg = colors.vcs_removed },

    -- Modicator.
    NormalMode { fg = colors.entity, bold = true },
    InsertMode { fg = colors.string, bold = true },
    VisualMode { fg = colors.accent, bold = true },
    ReplaceMode { fg = colors.markup, bold = true },
    CommandMode { fg = colors.keyword, bold = true },
    TerminalNormalMode { NormalMode },
    TerminalMode { TerminalNormalMode },
    SelectMode { fg = colors.regexp, bold = true },

    -- Snacks.
    SnacksIndentScope { fg = VisualMode.fg.mix(Normal.bg, 40) },
    SnacksIndentScope1 { fg = VisualMode.fg.mix(Normal.bg, 40) },
    SnacksIndentScope2 { fg = NormalMode.fg.mix(Normal.bg, 40) },
    SnacksIndentScope3 { fg = InsertMode.fg.mix(Normal.bg, 40) },
    SnacksIndentScope4 { fg = ReplaceMode.fg.mix(Normal.bg, 40) },
    SnacksIndentScope5 { fg = CommandMode.fg.mix(Normal.bg, 40) },
}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
