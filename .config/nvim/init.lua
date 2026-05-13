-- ~/.config/nvim/init.lua

------------------------------------------------------------
-- BASIC OPTIONS
------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.env.COLORTERM = "truecolor"
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.termguicolors  = true
vim.opt.cursorline     = true
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.clipboard      = "unnamedplus"
vim.opt.signcolumn     = "yes"
vim.opt.scrolloff      = 8

-- >>> SWAP FILE FIX <<<
vim.opt.swapfile = false        -- no more swap file conflicts
vim.opt.backup   = false
vim.opt.undofile = true         -- persistent undo across sessions (better than swap)
vim.opt.undodir  = vim.fn.stdpath("data") .. "/undo"


-- Force nvim's terminal to use fish
vim.opt.shell = "/usr/bin/fish"
------------------------------------------------------------
-- BOOTSTRAP LAZY.NVIM
------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

------------------------------------------------------------
-- LOAD PLUGINS (each file in lua/plugins/ is auto-loaded)
------------------------------------------------------------
require("lazy").setup("plugins")
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-f>', builtin.live_grep, { desc = 'Telescope live grep' })


------------------------------------------------------------
-- KEYMAPS (Ctrl+a prefix, tmux-style)
------------------------------------------------------------
local map = vim.keymap.set



-- Ctrl+a then o/p → cycle buffer tabs
map("n", "<C-a>o", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer tab" })
map("n", "<C-a>p", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })

-- Ctrl+a then k/l → create splits
map("n", "<C-a>k", "<cmd>split<cr>",  { desc = "Horizontal split" })
map("n", "<C-a>l", "<cmd>vsplit<cr>", { desc = "Vertical split" })

-- Ctrl+a then n → new empty tab, m → close current tab
map("n", "<C-a>m", "<cmd>enew<cr>",     { desc = "New empty buffer tab" })
map("n", "<C-a>n", "<cmd>bdelete<cr>",  { desc = "Close current buffer tab" })

-- Ctrl+a then arrow keys → move between splits
map("n", "<C-a><Left>",  "<C-w>h", { desc = "Move to left split" })
map("n", "<C-a><Down>",  "<C-w>j", { desc = "Move to lower split" })
map("n", "<C-a><Up>",    "<C-w>k", { desc = "Move to upper split" })
map("n", "<C-a><Right>", "<C-w>l", { desc = "Move to right split" })

-- Ctrl+a then c → close current split
map("n", "<C-a>c", "<cmd>close<cr>", { desc = "Close current split" })


-- -- Other keymaps to make my like easi er
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Better escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)
keymap("v", "p", '"_dP', default_opts)
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)
