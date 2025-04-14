-- Define the Solarized colors with standard names
local colors = {
  base03 = "#002b36",
  base02 = "#073642",
  base01 = "#586e75",
  base00 = "#657b83",
  base0 = "#839496",
  base1 = "#93a1a1",
  base2 = "#eee8d5",
  base3 = "#fdf6e3",
  yellow = "#b58900",
  orange = "#cb4b16",
  red = "#dc322f",
  magenta = "#d33682",
  violet = "#6c71c4",
  blue = "#268bd2",
  cyan = "#2aa198",
  green = "#859900",
}

-- Clear existing highlights and reset syntax if enabled
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

-- Helper function for setting highlight groups
local function set_highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Set up basic highlight groups using the helper function
set_highlight("Comment", { fg = colors.base01, italic = true })
set_highlight("Constant", { fg = colors.cyan })
set_highlight("CursorLine", { bg = colors.base02 })
set_highlight("Delimiter", { fg = colors.base0 })
set_highlight("Directory", { fg = colors.blue })
set_highlight("DiagnosticError", { fg = colors.red })
set_highlight("DiagnosticWarn", { fg = colors.yellow })
set_highlight("Identifier", { fg = colors.blue })
set_highlight("Function", { fg = colors.blue })
set_highlight("LineNr", { fg = colors.base01 })
set_highlight("Normal", { fg = colors.base0, bg = colors.base03 })
set_highlight("NormalFloat", { fg = colors.base0, bg = colors.base02 })
set_highlight("Operator", { fg = colors.base0 })
set_highlight("Pmenu", { fg = colors.base0, bg = colors.base02 })
set_highlight("PmenuSel", { fg = colors.base2, bg = colors.base01 })
set_highlight("PmenuThumb", { bg = colors.base01 })
set_highlight("PreProc", { fg = colors.yellow })
set_highlight("QuickFixLine", { fg = colors.base03, bg = colors.yellow })
set_highlight("Special", { fg = colors.orange })
set_highlight("StatusLine", { fg = colors.base2, bg = colors.base02 })
set_highlight("StatusLineNC", { fg = colors.base00, bg = colors.base02 })
set_highlight("String", { fg = colors.cyan })
set_highlight("Statement", { fg = colors.green })
set_highlight("TabLine", { fg = colors.base00, bg = colors.base02 })
set_highlight("TabLineSel", { fg = colors.base2, bg = colors.base02 })
set_highlight("TabLineFill", { fg = colors.base00, bg = colors.base02 })
set_highlight("Title", { fg = colors.orange, bold = true })
set_highlight("Type", { fg = colors.yellow })
set_highlight("@variable", { fg = colors.base1 })
