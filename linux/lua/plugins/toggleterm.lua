local Plugin = { "akinsho/toggleterm.nvim" }

Plugin.version = "*"

Plugin.config = function()
	require("toggleterm").setup()
end

return Plugin
