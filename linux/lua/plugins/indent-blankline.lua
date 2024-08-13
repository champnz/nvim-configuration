local Plugin = { "lukas-reineke/indent-blankline.nvim" }

Plugin.main = "ibl"

Plugin.opts = {}

Plugin.config = function()
        require("ibl").setup({
                exclude = {
                        filetypes = { "help", "dashboard", "packer", "NvimTree", "Trouble", "TelescopePrompt", "Float" },
                        buftypes = { "terminal", "nofile", "telescope" },
                },
                indent = {
                        char = "│",
                },
                scope = {
                        enabled = false,
                        show_start =false,
                },
        })
end

return Plugin
