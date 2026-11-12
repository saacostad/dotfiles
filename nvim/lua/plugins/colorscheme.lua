return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        color_overrides = {
          mocha = {
            rosewater = "#ffeee8",
            flamingo  = "#ffdacd",
            pink      = "#ffd3c9",
            mauve     = "#ffaa9f",
            red       = "#ff9977",
            maroon    = "#f9ac91",
            peach     = "#ffc0a0",
            yellow    = "#ffeee5",
            green     = "#ffd9b6",
            teal      = "#ffdb94",
            sky       = "#e1df87",
            sapphire  = "#f2b2f2",
            blue      = "#ffa2bd",
            lavender  = "#ffbcbb",

            text      = "#f8e1d6",
            subtext1  = "#bca79d",
            subtext0  = "#847269",
            overlay2  = "#74645b",
            overlay1  = "#63544d",
            overlay0  = "#534740",
            surface2  = "#443933",
            surface1  = "#342b27",
            surface0  = "#241c18",

            base      = "#130d0a",
            mantle    = "#130d0a",
            crust     = "#120c09",
          },
        },
        integrations = {
          nvimtree = true,
          window_picker = true,
          telescope = true,
          bufferline = true,
          -- you can enable other integrations here (which_key, etc.)
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
