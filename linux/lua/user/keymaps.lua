vim.keymap.set('n', '<F2>', require('nvim-tree.api').tree.toggle)
vim.keymap.set('n', '<A-F>', '<cmd>Format<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-o>', '<cmd>OverseerToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-r>', '<cmd>OverseerRun<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-t>', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<cmd>OverseerLoadBundle<CR>', { noremap = true, silent = true })

if vim.g.neovide then
	vim.keymap.set('n', '<F11>',
		function()
			vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
		end,
		{ noremap = true, silent = true }
	)
	vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
	vim.keymap.set('v', '<D-c>', '"+y') -- Copy
	vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
	vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
	vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
	vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end