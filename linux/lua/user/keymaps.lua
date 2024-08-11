-- nvim-tree
vim.keymap.set("n", "<F2>", require("nvim-tree.api").tree.toggle)

-- overseer
vim.keymap.set("n", "<C-o>", "<cmd>OverseerToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>OverseerLoadBundle<CR>", { noremap = true, silent = true })

-- toggleterm
vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })

-- buffer
vim.keymap.set("n", "<leader>w", "<cmd>BufferLineCycleNext<CR>", {}) --"  cycle next buffer"
vim.keymap.set("n", "<leader>a", "<cmd>BufferLineCyclePrev<CR>", {}) --"  cycle prev buffer"
vim.keymap.set("n", "<leader>x", "<cmd> bp|sp|bn|bd! <CR>", {})

-- lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>p", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- switch between panes
vim.keymap.set("n", "<leader>D", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<leader>S", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<leader>A", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<leader>W", ":wincmd l<CR>", { silent = true })

-- move line around
vim.keymap.set("v", "D", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "S", ":m '>+1<CR>gv=gv", { silent = true })

-- erase search
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- diagnostics
vim.keymap.set("n", "<leader>i", function()
  -- If we find a floating window, close it.
  local found_float = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative ~= "" then
      vim.api.nvim_win_close(win, true)
      found_float = true
    end
  end

  if found_float then
    return
  end

  vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
end, { noremap = true, silent = true, desc = "Toggle Diagnostics" })

-- clipboard
vim.keymap.set("v", "<D-c>", '"+y') -- Copy
vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

if vim.g.neovide then
	vim.keymap.set("n", "<F11>", function()
		vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
	end, { noremap = true, silent = true })
end
