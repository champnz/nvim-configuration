local Plugin = { "nvim-tree/nvim-web-devicons" }

Plugin.config = function()
	require("nvim-web-devicons").setup({
		color_icons = true,
		default = true,
		strict = true,
	})
end

return Plugin
