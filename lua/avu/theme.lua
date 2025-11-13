local lush = require('lush')
local colors = require('avu.colors')

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
    CursorLineNr { fg = colors.entity, bg = colors.line, bold = true },

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
    IncSearch { fg = colors.keyword, bg = colors.visual },
    SpecialKey { fg = colors.visual },
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
    Visual { bg = colors.visual },
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
    DiffChange { bg = colors.visual },

    -- Diffview.
    DiffviewDiffDelete { fg = colors.guide_normal },

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
    TreesitterContext { bg = colors.visual },

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
    CursorWord { bg = Normal.bg.lighten(10) },
    CursorWord0 { CursorWord },
    CursorWord1 { CursorWord },

    -- LuaSnip.
    LuasnipInsertNodePassive { CursorWord },

    -- Noice.
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

    -- LSP.
    LspInlayHint { fg = colors.lsp_inlay_hint  },
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
    DapBreakpoint { fg='#993939' },
    DapLogPoint { fg='#61afef' },
    DapStopped { fg='#98c379' },





    -- Visual Multi.
    VM_Extend { bg = colors.visual },
    VM_Cursor { bg = colors.visual, sp = colors.fg, underline = true },
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

    -- Modes.nvim.
    ModesInsert { bg = InsertMode.fg },
    ModesReplace { bg = ReplaceMode.fg },
    ModesDelete { ModesReplace },
    ModesChange { ModesDelete },
    ModesVisual { bg = VisualMode.fg },
    ModesSelect { ModesVisual },


    -- Snacks.
    SnacksIndentScope { fg = VisualMode.fg.mix(Normal.bg, 40) },

    SnacksPickerGitStatus { fg = colors.accent },
    SnacksPickerGitStatusAdded { fg = colors.vcs_added },
    SnacksPickerGitStatusDeleted { fg = colors.vcs_removed },
    SnacksPickerGitStatusIgnored { fg = colors.comment },
    SnacksPickerGitStatusUntracked { SnacksPickerGitStatusIgnored },
    SnacksPickerGitStatusStaged { fg = colors.vcs_modified },

    -- Avante.
    AvanteInlineHint { Comment },

    -- Render Markdown.
    RenderMarkdownH1 { fg = colors.vcs_added },
    RenderMarkdownH2 { fg = colors.tag },
    RenderMarkdownH3 { fg = colors.accent },
    RenderMarkdownH4 { fg = colors.keyword },
    RenderMarkdownH5 { fg = colors.markup },
    RenderMarkdownH6 { fg = colors.constant },

    RenderMarkdownH1Bg { bg = colors.line, fg = colors.vcs_added },
    RenderMarkdownH2Bg { bg = colors.line, fg = colors.string },
    RenderMarkdownH3Bg { bg = colors.line, fg = colors.accent },
    RenderMarkdownH4Bg { bg = colors.line, fg = colors.keyword },
    RenderMarkdownH5Bg { bg = colors.line, fg = colors.markup },
    RenderMarkdownH6Bg { bg = colors.line, fg = colors.constant },

    RenderMarkdownQuote { fg = colors.accent },
    RenderMarkdownQuote1 { fg = colors.accent },
    RenderMarkdownQuote2 { fg = colors.keyword },
    RenderMarkdownQuote3 { fg = colors.markup },
    RenderMarkdownQuote4 { fg = colors.constant },
    RenderMarkdownQuote5 { fg = colors.constant },
    RenderMarkdownQuote6 { fg = colors.constant },

    RenderMarkdownBullet { fg = colors.vcs_added },
    RenderMarkdownDash { fg = colors.accent },
    RenderMarkdownSign { fg = colors.accent },
    RenderMarkdownMath { fg = colors.accent },
    RenderMarkdownIndent { fg = colors.accent },
    RenderMarkdownHtmlComment { Comment },
    RenderMarkdownLink { fg = colors.tag },
    RenderMarkdownWikiLink { fg = colors.tag },
    RenderMarkdownUnchecked { fg = colors.markup },
    RenderMarkdownChecked { fg = colors.vcs_added },
    RenderMarkdownTodo { fg = colors.vcs_added },
    RenderMarkdownTableHead { Comment },
    RenderMarkdownTableRow { Comment },
    RenderMarkdownTableFill { Comment },

    -- Markview.
		MarkviewPalette0 { fg = colors.comment, bg = colors.panel_bg.mix(colors.comment, 15) },
		MarkviewPalette0Fg { fg = MarkviewPalette0.fg },
		MarkviewPalette0Sign { fg = MarkviewPalette0.fg },
    MarkviewPalette1 { fg = RenderMarkdownH1.fg, bg = colors.panel_bg.mix(RenderMarkdownH1.fg, 15) },
		MarkviewPalette1Fg { fg = MarkviewPalette1.fg },
		MarkviewPalette1Sign { fg = MarkviewPalette1.fg },
    MarkviewPalette2 { fg = RenderMarkdownH2.fg, bg = colors.panel_bg.mix(RenderMarkdownH2.fg, 15) },
		MarkviewPalette2Fg { fg = MarkviewPalette2.fg },
		MarkviewPalette2Sign { fg = MarkviewPalette2.fg },
    MarkviewPalette3 { fg = RenderMarkdownH3.fg, bg = colors.panel_bg.mix(RenderMarkdownH3.fg, 15) },
		MarkviewPalette3Fg { fg = MarkviewPalette3.fg },
		MarkviewPalette3Sign { fg = MarkviewPalette3.fg },
    MarkviewPalette4 { fg = RenderMarkdownH4.fg, bg = colors.panel_bg.mix(RenderMarkdownH4.fg, 15) },
		MarkviewPalette4Fg { fg = MarkviewPalette4.fg },
		MarkviewPalette4Sign { fg = MarkviewPalette4.fg },
    MarkviewPalette5 { fg = RenderMarkdownH5.fg, bg = colors.panel_bg.mix(RenderMarkdownH5.fg, 15) },
		MarkviewPalette5Fg { fg = MarkviewPalette5.fg },
		MarkviewPalette5Sign { fg = MarkviewPalette5.fg },
    MarkviewPalette6 { fg = RenderMarkdownH6.fg, bg = colors.panel_bg.mix(RenderMarkdownH6.fg, 15) },
		MarkviewPalette6Fg { fg = MarkviewPalette6.fg },
		MarkviewPalette6Sign { fg = MarkviewPalette6.fg },

    MarkviewBlockQuoteDefault { MarkviewPalette0Fg },
    MarkviewBlockQuoteSpecial { MarkviewPalette6Fg },
    MarkviewBlockQuoteError { MarkviewPalette5Fg },
    MarkviewBlockQuoteNote { MarkviewPalette2Fg },
    MarkviewBlockQuoteWarn { MarkviewPalette4Fg },
    MarkviewBlockQuoteOk { MarkviewPalette1Fg },

    MarkviewCheckboxCancelled { MarkviewBlockQuoteDefault },
    MarkviewCheckboxStriked { MarkviewCheckboxCancelled },
    MarkviewCheckboxProgress { MarkviewBlockQuoteSpecial },
    MarkviewCheckboxUnchecked { MarkviewBlockQuoteNote },
    MarkviewCheckboxPending { MarkviewBlockQuoteWarn },
    MarkviewCheckboxChecked { MarkviewBlockQuoteOk },

    MarkviewSubscript { MarkviewPalette0Fg },
    MarkviewSuperscript { MarkviewPalette6Fg },

    MarkviewListItemMinus { MarkviewPalette2Fg },
    MarkviewListItemPlus { MarkviewPalette1Fg },
    MarkviewListItemStar { MarkviewPalette4Fg },

    MarkviewTableBorder { MarkviewPalette0Fg },
    MarkviewTableHeader { MarkviewPalette2Fg, bold = true },
  }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
