-- ~/.config/nvim/lua/plugins/colorscheme.lua

return {
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background          = "soft"    -- "hard", "medium", "soft"
      vim.g.gruvbox_material_foreground           = "material" -- "material", "mix", "original"
      vim.g.gruvbox_material_transparent_background = 2       -- 0=off, 1=basic, 2=full
      vim.g.gruvbox_material_disable_italic_comment = 0
      vim.g.gruvbox_material_better_performance     = 1

      vim.cmd.colorscheme("gruvbox-material")

      -- nuke ALL backgrounds for full transparency
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

      for _, group in ipairs(groups) do
        local ok, current = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
        if ok then
          current.bg = nil
          current.ctermbg = nil
          vim.api.nvim_set_hl(0, group, current)
        else
          vim.api.nvim_set_hl(0, group, { bg = "NONE" })
        end
      end
    end,
  },
}
