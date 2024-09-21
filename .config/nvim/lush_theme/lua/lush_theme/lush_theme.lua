-- Template: https://github.com/rktjmp/lush-template/blob/main/lua/lush_theme/lush_template.lua
-- VSCode Theme Color Reference: https://code.visualstudio.com/api/references/theme-color#command-center-colors

local lush = require 'lush'
local hsl = lush.hsl

local norm_fg = hsl(0, 0, 65)
local norm_bg = ''

local dark_red = hsl(0, 53, 62)
local orange = hsl(38, 95, 57)
local brown = hsl(17, 47, 64)
local yellow = hsl(60, 42, 76)
local yellow_orange = hsl(41, 53, 67)
local green = hsl(101, 0, 47)
local blue_green = hsl(168, 53, 55)
local light_green = hsl(99, 28, 73)
local blue = hsl(201, 100, 65)
local blue2 = hsl(204, 100, 58)
local light_blue = hsl(201, 60, 80)
local dark_blue = hsl(207, 48, 63)
local cornflower_blue = hsl(218, 72, 65)
local dark_pink = hsl(305, 35, 65)
local bright_pink = hsl(338, 95, 56)
local purple = hsl(261, 100, 75)

local white = hsl(0, 0, 100)
local gray = hsl(30, 1, 31)
local gray2 = hsl(0, 0, 52) -- LineNr (editorLineNumber.foreground)
local gray3 = hsl(0, 0, 50)
local black = hsl(0, 0, 18) -- TabLine
local black2 = hsl(240, 1, 15) -- Statusline, TabLineFill, Pmenu
local black3 = hsl(195, 5, 17) -- CursorLine (list.hoverBackground from VSCode)

local error_red = hsl(0, 85, 62)
local warn_yellow = hsl(49, 100, 40)
local info_blue = hsl(212, 100, 61)
local hint_gray = hsl(0, 0, 69)
local ok_green = hsl(117, 45, 67) -- color for success, so I use notebookStatusSuccessIcon.foreground

local selection_blue = hsl(205, 92, 19)
local folded_blue = hsl(209, 28, 17) -- editor.foldBackground
local float_border_fg = hsl(0, 0, 27)
local indent_guide_fg = hsl(0, 0, 25)
local indent_guide_scope_fg = hsl(0, 0, 44)
local label_fg = hsl(0, 0, 78)

