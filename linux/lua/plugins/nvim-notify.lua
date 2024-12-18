local Plugin = { "rcarriga/nvim-notify" }

Plugin.config = function()
	vim.notify = require("notify")
end

return Plugin
