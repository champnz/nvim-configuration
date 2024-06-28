local Plugin = { "stevearc/overseer.nvim" }

Plugin.config = function()
	require("overseer").setup()
end

Plugin.opts = {}

return Plugin
