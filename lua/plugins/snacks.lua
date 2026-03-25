-- ~/.config/nvim/lua/plugins/snacks.lua
return {
  "folke/snacks.nvim",
  opts = {
    -- 启用 image 模块
    image = { enabled = true },
    -- 如果你还需要其他模块，也可以在这里开启
    -- bigfile = { enabled = true },
    dashboard = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          layout = { preset = "sidebar", position = "left" }, -- 侧边栏布局
        },
      },
      -- 让文件选择器也显示隐藏文件
      files = { hidden = true },
      -- grep 时也包含隐藏文件
      grep = { hidden = true },
    },
    -- 等等
  },
}
