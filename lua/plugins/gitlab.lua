-- ~/.config/nvim/lua/plugins/gitlab.lua
return {
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-mini/mini.icons",
    },
    build = function()
      require("gitlab.server").build()
    end,
    config = function()
      require("gitlab").setup({
        url = "https://gitlab.clounix.com",
        auth_provider = function()
          return { token = vim.env.GITLAB_TOKEN }
        end,
        log_path = vim.fn.stdpath("cache") .. "/gitlab.nvim.log",
        reviewer_settings = {
          diffview = {
            imply_local = false,
          },
        },
      })
    end,
    keys = {
      -- 主入口
      { "<leader>G", "<cmd>GitLab<cr>", desc = "GitLab" },
      
      -- MR 操作
      { "<leader>Gl", "<cmd>GitLab mr list<cr>", desc = "List MRs" },
      { "<leader>Gr", "<cmd>GitLab mr review<cr>", desc = "Review MR" },
      { "<leader>Gc", "<cmd>GitLab mr create<cr>", desc = "Create MR" },
      { "<leader>Gv", "<cmd>GitLab mr view<cr>", desc = "View MR" },
      { "<leader>Ga", "<cmd>GitLab mr approve<cr>", desc = "Approve MR" },
      { "<leader>Gm", "<cmd>GitLab mr merge<cr>", desc = "Merge MR" },
      
      -- Issue
      { "<leader>Gi", "<cmd>GitLab issue list<cr>", desc = "List Issues" },
      { "<leader>Gt", "<cmd>GitLab issue create<cr>", desc = "New Issue" },
      
      -- Pipeline
      { "<leader>Gp", "<cmd>GitLab pipeline<cr>", desc = "Pipelines" },
      
      -- 其他
      { "<leader>Go", "<cmd>GitLab open<cr>", desc = "Open in Browser" },
      { "<leader>Gs", "<cmd>GitLab snippet<cr>", desc = "Snippets" },
      
      -- 独立 diffview
      { "<leader>Gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview" },
      { "<leader>Gf", "<cmd>DiffviewFileHistory<cr>", desc = "File History" },
    },
  },
}
