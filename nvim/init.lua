vim.diagnostic.config({
	virtual_text = true, -- Show diagnostics as virtual text under symbols
	signs = true,
	underline = true,
	update_in_insert = true,
})
vim.lsp.inlay_hint.enable(true)
vim.g.mapleader = " "
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "LazyVim/LazyVim", import = "lazyvim.plugins", priority = 10000, lazy = false },
	{ import = "plugins", priority = 1000, lazy = false },
})

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4 -- A TAB character looks like 4 spaces
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.opt.swapfile = false
vim.opt.foldlevelstart = 999

-- nvim-tree binds
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>E", ":cd %:h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>w", "<C-w>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gc", ":CopilotChatToggle<CR><C-w>L", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fF", ":LazyFormat<CR>", { noremap = true, silent = true })

-- telescope binds
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
