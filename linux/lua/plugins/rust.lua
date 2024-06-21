local Plugin = { "mrcjkb/rustaceanvim" }

Plugin.version = "^4" -- Recommended

Plugin.lazy = false -- This plugin is already lazy

Plugin.config = function()
	vim.lsp.inlay_hint.enable(true)
end

return Plugin
