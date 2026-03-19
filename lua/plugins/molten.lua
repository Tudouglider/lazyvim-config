return {
  "benlubas/molten-nvim",
  build = ":UpdateRemotePlugins",
  keys = {
    -- 所有的 Molten 操作现在都统一在 <leader>m 菜单下
    { "<leader>mi", ":MoltenInit<CR>", desc = "Initialize Molten" },
    { "<leader>me", ":MoltenEvaluateOperator<CR>", desc = "Evaluate Operator (Run)" },
    { "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", mode = "v", desc = "Evaluate Visual (Run Selection)" },
    { "<leader>mr", ":MoltenReevaluateCell<CR>", desc = "Re-evaluate Cell" },
    { "<leader>mo", ":noautocmd MoltenEnterOutput<CR>", desc = "Enter Output Window" },
    { "<leader>md", ":MoltenDelete<CR>", desc = "Delete Output" },
    { "<leader>mh", ":MoltenHideOutput<CR>", desc = "Hide/Show Output" },
    { "<leader>mc", ":MoltenHideOutput<CR>", desc = "Clear/Hide All Output" },
    { "<leader>mX", ":MoltenHideOutput<CR>:noautocmd MoltenDeinit<CR>:MoltenInit<CR>", desc = "Hard Reset Molten UI" },
  },
  init = function()
    -- 注册 Which-key 菜单组名称
    -- 这样你按 <leader> 之后，菜单会显示 m -> +molten/jupyter
    vim.schedule(function()
      require("which-key").add({
        { "<leader>m", group = "molten/jupyter" },
      })
    end)

    -- 针对 M4 Pro 的基础性能配置
    vim.g.molten_auto_open_output = true     -- 运行后不自动跳到输出窗口，保持焦点在代码
    vim.g.molten_output_win_max_height = 16   -- 调高输出窗口高度，方便看量化指标
    vim.g.molten_wrap_output = true          -- 自动换行
    vim.g.molten_virt_text_output = false      -- 在行尾显示虚拟文本输出
  end,
}
