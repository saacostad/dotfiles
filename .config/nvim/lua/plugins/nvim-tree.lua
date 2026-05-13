-- ~/.config/nvim/lua/plugins/nvim-tree.lua

return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.g.loaded_netrw       = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
	renderer = {
          root_folder_label = true, 
          highlight_git = true,
          indent_markers = {
            enable = true, -- Adds vertical lines to show nesting
            icons = {
              corner = "└",
              edge = "│",
              item = "│",
              bottom = "─",
              none = " ",
            },
          },
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = false, -- Cleaner look without arrows
              git = true,
            },
            glyphs = {
              folder = {
                arrow_closed = "󰅂", -- Arrow icon if you keep them
                arrow_open = "󰅀",
                default = "󰉋",
                open = "󱁉",
                empty = "󰒺",
                empty_open = "󰒺",
                symlink = "󰉿",
                symlink_open = "󰉿",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
        view = {
          width = 35,
          side = "left",
          -- Removes line numbers for a cleaner look
          number = false,
          relativenumber = false,
        },
        -- Flattens empty folders (e.g., java/com/google becomes one line)
        renderer = {
            group_empty = true,
        },
        filters = {
          dotfiles = false,
          custom = { ".DS_Store" }, -- Hide annoying system files
        },
        git = {
          enable = true,
          ignore = false,
        },

      })

      vim.keymap.set("n", "<S-Tab>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })
      vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<cr>", { desc = "Find current file in tree" })
    end,
  },
}
