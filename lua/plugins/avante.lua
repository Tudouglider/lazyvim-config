return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  build = "make",
  opts = {
    -- 默认用 DeepSeek（你说能工作）
    provider = "deepseek",

    -- 自动补全用快的本地 9B（或改成 "ollama" 统一用 35B）
    auto_suggestions_provider = "ollama",

    providers = {
      -- DeepSeek 保持不变
      deepseek = {
        __inherited_from = "openai",
        endpoint = "https://api.deepseek.com/v1",
        model = "deepseek-chat",
        api_key_name = "DEEPSEEK_API_KEY",
        timeout = 30000,
      },

      -- Ollama 内置 provider（官方推荐，无需自定义 ollama_9b/35b）
      ollama = {
        -- endpoint 无 /v1（关键！）
        endpoint = "http://127.0.0.1:11434",
        model = "qwen3.5:9b",  -- 默认用 9B；想用 35B 就改这里，或动态切换
        max_tokens = 8192,
        timeout = 30000,
        -- Ollama 专属 options（num_ctx 等放这里）
        options = {
          num_ctx = 65536,       -- 64k for 9B
          temperature = 0.2,
          num_thread = 8,        -- M4 Mac Mini 合适
        },
        -- 必须加这个检查 Ollama 是否活着（防 404/连接错）
        is_env_set = function()
          return require("avante.providers").ollama.check_endpoint_alive("http://127.0.0.1:11434")
        end,
      },
    },

    behaviour = {
      auto_suggestions = false,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },

    windows = {
      sidebar = { width = 38 },
    },

    mappings = {
      ask = "<leader>aa",
      edit = "<leader>ae",
      refresh = "<leader>ar",
    },
  },

  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    { "nvim-tree/nvim-web-devicons" },
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = { insert_mode = true },
        },
      },
    },
  },
}
