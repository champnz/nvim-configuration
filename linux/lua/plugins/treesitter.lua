local Plugin = { "nvim-treesitter/nvim-treesitter" }

Plugin.build = ":TSUpdate"

Plugin.config = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "c", "cpp", "rust", "python" },
		auto_install = false,
		highlight = { enable = true, additional_vim_regex_highlighting = false },
		indent = { enable = false },
		autotag = { enable = false },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-n>",
				node_incremental = "<C-n>",
				scope_incremental = "<C-s>",
				node_decremental = "<C-m>",
			}
		}
	})
end

return Plugin
