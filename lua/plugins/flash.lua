-- ~/.config/nvim/lua/plugins/flash.lua
return {
  "folke/flash.nvim",
  opts = {
    search = {
      -- 如果你想保留实时搜索的视觉反馈，但禁止自动跳转，可以尝试这个：
      mode = "exact", -- 精确模式
      multi_window = true,
      wrap = true,
    },
    -- jump = {
    --  autojump = true,       -- 当仅剩一个匹配时自动跳转
    -- },
  },
}
