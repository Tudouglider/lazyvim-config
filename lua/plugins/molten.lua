return {
  "benlubas/molten-nvim",
  build = ":UpdateRemotePlugins",
  keys = {
    { "<leader>mi", ":MoltenInit<CR>", desc = "Initialize Molten" },
    { "<leader>er", ":MoltenEvaluateOperator<CR>", desc = "Evaluate Operator" },
    { "<leader>es", ":MoltenEvaluateVisual<CR>", mode = "v", desc = "Evaluate Visual" },
    { "<leader>rd", ":MoltenDelete<CR>", desc = "Delete Cell" },
    { "<leader>oh", ":MoltenHideOutput<CR>", desc = "Hide Output" },
  },
}
