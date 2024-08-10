local Mason = { "williamboman/mason.nvim" }

Mason.config = function()
	require("mason").setup()
end

local MasonLspConfig = { "williamboman/mason-lspconfig.nvim" }

MasonLspConfig.config = function()
	require("mason-lspconfig").setup({})
end

return { Mason, MasonLspConfig }
