local Plugins = {
	{
		'stevearc/dressing.nvim',
		opts = {},
	},
	{
		'rcarriga/nvim-notify',
		config = function()
			vim.notify = require("notify")
		end,
	},
}

return Plugins
