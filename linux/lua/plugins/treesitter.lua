local Plugin = { "nvim-treesitter/nvim-treesitter" }

Plugin.build = ":TSUpdate"

Plugin.config = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "c", "cpp", "rust", "python" },
		auto_install = false,
		highlight = { enabled = true, additional_vim_regex_highlighting = false },
		indent = { enabled = false },
		autotag = { enabled = false },
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
