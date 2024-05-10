vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.wo.wrap = false

if vim.g.neovide then
	vim.o.guifont = "JetBrains_Mono:h11"
	vim.g.neovide_transparency = 0.85
end