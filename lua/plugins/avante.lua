return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  build = "make",
  opts = {
    provider = "deepseek", 
    auto_suggestions_provider = "ollama_9b", 
    
    providers = {
      -- 1. DeepSeek (标准 OpenAI)
      deepseek = {
        __inherited_from = "openai",
        endpoint = "https://api.deepseek.com/v1",
        model = "deepseek-chat",
        api_key_name = "DEEPSEEK_API_KEY",
        timeout = 30000,
      },

      -- 2. Ollama 9B (通过 OpenAI 协议伪装，确保 API 完整)
      ollama_9b = {
        __inherited_from = "openai", -- 继承以获取所有内部方法
        ["local"] = true,
        endpoint = "http://127.0.0.1:11434/v1", -- 注意：v1 才能配合 openai 继承
        model = "qwen3.5:9b",
        api_key_name = "", -- 必须留空字符串以跳过检查
        timeout = 30000,
        -- 重要：手动注入 Ollama 特有的 options 字段
        extra_request_body = {
          options = {
            num_ctx = 65536, -- 强制 64K
            temperature = 0.2,
          },
        },
      },

      -- 3. Ollama 35B
      ollama_35b = {
        __inherited_from = "openai",
        ["local"] = true,
        endpoint = "http://127.0.0.1:11434/v1",
        model = "qwen3.5:35b",
        api_key_name = "", -- 必须留空字符串以跳过检查
        timeout = 30000,
        extra_request_body = {
          options = {
            num_ctx = 8192, -- 8K
            temperature = 0.1,
          },
        },
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
    "nvim-tree/nvim-web-devicons", 
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
