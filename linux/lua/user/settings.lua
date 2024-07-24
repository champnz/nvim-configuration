vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

vim.opt.termguicolors = true

vim.wo.wrap = false
vim.wo.number = true

if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono_Nerd_Font:h11"
	vim.g.neovide_transparency = 0.85
end
