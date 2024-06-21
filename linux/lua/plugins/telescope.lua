local Plugin = { "nvim-telescope/telescope.nvim" }

Plugin.tag = "0.1.5"

Plugin.dependencies = { "nvim-lua/plenary.nvim" }

Plugin.config = function()
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>p", builtin.find_files, {})
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
	vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
end

return Plugin
