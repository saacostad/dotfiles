return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local base_bg = "#1e1e2e"     -- Your main terminal background
      local selection_bg = "#313244" -- The highlight color for the active tab
      local inactive_fg = "#6c7086"  -- Dimmed text color

      require("bufferline").setup({
        options = {
          mode = "buffers",
          -- 1. Completely disable separator logic
          separator_style = "none", 
          show_buffer_close_icons = false,
          show_close_icon = false,
          diagnostics = "nvim_lsp",
          offsets = {
            {
              filetype = "NvimTree",
              text = "Directory",
              highlight = "Directory",
              separator = false, -- Kill the line after the file tree
            },
          },
        },
	highlights = {
		-- 2. FORCE THE BACKGROUND: This kills the "shades of gray"
		fill = { bg = base_bg }, -- The empty bar space
		background = { bg = base_bg, fg = inactive_fg }, -- Inactive tabs
		buffer_visible = { bg = base_bg, fg = inactive_fg },

		-- 3. KILL THE SEPARATORS: This removes the white line in image_714e40.png
		-- Even with separator_style = "none", sometimes the highlight group 
		-- persists; setting fg/bg to the same color makes it invisible.
		separator = { fg = base_bg, bg = base_bg },
		separator_visible = { fg = base_bg, bg = base_bg },
		separator_selected = { fg = selection_bg, bg = selection_bg },

		-- 4. ACTIVE TAB: The only one that should stand out
		buffer_selected = { 
			bg = selection_bg, 
			fg = "#cdd6f4", 
			bold = true,
		},
		-- This is the blue vertical bar on the left of the active tab. 
		-- Set bg to selection_bg so it doesn't create a "gap".
		indicator_selected = { fg = "#89b4fa", bg = selection_bg },

		-- 5. SUB-ELEMENTS: Ensure icons don't have their own backgrounds
		modified = { bg = base_bg },
		modified_selected = { bg = selection_bg },
		duplicate = { bg = base_bg, fg = inactive_fg },
		duplicate_selected = { bg = selection_bg },

		-- 6. DIAGNOSTICS: Match the tab backgrounds
		error = { bg = base_bg },
		error_selected = { bg = selection_bg },
		warning = { bg = base_bg },
		warning_selected = { bg = selection_bg },
		hint = { bg = base_bg },
		hint_selected = { bg = selection_bg },
		info = { bg = base_bg },
		info_selected = { bg = selection_bg },
		info_diagnostic_selected = { bg = selection_bg },
	},
})

      -- Keymaps (Kept simple)
      local map = vim.keymap.set
      map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
      map("n", "<C-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
      map("n", "<leader>bc", "<cmd>bdelete<cr>", { desc = "Close buffer" })
    end,
  },
}
