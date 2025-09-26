local BlinkCmp = {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },

	version = '1.*',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = 'enter',
		},

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = 'mono'
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = { documentation = { auto_show = false } },

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" }
}

local NvimLspConfig = { "neovim/nvim-lspconfig" }

NvimLspConfig.config = function()
	local capabilities = require('blink.cmp').get_lsp_capabilities()

	-- decide which python executable to use for mypy
	local py_path = nil
	local venv_path = os.getenv("VIRTUAL_ENV")
	if venv_path ~= nil then
		py_path = venv_path .. "/bin/python3"
	else
		py_path = vim.g.python3_host_prog
	end

	-- ufo requires this
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	vim.lsp.config['clangd'] = {
		capabilities = capabilities,
	}
	vim.lsp.config['pylsp'] = {
		capabilities = capabilities,
		settings = {
			pylsp = {
				plugins = {
					-- formatter/linter
					ruff = {
						enabled = true,
						extendSelect = { "I" },
						formatEnabled = true,
						lineLength = 88,
					},
					-- type checker
					pylsp_mypy = {
						enabled = true,
						overrides = {
							"--python-executable",
							py_path,
							true,
						},
						report_progress = true,
						live_mode = false,
					},
					-- auto-completion options
					jedi_completion = {
						enabled = true,
						fuzzy = true,
						include_params = true,
					},
				}
			}
		}
	}

	vim.lsp.enable('clangd')
	vim.lsp.enable('pylsp')
end

return { BlinkCmp, NvimLspConfig }
