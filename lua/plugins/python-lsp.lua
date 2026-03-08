-- ~/.config/nvim/lua/plugins/python-lsp.lua
return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- 删除默认 pyright
    opts.servers["pyright"] = nil

    -- 添加 basedpyright
    opts.servers["basedpyright"] = {}
  end,
}
