local Plugin = { "akinsho/bufferline.nvim" }

Plugin.dependencies = { "nvim-tree/nvim-web-devicons" }

Plugin.version = "*"

Plugin.config = function()
	require("bufferline").setup()
end

return Plugin
