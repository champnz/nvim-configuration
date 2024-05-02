vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.wo.wrap = false

if vim.g.neovide then
	vim.o.guifont = "JetBrains_Mono:h11"
	vim.g.neovide_transparency = 0.85

	vim.keymap.set('n', '<F11>',
		function()
			vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
		end,
		{ noremap = true, silent = true }
	)
end