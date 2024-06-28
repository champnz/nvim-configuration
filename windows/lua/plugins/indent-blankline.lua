local Plugin = { "shellRaining/hlchunk.nvim" }

Plugin.event = { "BufReadPre", "BufNewFile" }

Plugin.config = function()
	require("hlchunk").setup({
		indent = {
			enable = true,
			priority = 10,
			style = { vim.api.nvim_get_hl(0, { name = "Whitespace" }) },
			use_treesitter = false,
			chars = { "│" },
			ahead_lines = 5,
		},
	})
end

return Plugin
