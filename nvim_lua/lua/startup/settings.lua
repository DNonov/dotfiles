vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.nu = true
vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.api.nvim_command("filetype indent off")
vim.opt.smartindent = true
vim.wo.relativenumber = true
vim.opt.cursorline = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 30

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

-- Highlights yanks just for 150ms
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 150 }
  end,
})

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-i>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- vim.cmd [[colorscheme vlt]]
-- vim.cmd [[colorscheme modTheme]]
vim.cmd [[colorscheme dast]]
