vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		if not (vim.fn.argc() == 0) then -- has room for improvement
			vim.cmd.cd(vim.fn.expand('%:h'))
		end

		require("nvim-tree.api").tree.open()
	end
})

vim.cmd("colorscheme gruvbox")