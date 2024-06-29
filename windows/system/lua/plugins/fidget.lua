local Plugin = { "j-hui/fidget.nvim" }

Plugin.opts = {}

Plugin.config = function()
	require("fidget").setup({
		notification = {
			window = {
				winblend = 0,
			},
		},
	})
end

return Plugin
