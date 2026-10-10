return {
  "rachartier/tiny-cmdline.nvim",
  init = function()
    vim.o.cmdheight = 0
  end,
  config = function()
    require("tiny-cmdline").setup({
      width = { value = "20%", min = 50, max = 90 },
      position = { x = "50%", y = "50%" },
      border = "rounded",
      title = { enabled = true, pos = "center" },
    })

    local function set_hl()
      local bg = "#393939"      -- cmdline background (a bit different from your editor bg)
      local accent = "#f0a96d"  -- border/title color
      vim.api.nvim_set_hl(0, "TinyCmdlineNormal", { bg = bg })
      vim.api.nvim_set_hl(0, "TinyCmdlineBorder", { fg = accent, bg = bg })
      vim.api.nvim_set_hl(0, "TinyCmdlineTitle", { fg = bg, bg = accent, bold = true })
    end

    set_hl()
    vim.api.nvim_create_autocmd("ColorScheme", { callback = set_hl })
  end,
}
