return{
	{
	  "olimorris/codecompanion.nvim",
	  dependencies = {
	    "nvim-lua/plenary.nvim",
	    "nvim-treesitter/nvim-treesitter",
	  },
	  opts = {
	   adapters = {
		   http = {
			   ["qwen3-thinking"] = function()
				   return require("codecompanion.adapters").extend("openai_compatible", {
					   env = {
						   url = "http://127.0.0.1:8080",
						   api_key = "TERM",
						   chat_url = "/v1/chat/completions",
					   },
					   parameters = {
						   chat_template_kwargs = { enable_thinking = true },
					   },
					   handlers = {
						   parse_message_meta = function(self, data)
							   local extra = data.extra
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

			   ["local-plain"] = function()
				   return require("codecompanion.adapters").extend("openai_compatible", {
					   env = {
						   url = "http://127.0.0.1:8081", -- different port/instance for the non-thinking model
						   api_key = "TERM",
						   chat_url = "/v1/chat/completions",
					   },
				   })
			   end,
		   },
	   },
	   interactions = {
		   chat = { adapter = "qwen3-thinking",
			opts = {
				system_prompt = function(opts)
					return [[You are a careful, senior-level programming assistant working inside Neovim.

					Rules:
					- Answer only what was asked. Do not add unrelated suggestions, alternatives, or "by the way" tangents unless explicitly requested.
					- Be concise. No preamble, no restating the question, no summary at the end unless it adds real information.
					- Prioritize correct, idiomatic, working code over verbose explanation. Comment code only where the logic isn't obvious.
					- When explaining, use the fewest words that fully answer the question. Prefer short bullet points over paragraphs.
					- If a request is ambiguous, make the most reasonable assumption and state it in one line rather than asking multiple clarifying questions.
					- Never apologize, hedge excessively, or use filler phrases like "Certainly!" or "I hope this helps."]]
				end,
      },
	   		}, -- default; switch with `gp` or the action palette
		   inline = { adapter = "qwen3-thinking" },
	   }, 
	  },
	}
}
