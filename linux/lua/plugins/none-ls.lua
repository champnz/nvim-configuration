local Plugin = { "nvimtools/none-ls.nvim" }

Plugin.config = function()
	local null_ls = require("null-ls")
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.black,
		},
	})
end

return Plugin
