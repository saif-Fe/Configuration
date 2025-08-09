local lush = require 'lush'
local hsl = lush.hsl
local color = hsl(211, 20, 85)

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    icon_style { fg = color.da(40), bg = '' },
    Base { fg = color.da(40), bg = '' },
    Text { fg = color.da(10) },
    Accent { fg = color.da(20) },
    Selection { bg = color.sa(0).da(85), fg = Base.fg },
    OilFile { Accent },
    Fold { fg = color.da(60) },
    Border { fg = Accent.fg.da(60) },
    Underlined { Text, gui = 'underline' }, -- Text that stands out, HTML links
    Red { fg = hsl(0, 100, 25) },
    Yellow { fg = hsl(50, 100, 25) },
    Green { fg = hsl(80, 100, 25) },
    -- ColorColumn    { }, -- Columns set with 'colorcolumn'
    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor { fg = Base.fg.da(40) }, -- Character under the cursor
    CurSearch { fg = Base.fg.da(40) }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn   {  }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine { bg = '' }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory { Text }, -- Directory names (and other special names in listings)
    DiffAdd { Green }, -- Diff mode: Added line |diff.txt|
    DiffChange { Yellow }, -- Diff mode: Changed line |diff.txt|
    DiffDelete { Red }, -- Diff mode: Deleted line |diff.txt|
    DiffText { Base }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer { fg = Text.fg.da(60) }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    NonText { Base },
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    ErrorMsg { Red }, -- Error messages on the command line
    VertSplit { fg = Text.fg.da(70) }, -- Column separating vertically split windows
    Folded { Fold }, -- Line used for closed folds
    FoldColumn { Fold }, -- 'foldcolumn'
    SignColumn { bg = Base.bg }, -- Column where |signs| are displayed
    IncSearch { Selection }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute { Selection }, -- |:substitute| replacement text highlighting
    LineNr { fg = Accent.fg }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove { fg = Text.fg.da(30) }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    LineNrBelow { fg = Text.fg.da(30) }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr { fg = Accent.fg.da(20) }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    CursorLineFold { Text }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen { gui = 'underline' }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg        { }, -- |more-prompt|
    NonText { Accent }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal { Text }, -- Normal text
    NormalFloat { Base }, -- Normal text in floating windows.
    FloatShadow { Base },
    FloatShadowThrough { Base },
    FloatBorder { Border }, -- Border of floating windows.
    FloatTitle { Text }, -- Title of floating windows.
    -- NormalNC       { }, -- normal text in non-current windows
    Pmenu { Base }, -- Popup menu: Normal item.
    PmenuSel { Selection }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar      { }, -- Popup menu: Scrollbar.
    -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
    Question { Text }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search { Selection }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey { Text }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine { Base }, -- Status line of current window
    StatusLineNC { Base }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine { Base }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    Title { Text }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual { Selection }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg { Red }, -- Warning messages
    Whitespace { fg = Accent.fg.da(50) }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator { fg = Accent.fg.da(80) }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu { Text }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment { fg = Accent.fg.da(40) }, -- Any comment

    Constant { Text }, -- (*) Any constant
    String { fg = Accent.fg.da(20) }, --   A string constant: "this is a string"
    Character { fg = Accent.fg.da(30) }, --   A character constant: 'c', '\n'
    Number { fg = Accent.fg }, --   A number constant: 234, 0xff
    Boolean { fg = Accent.fg }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    Identifier { Accent }, -- (*) Any variable name
    Function { Accent }, --   Function name (also: methods for classes)

    Statement { Text }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    Operator { Fold }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    PreProc { Text }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type { Text }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special { Text }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    Delimiter { fg = Text.fg.da(40) }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error { Red }, -- Any erroneous construct
    Todo { Yellow }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    LspReferenceRead { Selection }, -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError { Red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn { Yellow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticUnnecessary { fg= color.da(70) }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    sym '@variable' { fg = Accent.fg }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
    sym '@tag.javascript' { Accent }, -- Tag
    --
    --
    --
    -- nvim-cmp
    --
    CmpItemAbbrDeprecated {},
    CmpItemAbbrMatch {},
    CmpItemAbbrMatchFuzzy {},
    CmpItemMenu {},
    CmpItemKindText {},
    CmpItemKindMethod {},
    CmpItemKindFunction {},
    CmpItemKindConstructor {},
    CmpItemKindField {},
    CmpItemKindVariable {},
    CmpItemKindClass {},
    CmpItemKindInterface {},
    CmpItemKindModule {},
    CmpItemKindProperty {},
    CmpItemKindUnit {},
    CmpItemKindValue {},
    CmpItemKindEnum {},
    CmpItemKindKeyword {},
    CmpItemKindSnippet {},
    CmpItemKindColor {},
    CmpItemKindFile {},
    CmpItemKindReference {},
    CmpItemKindFolder {},
    CmpItemKindEnumMember {},
    CmpItemKindConstant {},
    CmpItemKindStruct {},
    CmpItemKindEvent {},
    CmpItemKindOperator {},
    CmpItemKindTypeParameter {},
    -- Predefined for the winhighlight config of cmp float window
    SuggestWidgetBorder {},
    SuggestWidgetSelect {},

    --
    -- Aerial
    --
    AerialTextIcon {},
    AerialMethodIcon {},
    AerialFunctionIcon {},
    AerialConstructorIcon {},
    AerialFieldIcon {},
    AerialVariableIcon {},
    AerialClassIcon {},
    AerialInterfaceIcon {},
    AerialModuleIcon {},
    AerialPropertyIcon {},
    AerialUnitIcon {},
    AerialValueIcon {},
    AerialEnumIcon {},
    AerialKeywordIcon {},
    AerialSnippetIcon {},
    AerialColorIcon {},
    AerialFileIcon {},
    AerialReferenceIcon {},
    AerialFolderIcon {},
    AerialEnumMemberIcon {},
    AerialConstantIcon {},
    AerialStructIcon {},
    AerialEventIcon {},
    AerialOperatorIcon {},
    AerialTypeParameterIcon {},

    --
    -- nvim-navic
    --
    NavicText {},
    NavicIconsFile {},
    NavicIconsModule {},
    NavicIconsNamespace {},
    NavicIconsPackage {},
    NavicIconsClass {},
    NavicIconsMethod {},
    NavicIconsProperty {},
    NavicIconsField {},
    NavicIconsConstructor {},
    NavicIconsEnum {},
    NavicIconsInterface {},
    NavicIconsFunction {},
    NavicIconsVariable {},
    NavicIconsConstant {},
    NavicIconsString {},
    NavicIconsNumber {},
    NavicIconsBoolean {},
    NavicIconsArray {},
    NavicIconsObject {},
    NavicIconsKey {},
    NavicIconsNull {},
    NavicIconsEnumMember {},
    NavicIconsStruct {},
    NavicIconsEvent {},
    NavicIconsOperator {},
    NavicIconsTypeParameter {},
    NavicSeparator {},

    --
    -- Gitsigns
    --
    GitSignsAdd {},
    GitSignsChange {},
    GitSignsDelete {},
    GitSignsAddNr {},
    GitSignsChangeNr {},
    GitSignsDeleteNr {},
    GitSignsAddLn {},
    GitSignsChangeLn {},
    GitSignsDeleteLn {},
    GitSignsAddInline {},
    GitSignsChangeInline {},
    GitSignsDeleteInline {},

    --
    -- vim-illuminate
    --
    IlluminatedWordText {},
    IlluminatedWordRead {},
    IlluminatedWordWrite {},

    --
    -- Telescope
    --
    TelescopeBorder { Border },
    TelescopePromptBorder { Border },
    TelescopeResultsBorder { Border },
    TelescopePreviewBorder { Border },
    TelescopeSelection { Selection },
    TelescopeSelectionCaret {},
    TelescopeMultiIcon {},
    TelescopeMatching {},
    TelescopeNormal { fg = Accent.fg.da(40) },
    TelescopePromptPrefix {},

    --
    -- Harpoon
    --
    HarpoonBorder { Border },
    HarpoonWindow { Border },

    --
    -- fFHighlight
    --
    fFHintWords {},
    fFHintCurrentWord {},

    --
    -- indent-blankline
    --
    IblIndent {},
    IblScope {},

    --
    -- hlslens
    --
    HlSearchNear {},
    HlSearchLens {},
    HlSearchLensNear {},

    --
    -- nvim-ufo
    --
    UfoPreviewBorder {},
    UfoPreviewNormal {},
    UfoPreviewCursorLine {},
    UfoFoldedFg {},
    UfoFoldedBg {},
    UfoCursorFoldedLine {},
    UfoPreviewSbar {},
    UfoPreviewThumb {},
    UfoFoldedEllipsis {},

    --
    -- nvim-bqf
    --
    BqfPreviewFloat {},
    BqfPreviewBorder {},
    BqfPreviewTitle {},
    BqfPreviewSbar {},
    BqfPreviewThumb {},
    BqfPreviewCursor {},
    BqfPreviewCursorLine {},
    BqfPreviewRange {},
    BqfPreviewBufLabel {},
    BqfSign {},

    --
    -- mg979/tabline.nvim
    --
    TSelect {},
    TVisible {},
    THidden {},
    TExtra {},
    TSpecial {},
    TFill {},
    TCorner {},
    TNumSel {},
    TNum {},
    TSelectMod {},
    TVisibleMod {},
    THiddenMod {},
    TExtraMod {},
    TSpecialMod {},
    TSelectDim {},
    TVisibleDim {},
    THiddenDim {},
    TExtraDim {},
    TSpecialDim {},
    TSelectSep {},
    TVisibleSep {},
    THiddenSep {},
    TExtraSep {},
    TSpecialSep {},

    --
    -- git-messenger.vim
    --
    gitmessengerHeader {}, -- textLink.activeForeground
    gitmessengerPopupNormal {},
    gitmessengerHash {},
    gitmessengerHistory {},
    gitmessengerEmail {},

    --
    -- nvim-treesitter-context
    --
    -- TreesitterContext { bg = black4 },
    TreesitterContextLineNumber {}, -- 30% darker based on LineNr
    TreesitterContextBottom {},

    --
    -- nvim-scrollview
    --
    ScrollView {},
    ScrollViewRestricted {},
    ScrollViewConflictsTop {},
    ScrollViewConflictsMiddle {},
    ScrollViewConflictsBottom {},
    ScrollViewCursor {},
    ScrollViewDiagnosticsError {},
    ScrollViewDiagnosticsWarn {},
    ScrollViewDiagnosticsHint {},
    ScrollViewDiagnosticsInfo {},
    ScrollViewSearch {},

    --
    -- vim-floaterm
    --
    Floaterm {},
    FloatermBorder {},

    --
    -- quick-scope
    --
    QuickScopePrimary {},
    QuickScopeSecondary {},
    --
    -- Mini.starter
    --
    MiniStarterCurrent { Text },
    MiniStarterFooter { Accent },
    MiniStarterHeader { Accent },
    MiniStarterInactive { Text },
    MiniStarterItem { Text },
    MiniStarterItemBullet { Accent },
    MiniStarterItemPrefix { Text },
    MiniStarterSection { Accent },
    MiniStarterQuery { Green },

    -- Dignostic
    DignosticHint { Text },
    -- CSS
    sym '@property.class.css' { Text },
    sym '@property.css' { fg = Accent.fg.da(10) },
    -- Javascript
    sym '@none.javascript' { fg = Accent.fg.da(20) },
    sym '@punctuation.bracket.javascript' { fg = Accent.fg.da(40) },
    sym '@tag.delimiter.javascript' { Fold },
  }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
