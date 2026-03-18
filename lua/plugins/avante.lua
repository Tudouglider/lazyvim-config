return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,  -- 保持最新版

  opts = {
    provider = "openai",  -- 还是用 "openai" 作为 provider 名，但实际指向 DeepSeek

    providers = {
      openai = {  -- 这里是必须的 providers.openai
        endpoint = "https://api.deepseek.com/v1",
        model = "deepseek-chat",  -- 或 "deepseek-coder" 如果你偏代码
        api_key_name = "DEEPSEEK_API_KEY",  -- 环境变量（推荐）
        -- api_key_name = "sk-你的key"  -- 如果硬编码（不推荐）
        timeout = 30000,  -- 毫秒

        extra_request_body = {  -- 所有请求体参数移到这里！
          temperature = 0.3,
          max_tokens = 8192,  -- 注意：现在是 max_tokens，不是 max_completion_tokens（DeepSeek 用这个）
        },
      },
    },

    -- auto-suggestions 用同一个 provider（DeepSeek 便宜，够用）
    auto_suggestions_provider = "openai",

    behaviour = {
      auto_suggestions = false,  -- 建议关掉，省 token；需要时手动触发
      auto_apply_diff_after_generation = false,
    },

    windows = {
      sidebar = {
        width = 35,
      },
    },

    mappings = {
      ask = "<leader>aa",
      edit = "<leader>ae",
      refresh = "<leader>ar",
    },
  },

  build = "make",  -- 如果有 Rust 依赖

  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",

    -- 可选：图片支持（markdown 中渲染生成的图片）
    -- 如果你不需要，就删掉这一段
    {
      "3rd/image.nvim",
      opts = {
        backend = "kitty",  -- 或 "ueberzug" / "iterm2" 等，根据你的终端
        integrations = {
          markdown = {
            enabled = true,
          },
        },
        -- 其他 image.nvim 的选项...
      },
    },
  },
}
