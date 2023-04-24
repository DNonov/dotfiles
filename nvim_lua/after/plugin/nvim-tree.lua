local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentataion
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<cr>");

nvimtree.setup({
  view = {
    width = 50
  },
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "+",
					arrow_open = "-",
				},
			},
		},
	},

})


