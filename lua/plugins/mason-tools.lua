-- ~/.config/nvim/lua/plugins/mason-tools.lua
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {

        -- ====================
        -- LSP (Language Server)
        -- ====================
        "pyright",       -- Python LSP
        "clangd",             -- C / C++ LSP
        "gopls",              -- Go LSP
        "json-lsp",           -- JSON LSP
        "lua-language-server",-- Lua LSP
        "marksman",           -- Markdown LSP
        "rust-analyzer",      -- Rust LSP
        "taplo",              -- TOML LSP

        -- ====================
        -- Protobuf / CLI
        -- ====================
        "buf",                -- protobuf CLI 工具 (lint / generate / breaking)

        -- ====================
        -- Formatter / Linter
        -- ====================
        "clang-format",
        "gofumpt",
        "goimports",
        "golangci-lint",
        "prettierd",
        "ruff",
        "shfmt",
        "stylua",

        -- ====================
        -- Markdown
        -- ====================
        "markdownlint-cli2",
        "markdown-toc",

        -- ====================
        -- Debug / DAP
        -- ====================
        "codelldb",

        -- ====================
        -- Other / misc
        -- ====================
        "tree-sitter-cli",
      },

      -- 新设备打开 nvim 自动安装缺失工具
      run_on_start = true,
    },
  },
}
