-- Only run linters named in ale_linters settings.
vim.g.ale_linters_explicit = 1

-- Set this variable to 1 to fix files when you save them.
vim.g.ale_fix_on_save = 1

-- Linter/Fixer specific options
vim.g.ale_lua_selene_options = "--config ~/selene.toml"
vim.g.ale_lua_stylua_options = "--search-parent-directories"
vim.g.ale_ruby_rubocop_executable = "bundle"
vim.g.ale_ruby_standardrb_executable = "bundle"

-- Check files
vim.g.ale_linters = {
  ansible = { "ansible_lint" },
  circleci = { "circleci" },
  cloudformation = { "cfn-lint" },
  cs = { "OmniSharp" },
  css = { "stylelint" },
  envconfig = { "dotenv-linter" },
  githubaction = { "actionlint" },
  haskell = { "ghc" },
  javascript = { "eslint", "prettier" },
  json = { "jq" },
  lua = { "luac", "luacheck", "selene" },
  python = { "mypy", "ruff" },
  ruby = { "standardrb" },
  sh = { "shellcheck" },
  terraform = { "terraform", "tflint" },
  typescript = { "eslint", "tsserver" },
  typescriptreact = { "eslint", "tsserver" },
  vim = { "vint" },
  yaml = { "yamllint" },
}

-- Fix files
vim.g.ale_fixers = {
  beancount = { "bean-format" },
  cs = { "dotnet-format" },
  css = { "prettier", "stylelint" },
  javascript = { "eslint" },
  json = { "jq" },
  lua = { "stylua" },
  python = { "ruff" },
  ruby = { "standardrb" },
  terraform = { "terraform" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
}
