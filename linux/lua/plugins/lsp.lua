local CmpNvimLsp = { "hrsh7th/cmp-nvim-lsp" }

local LspKind = { "onsails/lspkind.nvim" }

local LuaSnip = { "L3MON4D3/LuaSnip" }

LuaSnip.dependencies = {
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
}

local NvimCmp = { "hrsh7th/nvim-cmp" }

NvimCmp.config = function()
	local cmp = require("cmp")
	require("luasnip.loaders.from_vscode").lazy_load()
	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" }, -- For luasnip users.
		}, {
			{ name = "buffer" },
		}),
	})
end

local NvimLspConfig = { "neovim/nvim-lspconfig" }

NvimLspConfig.config = function()
	local lspconfig = require("lspconfig")
	lspconfig.lua_ls.setup({})

	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.code_action, {})
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
	vim.keymap.set("n", "<C-i>", vim.lsp.buf.format)
end

return { CmpNvimLsp, LspKind, LuaSnip, NvimCmp, NvimLspConfig }
