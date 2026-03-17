return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  build = "make",
  opts = {
    -- 1. 设置主 provider
    provider = "ollama",
    auto_suggestions_provider = "ollama",
    icon_provider = "mini", 

    -- 2. 配置本地 Ollama
    providers = {
      ollama = {
        ["local"] = true,
        endpoint = "http://127.0.0.1:11434/v1",
        model = "qwen3.5:35b",
        parse_curl_args = function(opts, code_opts)
          return {
            url = opts.endpoint .. "/chat/completions",
            headers = {
              ["Accept"] = "application/json",
              ["Content-Type"] = "application/json",
            },
            body = {
              model = opts.model,
              -- 【核心修复】传入 opts 和 code_opts 两个参数，解决 nil value 报错
              messages = require("avante.providers").openai.parse_messages(opts, code_opts),
              max_tokens = 16384,
              stream = true,
            },
          }
        end,
        parse_stream_data = function(data, handler_opts)
          require("avante.providers").openai.parse_stream_data(data, handler_opts)
        end,
      },
    },
    
    mappings = {
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    { "nvim-mini/mini.icons" }, 
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
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      opts = function(_, opts)
        table.insert(opts.sources, { name = "avante" })
      end,
    },
  },
}
