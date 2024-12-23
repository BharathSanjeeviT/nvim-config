vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.guicursor = ""

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
	{ import = "bharath.plugins" },
})

function Opncpp()
	vim.cmd("edit out.txt")
	local out_win_id = vim.fn.win_getid()
	vim.cmd("vsp main.cpp")
	local main_win_id = vim.fn.win_getid()
	vim.fn.win_gotoid(out_win_id)
	vim.cmd("split in.txt")
	vim.fn.win_gotoid(main_win_id)
	vim.cmd("vertical resize 98")
end

vim.api.nvim_set_keymap("n", "<Leader>oc", ":lua Opncpp()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>p", ":Copilot disable<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
	"n",
	"<leader>cc",
	":FloatermNew g++ -DSMELLY_CODE -std=c++17 -Wall -Wextra main.cpp -o main && ./main < in.txt > out.txt<CR>",
	{ noremap = true, silent = true }
)

-- Navigate splits using Ctrl + h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><leader>", ":noh<CR>", { noremap = true, silent = true })

-- tab space to 2
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
