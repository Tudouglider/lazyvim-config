-- ~/.config/nvim/lua/plugins/undotree.lua
return {
  "mbbill/undotree",
  keys = {
    { "<leader>U", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
  },
  config = function()
    vim.g.undotree_WindowLayout = 2 -- 窗口布局样式
    vim.g.undotree_SplitWidth = 30 -- 窗口宽度
    vim.g.undotree_DiffpanelHeight = 10 -- 差异面板高度
    vim.g.undotree_SetFocusWhenToggle = 1 -- 打开时自动聚焦
  end,
}
