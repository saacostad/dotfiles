return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        http = {
          -- Gemma4 with thinking mode (for chat)
          ["gemma4-thinking"] = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "http://127.0.0.1:8080",   -- your server port
                api_key = "TERM",
                chat_url = "/v1/chat/completions",
              },
              parameters = {
                -- Adjust this according to your server’s expectation
                -- For Gemma, this might be `"thinking": true` or `"reasoning": true`
                chat_template_kwargs = { enable_thinking = true },
              },
              handlers = {
                parse_message_meta = function(self, data)
                  local extra = data.extra
                  -- Gemma may return reasoning under a different key
                  -- e.g. `extra.reasoning` or `extra.thoughts`
                  if extra and extra.reasoning_content then
                    data.output.reasoning = { content = extra.reasoning_content }
                    if data.output.content == "" then
                      data.output.content = nil
                    end
                  end
                  return data
                end,
              },
            })
          end,

          -- Gemma4 without thinking (for inline)
          ["gemma4-plain"] = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "http://127.0.0.1:8081",   -- a different port/instance for the non‑thinking model
                api_key = "TERM",
                chat_url = "/v1/chat/completions",
              },
              -- No chat_template_kwargs for thinking
            })
          end,
        },
      },

      interactions = {
        chat = {
          adapter = "gemma4-thinking",      -- use thinking for chat
          opts = {
            system_prompt = function()
              return [[You are a careful, senior-level programming assistant...
              (your existing prompt stays the same)]]
            end,
          },
        },
        inline = {
          adapter = "gemma4-plain",        -- use the plain adapter for inline edits
          -- Optionally, override the system prompt for inline to be even more direct
          opts = {
            system_prompt = function()
              return [[You are a code editing assistant. 
              You will be given a code selection and a request. 
              Respond ONLY with the new code that replaces the selection. 
              Do not include explanations, reasoning, or markdown formatting unless the request explicitly asks for it.]]
            end,
          },
        },
      },
    },
  },
}
