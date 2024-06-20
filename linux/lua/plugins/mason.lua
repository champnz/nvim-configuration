local Mason = { "williamboman/mason.nvim" }

Mason.config = function()
	require("mason").setup()
end

local MasonLspConfig = { "williamboman/mason-lspconfig.nvim" }

MasonLspConfig.config = function()
	require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls" },
	})
end

return { Mason, MasonLspConfig }
