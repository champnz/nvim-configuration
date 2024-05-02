local Plugin = {'nvim-tree/nvim-tree.lua'}

Plugin.version = "*"

Plugin.lazy = false

Plugin.config = function()
	require("nvim-tree").setup()
end

return Plugin
