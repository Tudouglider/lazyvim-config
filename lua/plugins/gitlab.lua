-- ~/.config/nvim/lua/plugins/gitlab.lua
return {
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "stevearc/dressing.nvim",
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
       -- 主入口：选择 MR
       { "<leader>G", function() require("gitlab").choose_merge_request() end, desc = "GitLab: Choose MR" },

       -- MR 操作
	  { "<leader>Gl", function() require("gitlab").choose_merge_request() end, desc = "List MRs" },  -- 复用选择器
	  { "<leader>Gr", function() require("gitlab").review() end, desc = "Review MR" },
	  { "<leader>Gc", function() require("gitlab").create_mr() end, desc = "Create MR" },
	  { "<leader>Ga", function() require("gitlab").approve() end, desc = "Approve MR" },
	  { "<leader>Gm", function() require("gitlab").merge() end, desc = "Merge MR" },

	  -- 其他功能
	  { "<leader>Go", function() require("gitlab").open_in_browser() end, desc = "Open in Browser" },
	  { "<leader>Gp", function() require("gitlab").pipeline() end, desc = "Pipelines" },

	  -- Diffview 相关（独立插件，保持原命令）
	  { "<leader>Gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview" },
	  { "<leader>Gf", "<cmd>DiffviewFileHistory<cr>", desc = "File History" },
    }, 
  },
}