---@diagnostic disable
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {

    TabBorder { fg = black2 }, -- tab.border, border to separate tabs from each other
    FloatBorder { fg = float_border_fg },
    SelectionHighlightBackground { bg = '' },
    LightBulb { fg = hsl(48, 100, 50) },
    CodeLens { fg = hsl(0, 0, 60) },
    GutterGitAdded { fg = hsl(86, 97, 25) },
    GutterGitDeleted { fg = hsl(0, 85, 62) },
    GutterGitModified { fg = hsl(197, 72, 38) },
    Breadcrumb { fg = hsl(0, 0, 66), bg = norm_bg },
    ScrollbarSlider { bg = '' },
    PeekViewBorder { fg = hsl(212, 100, 61) },
    PeekViewNormal { bg = '' },
    PeekViewTitle { fg = white }, -- peekViewTitleLabel.foreground
    PeekViewCursorLine { bg = '' },
    PeekViewMatchHighlight { bg = hsl(210, 52, 31) }, -- peekViewEditor.matchHighlightBackground
    GhostText { fg = hsl(0, 0, 42) },
    Icon { fg = hsl(0, 0, 77) },
    Description { fg = hsl(0, 0, 60) }, -- descriptionForeground
    ProgressBar { fg = hsl(207, 86, 40) }, -- progressBar.background
    MatchedCharacters { fg = blue2 }, -- editorSuggestWidget.highlightForeground
    Hint { MatchedCharacters }, -- for the hint letter in options, e.g., the q in [q]uickfix
    -- For the unused code, use Identifier's fg (9cdcfe) as the base color,
    -- editorUnnecessaryCode.opacity is 000000aa (the alpha value is aa),
    -- so the color will be 9cdcfeaa. Converting hexa to hex gets 729db4.
    UnnecessaryCode { fg = hsl(201, 31, 58) },
    -- Git diff
    DiffTextAdded { bg = '' },
    DiffTextDeleted { bg = '' },
    DiffTextChanged { bg = '' },
    DiffLineAdded { bg = '' },
    DiffLineDeleted { bg = '' },
    DiffLineChanged { bg = '' },
    -- Quickfix list (can be used to define qf syntax, e.g.,
    -- ~/.config/nvim/syntax/qf.vim)
    QfFileName { fg = white },
    QfSelection { bg = '' }, -- terminal.inactiveSelectionBackground
    QfText { fg = hsl(0, 0, 73) }, -- normal text in quickfix list
    -- Inline hints
    InlayHint { fg = hsl(0, 0, 59), bg = '' }, -- editorInlayHint.foreground/background
    InlayHintType { InlayHint }, -- editorInlayHint.typeBackground/typeForeground

    --
    -- Editor
    --
    CursorLine { bg = '' },
    CursorColumn { bg = '' },
    ColorColumn { bg = '' }, -- #5a5a5a in VSCode (editorRuler.foreground) it's too bright
    Conceal { fg = gray2 },
    Cursor { fg = gray, bg = '' },
    -- lCursor { },
    -- CursorIM { },
    Directory { fg = dark_blue },
    DiffAdd { DiffLineAdded },
    DiffDelete { DiffLineDeleted },
    DiffChange { DiffLineChanged },
    DiffText { DiffTextChanged },
    EndOfBuffer { fg = norm_bg },
    -- TermCursor { },
    -- TermCursorNC { },
    ErrorMsg { fg = error_red },
    WinSeparator { fg = hsl(0, 0, 27) }, -- editorGroup.border
    VirtSplit { WinSeparator }, -- deprecated and use WinSeparator instead
    LineNr { fg = gray2 },
    CursorLineNr { fg = white },
    Folded { bg = '' },
    CursorLineFold { CursorLineNr },
    FoldColumn { LineNr }, -- #c5c5c5 in VSCode (editorGutter.foldingControlForeground) and it's too bright
    SignColumn { bg = '' },
    IncSearch { bg = '' },
    -- Substitute { },
    MatchParen { bg = hsl(210, 52, 31), gui = 'bold, underline' },
    ModeMsg { fg = norm_fg },
    MsgArea { fg = norm_fg },
    -- MsgSeparator { },
    MoreMsg { fg = norm_fg },
    NonText { fg = gray2 },
    Normal { fg = norm_fg, bg = '' },
    -- NormalNC { },
    Pmenu { fg = norm_fg, bg = '' },
    PmenuSel { fg = white, bg = '' },
    PmenuSbar { bg = '' },
    PmenuThumb { bg = '' },
    NormalFloat { Pmenu },
    Question { fg = dark_blue },
    QuickFixLine { QfSelection },
    Search { bg = hsl(210, 52, 31) },
    SpecialKey { NonText },
    SpellBad { gui = 'undercurl', sp = error_red },
    SpellCap { gui = 'undercurl', sp = warn_yellow },
    SpellLocal { gui = 'undercurl', sp = info_blue },
    SpellRare { gui = 'undercurl', sp = info_blue },
    StatusLine { bg = '' },
    StatusLineNC { fg = gray, bg = '' },
    TabLine { fg = hsl(0, 0, 56), bg = '' },
    TabLineFill { fg = 'NONE', bg = '' },
    TabLineSel { fg = white, bg = '' },
    Title { fg = dark_blue, gui = 'bold' },
    Visual { bg = hsl(210, 52, 31) },
    -- VisualNOS { },
    WarningMsg { fg = warn_yellow },
    Whitespace { fg = hsl(60, 1, 24) },
    WildMenu { PmenuSel },
    Winbar { Breadcrumb },
    WinbarNC { Breadcrumb },

    --
    -- Syntax
    --
    Comment { fg = green, gui = 'italic' },

    Constant { fg = dark_blue },
    String { fg = brown },
    Character { Constant },
    Number { fg = light_green },
    Boolean { Constant },
    Float { Number },

    Identifier { fg = light_blue },
    Function { fg = yellow },

    Statement { fg = dark_pink },
    Conditional { Statement },
    Repeat { Statement },
    Label { Statement },
    Operator { fg = norm_fg },
    Keyword { fg = dark_blue },
    Exception { Statement },

    PreProc { fg = dark_pink },
    Include { PreProc },
    Define { PreProc },
    Macro { PreProc },
    PreCondit { PreProc },

    Type { fg = dark_blue },
    StorageClass { Type },
    Structure { Type },
    Typedef { Type },

    Special { fg = yellow_orange },
    SpecialChar { Special },
    Tag { Special },
    Delimiter { Special },
    SpecialComment { Special },
    Debug { Special },

    Underlined { gui = 'underline' },
    -- Ignore { },
    Error { fg = error_red },
    Todo { fg = norm_bg, bg = '', gui = 'bold' },

    --
    -- diff
    --
    -- VSCode doesn't have foreground for git added/removed/changed, so here I
    -- use the corresponding colors for gutter instead.
    diffAdded { GutterGitAdded },
    diffRemoved { GutterGitDeleted },
    diffChanged { GutterGitModified },

    --
    -- LSP
    --
    LspReferenceText { SelectionHighlightBackground },
    LspReferenceRead { SelectionHighlightBackground },
    LspReferenceWrite { SelectionHighlightBackground },
    LspCodeLens { CodeLens },
    -- LspCodeLensSeparator { }, -- Used to color the separator between two or more code lens.
    LspSignatureActiveParameter { MatchedCharacters },
    LspInlayHint { InlayHint },

    --
    -- Diagnostics
    --
    DiagnosticError { fg = error_red },
    DiagnosticWarn { fg = warn_yellow },
    DiagnosticInfo { fg = info_blue },
    DiagnosticHint { fg = hint_gray },
    DiagnosticOk { fg = ok_green },
    DiagnosticVirtualTextError { DiagnosticError },
    DiagnosticVirtualTextWarn { DiagnosticWarn },
    DiagnosticVirtualTextInfo { DiagnosticInfo },
    DiagnosticVirtualTextHint { DiagnosticHint },
    DiagnosticVirtualTextOk { DiagnosticOk },
    DiagnosticUnderlineError { gui = 'undercurl', sp = error_red },
    DiagnosticUnderlineWarn { gui = 'undercurl', sp = warn_yellow },
    DiagnosticUnderlineInfo { gui = 'undercurl', sp = info_blue },
    DiagnosticUnderlineHint { gui = 'undercurl', sp = hint_gray },
    DiagnosticUnderlineOk { gui = 'undercurl', sp = ok_green },
    DiagnosticFloatingError { DiagnosticError },
    DiagnosticFloatingWarn { DiagnosticWarn },
    DiagnosticFloatingInfo { DiagnosticInfo },
    DiagnosticFloatingHint { DiagnosticHint },
    DiagnosticFloatingOk { DiagnosticOk },
    DiagnosticSignError { DiagnosticError },
    DiagnosticSignWarn { DiagnosticWarn },
    DiagnosticSignInfo { DiagnosticInfo },
    DiagnosticSignHint { DiagnosticHint },
    DiagnosticSignOk { DiagnosticOk },
    DiagnosticUnnecessary { UnnecessaryCode, gui = 'underdashed' },
    DiagnosticDeprecated { fg = gray3, gui = 'strikethrough' },

    --
    -- Treesitter
    --
    -- Use the capture names directly as the highlight groups.
    -- To find all the capture names, see https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights)

    -- Identifiers
    sym '@variable' { fg = light_blue }, -- various variable names
    sym '@variable.builtin' { fg = dark_blue }, -- built-in variable names (e.g. `this`)
    sym '@variable.parameter' { fg = orange }, -- parameters of a function, use a conspicuous color (VSCode uses the common light_blue)
    sym '@variable.parameter.builtin' { sym '@variable.parameter' }, -- special parameters (e.g. `_`, `it`)
    sym '@variable.member' { fg = light_blue }, -- object and struct fields

    sym '@constant' { Constant }, -- constant identifiers
    sym '@constant.builtin' { Constant }, -- built-in constant values
    sym '@constant.macro' { Constant }, -- constants defined by the preprocessor

    sym '@module' { fg = blue_green }, -- modules or namespaces
    sym '@module.builtin' { sym '@module' }, -- built-in modules or namespaces
    sym '@label' { fg = label_fg }, -- GOTO and other labels (e.g. `label:` in C), including heredoc labels

    -- Literals
    sym '@string' { String }, -- string literals
    sym '@string.documentation' { fg = brown }, -- string documenting code (e.g. Python docstrings)
    sym '@string.regexp' { fg = dark_red }, -- regular expressions
    sym '@string.escape' { fg = yellow_orange }, -- escape sequences
    sym '@string.special' { SpecialChar }, -- other special strings (e.g. dates)
    sym '@string.special.symbol' { sym '@string.special' }, -- symbols or atoms
    sym '@string.special.url' { sym '@string.special' }, -- URIs (e.g. hyperlinks), it's url outside markup
    sym '@string.special.path' { sym '@string.special' }, -- filenames

    sym '@character' { Character }, -- character literals
    sym '@character.special' { SpecialChar }, -- special characters (e.g. wildcards)

    sym '@boolean' { Boolean }, -- boolean literals
    sym '@number' { Number }, -- numeric literals
    sym '@number.float' { Float }, -- floating-point number literals

    -- Types
    sym '@type' { fg = blue_green }, -- type or class definitions and annotations
    sym '@type.builtin' { fg = dark_blue }, -- built-in types
    sym '@type.definition' { fg = blue_green }, -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)

    sym '@attribute' { fg = blue_green }, -- attribute annotations (e.g. Python decorators)
    sym '@attribute.builtin' { sym '@attribute' }, -- builtin annotations (e.g. `@property` in Python)
    sym '@property' { sym '@variable.member' }, -- the key in key/value pairs

    -- Function
    sym '@function' { Function }, -- function definitions
    sym '@function.builtin' { Function }, -- built-in functions
    sym '@function.call' { Function }, -- function calls
    sym '@function.macro' { Function }, -- preprocessor macros

    sym '@function.method' { sym '@function' }, -- method definitions
    sym '@function.method.call' { sym '@function.call' }, -- method calls

    sym '@constructor' { fg = blue_green }, -- constructor calls and definitions
    sym '@operator' { Operator }, -- symbolic operators (e.g. `+` / `*`)

    -- Keyword
    sym '@keyword' { Keyword }, -- keywords not fitting into specific categories
    sym '@keyword.coroutine' { fg = dark_pink }, -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    sym '@keyword.function' { fg = dark_blue }, -- keywords that define a function (e.g. `func` in Go, `def` in Python)
    sym '@keyword.operator' { sym '@operator' }, -- operators that are English words (e.g. `and` / `or`)
    sym '@keyword.import' { Include }, -- keywords for including modules (e.g. `import` / `from` in Python)
    sym '@keyword.type' { fg = dark_blue }, -- keywords describing composite types (e.g. `struct`, `enum`)
    sym '@keyword.modifier' { fg = dark_blue }, -- keywords modifying other constructs (e.g. `const`, `static`, `public`)
    sym '@keyword.repeat' { Repeat }, -- keywords related to loops (e.g. `for` / `while`)
    sym '@keyword.return' { fg = dark_pink }, --  keywords like `return` and `yield`
    sym '@keyword.debug' { Debug }, -- keywords related to debugging
    sym '@keyword.exception' { Exception }, -- keywords related to exceptions (e.g. `throw` / `catch`)

    sym '@keyword.conditional' { Conditional }, -- keywords related to conditionals (e.g. `if` / `else`)
    sym '@keyword.conditional.ternary' { sym '@operator' }, -- ternary operator (e.g. `?` / `:`)

    sym '@keyword.directive' { PreProc }, -- various preprocessor directives & shebangs
    sym '@keyword.directive.define' { sym '@keyword.directive' }, -- preprocessor definition directives

    -- Punctuation
    sym '@punctuation.delimiter' { fg = norm_fg }, -- delimiters (e.g. `;` / `.` / `,`)
    sym '@punctuation.bracket' { fg = norm_fg }, -- brackets (e.g. `()` / `{}` / `[]`)
    sym '@punctuation.special' { fg = dark_blue }, -- special symbols (e.g. `{}` in string interpolation)

    -- Comments
    sym '@comment' { Comment }, -- line and block comments
    sym '@comment.documentation' { sym '@comment' }, -- comments documenting code

    sym '@comment.error' { fg = error_red }, -- error-type comments (e.g., `DEPRECATED:`)
    sym '@comment.warning' { fg = warn_yellow }, -- warning-type comments (e.g., `WARNING:`, `FIX:`)
    sym '@comment.hint' { fg = hint_gray }, -- note-type comments (e.g., `NOTE:`)
    sym '@comment.info' { fg = info_blue }, -- info-type comments
    sym '@comment.todo' { Todo }, -- todo-type comments (e.g-, `TODO:`, `WIP:`)

    -- Markup
    sym '@markup.strong' { fg = norm_fg, gui = 'bold' }, -- bold text
    sym '@markup.italic' { fg = norm_fg, gui = 'italic' }, -- text with emphasis
    sym '@markup.strikethrough' { fg = norm_fg, gui = 'strikethrough' }, -- strikethrough text
    sym '@markup.underline' { fg = norm_fg, gui = 'underline' }, -- underlined text (only for literal underline markup!)

    sym '@markup.heading' { Title }, -- headings, titles (including markers)
    sym '@markup.heading.1' { sym '@markup.heading' },
    sym '@markup.heading.2' { sym '@markup.heading' },
    sym '@markup.heading.3' { sym '@markup.heading' },
    sym '@markup.heading.4' { sym '@markup.heading' },
    sym '@markup.heading.5' { sym '@markup.heading' },
    sym '@markup.heading.6' { sym '@markup.heading' },

    sym '@markup.quote' { fg = green }, -- block quotes
    sym '@markup.math' { fg = blue_green }, -- math environments (e.g. `$ ... $` in LaTeX)

    sym '@markup.link' { fg = brown }, -- text references, footnotes, citations, etc.
    sym '@markup.link.label' { sym '@markup.link' }, -- non-url links
    sym '@markup.link.url' { sym '@markup.link' }, -- url links in markup

    sym '@markup.raw' { fg = brown }, -- literal or verbatim text (e.g., inline code)
    sym '@markup.raw.block' { fg = norm_fg }, -- literal or verbatim text as a stand-alone block

    sym '@markup.list' { fg = cornflower_blue }, -- list markers
    -- sym("@markup.list.checked") { }, -- checked todo-style list markers
    -- sym("@markup.list.unchecked") { }, -- unchecked todo-style list markers

    sym '@diff.plus' { DiffTextAdded }, -- added text (for diff files)
    sym '@diff.minus' { DiffTextDeleted }, -- deleted text (for diff files)
    sym '@diff.delta' { DiffTextChanged }, -- changed text (for diff files)

    sym '@tag' { fg = dark_blue }, -- XML tag names
    sym '@tag.builtin' { sym '@tag' }, -- builtin tag names (e.g. HTML5 tags)
    sym '@tag.attribute' { fg = light_blue }, -- XML tag attributes
    sym '@tag.delimiter' { fg = gray3 }, -- XML tag delimiters

    -- Language specific
    -- Lua
    sym '@variable.member.lua' { fg = blue_green },

    --
    -- LSP semantic tokens
    --
    -- The help page :h lsp-semantic-highlight
    -- A short guide: https://gist.github.com/swarn/fb37d9eefe1bc616c2a7e476c0bc0316
    -- Token types and modifiers are described here: https://code.visualstudio.com/api/language-extensions/semantic-highlight-guide
    sym '@lsp.type.namespace' { sym '@module' },
    sym '@lsp.type.type' { sym '@type' },
    sym '@lsp.type.class' { sym '@type' },
    sym '@lsp.type.enum' { sym '@keyword.type' },
    sym '@lsp.type.interface' { sym '@type' },
    sym '@lsp.type.struct' { sym '@type' },
    sym '@lsp.type.typeParameter' { sym '@type.definition' },
    sym '@lsp.type.parameter' { sym '@variable.parameter' },
    sym '@lsp.type.variable' { sym '@variable' },
    sym '@lsp.type.property' { sym '@property' },
    sym '@lsp.type.enumMember' { fg = blue },
    sym '@lsp.type.event' { sym '@type' },
    sym '@lsp.type.function' { sym '@function' },
    sym '@lsp.type.method' { sym '@function' },
    sym '@lsp.type.macro' { sym '@constant.macro' },
    sym '@lsp.type.keyword' { sym '@keyword' },
    sym '@lsp.type.comment' { sym '@comment' },
    sym '@lsp.type.string' { sym '@string' },
    sym '@lsp.type.number' { sym '@number' },
    sym '@lsp.type.regexp' { sym '@string.regexp' },
    sym '@lsp.type.operator' { sym '@operator' },
    sym '@lsp.type.decorator' { sym '@attribute' },
    sym '@lsp.type.escapeSequence' { sym '@string.escape' },
    sym '@lsp.type.formatSpecifier' { fg = light_blue },
    sym '@lsp.type.builtinType' { sym '@type.builtin' },
    sym '@lsp.type.typeAlias' { sym '@type.definition' },
    sym '@lsp.type.unresolvedReference' { gui = 'undercurl', sp = error_red },
    sym '@lsp.type.lifetime' { sym '@keyword.modifier' },
    sym '@lsp.type.generic' { sym '@variable' },
    sym '@lsp.type.selfKeyword' { sym '@variable.builtin' },
    sym '@lsp.type.selfTypeKeyword' { sym '@variable.builtin' },
    sym '@lsp.type.deriveHelper' { sym '@attribute' },
    sym '@lsp.type.modifier' { sym '@keyword.modifier' },
    sym '@lsp.typemod.type.defaultLibrary' { sym '@type.builtin' },
    sym '@lsp.typemod.typeAlias.defaultLibrary' { sym '@type.builtin' },
    sym '@lsp.typemod.class.defaultLibrary' { sym '@type.builtin' },
    sym '@lsp.typemod.variable.defaultLibrary' { sym '@variable.builtin' },
    sym '@lsp.typemod.function.defaultLibrary' { sym '@function.builtin' },
    sym '@lsp.typemod.method.defaultLibrary' { sym '@function.builtin' },
    sym '@lsp.typemod.macro.defaultLibrary' { sym '@function.builtin' },
    sym '@lsp.typemod.struct.defaultLibrary' { sym '@type.builtin' },
    sym '@lsp.typemod.enum.defaultLibrary' { sym '@type.builtin' },
    sym '@lsp.typemod.enumMember.defaultLibrary' { sym '@constant.builtin' },
    sym '@lsp.typemod.variable.readonly' { fg = blue },
    sym '@lsp.typemod.variable.callable' { sym '@function' },
    sym '@lsp.typemod.variable.static' { sym '@constant' },
    sym '@lsp.typemod.property.readonly' { fg = blue },
    sym '@lsp.typemod.keyword.async' { sym '@keyword.coroutine' },
    sym '@lsp.typemod.keyword.injected' { sym '@keyword' },
    -- Set injected highlights. Mainly for Rust doc comments and also works for
    -- other lsps that inject tokens in comments.
    -- Ref: https://github.com/folke/tokyonight.nvim/pull/340
    sym '@lsp.typemod.operator.injected' { sym '@operator' },
    sym '@lsp.typemod.string.injected' { sym '@string' },
    sym '@lsp.typemod.variable.injected' { sym '@variable' },

    -- Language specific
    -- Lua
    sym '@lsp.type.property.lua' { sym '@variable.member.lua' },

    --
    -- nvim-lspconfig
    --
    -- LspInfoTitle { },
    -- LspInfoList { },
    -- LspInfoFiletype { },
    -- LspInfoTip { },
    LspInfoBorder { FloatBorder },

    --
    -- nvim-cmp
    --
    CmpItemAbbrDeprecated { fg = gray3, bg = 'NONE', gui = 'strikethrough' },
    CmpItemAbbrMatch { MatchedCharacters, bg = 'NONE' },
    CmpItemAbbrMatchFuzzy { CmpItemAbbrMatch },
    CmpItemMenu { Description },
    CmpItemKindText { fg = hsl(0, 0, 80), bg = 'NONE' },
    CmpItemKindMethod { fg = hsl(274, 52, 67), bg = 'NONE' },
    CmpItemKindFunction { CmpItemKindMethod },
    CmpItemKindConstructor { CmpItemKindFunction },
    CmpItemKindField { fg = hsl(208, 100, 73), bg = 'NONE' },
    CmpItemKindVariable { CmpItemKindField },
    CmpItemKindClass { fg = hsl(35, 85, 55), bg = 'NONE' },
    CmpItemKindInterface { CmpItemKindField },
    CmpItemKindModule { CmpItemKindText },
    CmpItemKindProperty { CmpItemKindText },
    CmpItemKindUnit { CmpItemKindText },
    CmpItemKindValue { CmpItemKindText },
    CmpItemKindEnum { CmpItemKindClass },
    CmpItemKindKeyword { CmpItemKindText },
    CmpItemKindSnippet { CmpItemKindText },
    CmpItemKindColor { CmpItemKindText },
    CmpItemKindFile { CmpItemKindText },
    CmpItemKindReference { CmpItemKindText },
    CmpItemKindFolder { CmpItemKindText },
    CmpItemKindEnumMember { CmpItemKindField },
    CmpItemKindConstant { CmpItemKindText },
    CmpItemKindStruct { CmpItemKindText },
    CmpItemKindEvent { CmpItemKindClass },
    CmpItemKindOperator { CmpItemKindText },
    CmpItemKindTypeParameter { CmpItemKindText },
    -- Predefined for the winhighlight config of cmp float window
    SuggestWidgetBorder { FloatBorder },
    SuggestWidgetSelect { bg = selection_blue },

    --
    -- Aerial
    --
    AerialTextIcon { CmpItemKindText },
    AerialMethodIcon { CmpItemKindMethod },
    AerialFunctionIcon { CmpItemKindFunction },
    AerialConstructorIcon { CmpItemKindConstructor },
    AerialFieldIcon { CmpItemKindField },
    AerialVariableIcon { CmpItemKindVariable },
    AerialClassIcon { CmpItemKindClass },
    AerialInterfaceIcon { CmpItemKindInterface },
    AerialModuleIcon { CmpItemKindModule },
    AerialPropertyIcon { CmpItemKindProperty },
    AerialUnitIcon { CmpItemKindUnit },
    AerialValueIcon { CmpItemKindValue },
    AerialEnumIcon { CmpItemKindEnum },
    AerialKeywordIcon { CmpItemKindKeyword },
    AerialSnippetIcon { CmpItemKindSnippet },
    AerialColorIcon { CmpItemKindColor },
    AerialFileIcon { CmpItemKindFile },
    AerialReferenceIcon { CmpItemKindReference },
    AerialFolderIcon { CmpItemKindFolder },
    AerialEnumMemberIcon { CmpItemKindEnumMember },
    AerialConstantIcon { CmpItemKindConstant },
    AerialStructIcon { CmpItemKindStruct },
    AerialEventIcon { CmpItemKindEvent },
    AerialOperatorIcon { CmpItemKindOperator },
    AerialTypeParameterIcon { CmpItemKindTypeParameter },

    --
    -- nvim-navic
    --
    NavicText { Winbar },
    NavicIconsFile { CmpItemKindFile },
    NavicIconsModule { CmpItemKindModule },
    NavicIconsNamespace { NavicText },
    NavicIconsPackage { NavicText },
    NavicIconsClass { CmpItemKindClass },
    NavicIconsMethod { CmpItemKindMethod },
    NavicIconsProperty { CmpItemKindProperty },
    NavicIconsField { CmpItemKindField },
    NavicIconsConstructor { CmpItemKindConstructor },
    NavicIconsEnum { CmpItemKindEnum },
    NavicIconsInterface { CmpItemKindInterface },
    NavicIconsFunction { CmpItemKindFunction },
    NavicIconsVariable { CmpItemKindVariable },
    NavicIconsConstant { CmpItemKindConstant },
    NavicIconsString { NavicText },
    NavicIconsNumber { NavicText },
    NavicIconsBoolean { NavicText },
    NavicIconsArray { NavicText },
    NavicIconsObject { NavicText },
    NavicIconsKey { NavicText },
    NavicIconsNull { NavicText },
    NavicIconsEnumMember { CmpItemKindEnumMember },
    NavicIconsStruct { CmpItemKindStruct },
    NavicIconsEvent { CmpItemKindEvent },
    NavicIconsOperator { CmpItemKindOperator },
    NavicIconsTypeParameter { CmpItemKindTypeParameter },
    NavicSeparator { NavicText },

    --
    -- Gitsigns
    --
    GitSignsAdd { GutterGitAdded },
    GitSignsChange { GutterGitModified },
    GitSignsDelete { GutterGitDeleted },
    GitSignsAddNr { GitSignsAdd },
    GitSignsChangeNr { GitSignsChange },
    GitSignsDeleteNr { GitSignsDelete },
    GitSignsAddLn { DiffAdd },
    GitSignsChangeLn { DiffChange },
    GitSignsDeleteLn { DiffDelete },
    GitSignsAddInline { DiffTextAdded },
    GitSignsChangeInline { DiffTextChanged },
    GitSignsDeleteInline { DiffTextDeleted },

    --
    -- vim-illuminate
    --
    IlluminatedWordText { SelectionHighlightBackground },
    IlluminatedWordRead { SelectionHighlightBackground },
    IlluminatedWordWrite { SelectionHighlightBackground },

    --
    -- Telescope
    --
    TelescopeBorder { FloatBorder },
    TelescopePromptBorder { TelescopeBorder },
    TelescopeResultsBorder { TelescopePromptBorder },
    TelescopePreviewBorder { TelescopePromptBorder },
    TelescopeSelection { PmenuSel },
    TelescopeSelectionCaret { TelescopeSelection },
    TelescopeMultiIcon { fg = blue_green },
    TelescopeMatching { CmpItemAbbrMatch },
    TelescopeNormal { Normal },
    TelescopePromptPrefix { Icon },

    --
    -- Harpoon
    --
    HarpoonBorder { TelescopeBorder },
    HarpoonWindow { TelescopeNormal },

    --
    -- fFHighlight
    --
    fFHintWords { gui = 'underline', sp = 'yellow' },
    fFHintCurrentWord { gui = 'undercurl', sp = 'yellow' },

    --
    -- indent-blankline
    --
    IblIndent { fg = indent_guide_fg },
    IblScope { fg = indent_guide_scope_fg },

    --
    -- hlslens
    --
    HlSearchNear { IncSearch },
    HlSearchLens { Description },
    HlSearchLensNear { HlSearchLens },

    --
    -- nvim-ufo
    --
    UfoPreviewBorder { PeekViewBorder },
    UfoPreviewNormal { PeekViewNormal },
    UfoPreviewCursorLine { PeekViewCursorLine },
    UfoFoldedFg { fg = norm_fg },
    UfoFoldedBg { bg = folded_blue },
    UfoCursorFoldedLine { bg = '', gui = 'bold, italic' },
    UfoPreviewSbar { PeekViewNormal },
    UfoPreviewThumb { bg = hsl(183, 14, 26) },
    UfoFoldedEllipsis { fg = hsl(210, 4, 61) },

    --
    -- nvim-bqf
    --
    BqfPreviewFloat { PeekViewNormal },
    BqfPreviewBorder { PeekViewBorder },
    BqfPreviewTitle { PeekViewTitle },
    BqfPreviewSbar { PmenuSbar },
    BqfPreviewThumb { PmenuThumb },
    BqfPreviewCursor { Cursor },
    BqfPreviewCursorLine { PeekViewCursorLine },
    BqfPreviewRange { PeekViewMatchHighlight },
    BqfPreviewBufLabel { Description },
    BqfSign { fg = blue_green },

    --
    -- mg979/tabline.nvim
    --
    TSelect { TabLineSel },
    TVisible { TabLine },
    THidden { TabLine },
    TExtra { TabLine },
    TSpecial { TabLine },
    TFill { TabLineFill },
    TCorner { fg = white, bg = black2 },
    TNumSel { TSelect },
    TNum { TabLine },
    TSelectMod { TSelect },
    TVisibleMod { TVisible },
    THiddenMod { THidden },
    TExtraMod { TExtra },
    TSpecialMod { TSpecial },
    TSelectDim { TSelect },
    TVisibleDim { TVisible },
    THiddenDim { THidden },
    TExtraDim { TExtra },
    TSpecialDim { TSpecial },
    TSelectSep { TabBorder },
    TVisibleSep { TabBorder },
    THiddenSep { TabBorder },
    TExtraSep { TabBorder },
    TSpecialSep { TabBorder },

    --
    -- git-messenger.vim
    --
    gitmessengerHeader { fg = hsl(212, 100, 61) }, -- textLink.activeForeground
    gitmessengerPopupNormal { NormalFloat },
    gitmessengerHash { NormalFloat },
    gitmessengerHistory { NormalFloat },
    gitmessengerEmail { NormalFloat },

    --
    -- nvim-treesitter-context
    --
    -- TreesitterContext { bg = black4 },
    TreesitterContextLineNumber { fg = hsl(0, 0, 36) }, -- 30% darker based on LineNr
    TreesitterContextBottom { gui = 'underline', sp = FloatBorder.fg },

    --
    -- nvim-scrollview
    --
    ScrollView { ScrollbarSlider },
    ScrollViewRestricted { ScrollView },
    ScrollViewConflictsTop { DiffAdd },
    ScrollViewConflictsMiddle { DiffAdd },
    ScrollViewConflictsBottom { DiffAdd },
    ScrollViewCursor { CursorLineNr },
    ScrollViewDiagnosticsError { DiagnosticError },
    ScrollViewDiagnosticsWarn { DiagnosticWarn },
    ScrollViewDiagnosticsHint { DiagnosticHint },
    ScrollViewDiagnosticsInfo { DiagnosticInfo },
    ScrollViewSearch { fg = hsl(40, 96, 32) },

    --
    -- vim-floaterm
    --
    Floaterm { Normal },
    FloatermBorder { FloatBorder },

    --
    -- quick-scope
    --
    QuickScopePrimary { fg = bright_pink, gui = 'underline', sp = bright_pink },
    QuickScopeSecondary { fg = purple, gui = 'underline', sp = purple },
  }
end)
---@diagnostic enable

return theme
