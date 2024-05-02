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
			}
		};
	})
end

return Plugin
