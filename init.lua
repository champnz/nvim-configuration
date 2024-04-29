vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.wo.wrap = false

if vim.g.neovide then
    vim.o.guifont = "JetBrains_Mono:h11"
    vim.g.neovide_transparency = 0.85
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
	'stevearc/overseer.nvim',
	config = function()
	    require('overseer').setup()

	    vim.keymap.set('n', '<C-o>', "<cmd>OverseerToggle<CR>", {
		noremap = true,
		silent = true
	    })
	    vim.keymap.set('n', '<C-r>', "<cmd>OverseerRun<CR>", {
		noremap = true,
		silent = true
	    })
	end,
	opts = {},
    },
    {
	'stevearc/dressing.nvim',
	opts = {},
    },
    {
	'rcarriga/nvim-notify',
	config = function()
	    vim.notify = require("notify")
	end,
    },
    {
	'neoclide/coc.nvim',
	branch = 'release',
	config = function()
	    vim.keymap.set('n', 'gd', "<Plug>(coc-definition)", { noremap = true, silent = true })
	    vim.keymap.set('n', 'gy', "<Plug>(coc-type-definition)", { noremap = true, silent = true })
	    vim.keymap.set('n', 'gi', "<Plug>(coc-implementation)", { noremap = true, silent = true })
	    vim.keymap.set('n', 'gr', "<Plug>(coc-references)", { noremap = true, silent = true })

	    --vim.api.nvim_set_keymap('n', 'K',)
	    --vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>:exe "w !rustfmt" . "--edition 2015" . " > /dev/null 2>&1"<CR>', {
		--noremap = true,
		--silent = true
	    --})
	end,
    },
    {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	config = function()
	    require("nvim-tree").setup()

	    local api = require "nvim-tree.api"

	    vim.keymap.set('n', '<F2>', api.tree.toggle)
	end,
    },
    {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
	    -- Default options:
	    require("gruvbox").setup({
		terminal_colors = true, -- add neovim terminal colors
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
		    strings = true,
		    emphasis = true,
		    comments = true,
		    operators = false,
		    folds = true,
		},
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = "hard", -- can be "hard", "soft" or empty string
		palette_overrides = {},
		overrides = {},
		dim_inactive = false,
		transparent_mode = false,
	    })

	    vim.cmd("colorscheme gruvbox")
	end,
    },
    {
	'nvim-lualine/lualine.nvim',
	dependencies = {
	    'nvim-tree/nvim-web-devicons'
	},
	config = function()
	    require('lualine').setup({
		options = {
		    icons_enabled = true,
		    theme = 'auto',
		    component_separators = { left = '', right = ''},
		    section_separators = { left = '', right = ''},
		    disabled_filetypes = {
			statusline = {},
			winbar = {},
		    },
		    ignore_focus = {},
		    always_divide_middle = true,
		    globalstatus = false,
		    refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		    }
		},
		sections = {
		    lualine_a = {'mode'},
		    lualine_b = {'branch', 'diff', 'diagnostics'},
		    lualine_c = {'filename'},
		    lualine_x = {'encoding', 'fileformat', 'filetype'},
		    lualine_y = {'progress'},
		    lualine_z = {'location'}
		},
		inactive_sections = {
		    lualine_a = {},
		    lualine_b = {},
		    lualine_c = {'filename'},
		    lualine_x = {'location'},
		    lualine_y = {},
		    lualine_z = {}
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {
		    'lazy',
		    'nvim-tree',
		    'overseer',
		    'toggleterm'
		}
	    })
	end,
    },
    {
	'nvim-tree/nvim-web-devicons',
	config = function()
	    require('nvim-web-devicons').setup({
		color_icons = true;
		default = true;
		strict = true;
	    })
	end,
    },
    {
	'akinsho/toggleterm.nvim',
	version = "*",
	config = function()
	    require('toggleterm').setup()

	    vim.keymap.set('n', '<C-t>', '<cmd>ToggleTerm<CR>', { noremap = true })
	end,
    },
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
	if not (vim.fn.argc() == 0) then -- has room for improvement
	    vim.cmd.cd(vim.fn.expand('%:h'))
	end

	require("nvim-tree.api").tree.open()
    end
})
