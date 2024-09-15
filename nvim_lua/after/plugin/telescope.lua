local telescope_builtin = require("telescope.builtin")
local bind = vim.keymap.set
local opt = {}


-- Find files in dir
bind("n", "<C-P>", telescope_builtin.find_files, opt)
-- Find references for the word under your cursor.
bind("n", "<leader>gr", telescope_builtin.lsp_references, opt)
-- Find files in repo
bind("n", "<C-p>", telescope_builtin.git_files, opt)
-- Grep
bind("n", "<C-f>", function()
    telescope_builtin.grep_string({search = vim.fn.input("Grep >> ")})
end)
-- Search for diagnostics
bind("n", "<leader>sd", telescope_builtin.diagnostics, opt)
-- Search for help
bind("n", "<leader>sh", telescope_builtin.help_tags, opt)
