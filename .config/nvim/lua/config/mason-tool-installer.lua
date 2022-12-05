require("mason-tool-installer").setup({
  ensure_installed = {
    "bash-language-server",
    "typescript-language-server",
    "angular-language-server",
    "html-lsp",
    "css-lsp",
    "vim-language-server",
    "yaml-language-server",
    "json-lsp",
    "lua-language-server",
    "clangd",
    "taplo",
    "tailwindcss-language-server",
    -- formatters
    "sql-formatter",
    "prettierd",
    "stylua",
  }
})
