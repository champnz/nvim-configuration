local Plugin = {'nvim-tree/nvim-web-devicons'}

Plugin.config = function()
	require('nvim-web-devicons').setup({
		color_icons = true;
		default = true;
		strict = true;
		override_by_extension = {
			["rs"] = {
				icon = "",
				color = "#dea584",
				cterm_color = "216",
				name = "Rs",
			},
			["toml"] = {
				icon = "",
				color = "#9c4221",
				cterm_color = "124",
				name = "Toml",
			}
		};
	})
end

return Plugin
