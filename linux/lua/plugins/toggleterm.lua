local Plugin = { "akinsho/toggleterm.nvim" }

Plugin.version = "*"

Plugin.config = function()
	require("toggleterm").setup({
		direction = "float",
		float_opts = {
			border = "curved",
			winblend = 0,
		}
	})
end

return Plugin
