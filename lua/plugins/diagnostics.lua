return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- 在 LSP 配置选项中设置诊断显示方式
      diagnostics = {
        -- 将行内虚拟文本设置为 false，即可关闭行内提示
        virtual_text = false,
        -- 如果你也不喜欢整行下划线，也可以关闭它
        -- underline = false,
      },
    },
  },
}
