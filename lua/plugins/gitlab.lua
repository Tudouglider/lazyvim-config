return {
  "harrisoncramer/gitlab.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "stevearc/dressing.nvim", -- 推荐，美化选择器界面
    "nvim-tree/nvim-web-devicons", -- 推荐，显示文件图标
  },
  build = function()
    -- 这一步会编译插件的 Go 后端，必须执行
    require("gitlab.server").build(true)
  end,
  config = function()
    -- 基础配置（认证部分我们下一步单独做）
    require("gitlab").setup()
  end,
}
