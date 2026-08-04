return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
        transparent_background = false, -- Enable Catppuccin's native transparency
        integrations = {
          nvimtree = true,
	  window_picker = true,
	  telescope = true,
	  bufferline = true
          -- you can enable other integrations here (telescope, which_key, etc.)
        },
      })

      -- Load the colorscheme
      vim.cmd.colorscheme("catppuccin")

      -- Nuke ALL backgrounds for full transparency (keeping your exact logic)
      local groups = {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "SignColumn",
        "EndOfBuffer",
        "FloatBorder",
        "WinSeparator",
        -- NvimTree
        "NvimTreeNormal",
        "NvimTreeNormalNC",
        "NvimTreeEndOfBuffer",
        "NvimTreeWinSeparator",
        "NvimTreeCursorLine",
        -- Bufferline / TabLine
        "TabLine",
        "TabLineFill",
        "TabLineSel",
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineTab",
        "BufferLineTabClose",
        "BufferLineTabSelected",
        "BufferLineTabSeparator",
        "BufferLineTabSeparatorSelected",
        "BufferLineSeparator",
        "BufferLineSeparatorSelected",
        "BufferLineSeparatorVisible",
        "BufferLineCloseButton",
        "BufferLineCloseButtonVisible",
        "BufferLineCloseButtonSelected",
        "BufferLineBufferSelected",
        "BufferLineBufferVisible",
        "BufferLineIndicatorSelected",
        "BufferLineIndicatorVisible",
        "BufferLineModified",
        "BufferLineModifiedSelected",
        "BufferLineModifiedVisible",
        "BufferLineDuplicate",
        "BufferLineDuplicateSelected",
        "BufferLineDuplicateVisible",
        "BufferLineOffsetSeparator",
      }

      -- for _, group in ipairs(groups) do
      --   local ok, current = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
      --   if ok then
      --     current.bg = nil
      --     current.ctermbg = nil
      --     vim.api.nvim_set_hl(0, group, current)
      --   else
      --     vim.api.nvim_set_hl(0, group, { bg = "NONE" })
      --   end
      -- end
    end,
  },
}
