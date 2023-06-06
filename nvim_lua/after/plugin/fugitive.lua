-- Git operations around stash
vim.keymap.set("n", "<leader>.", vim.cmd.Git);
vim.keymap.set("n", "<leader>gsl", ":Git log -g stash <CR>");
vim.keymap.set("n", "<leader>gs", ":Git stash save");
vim.keymap.set("n", "<leader>gsp", ":Git stash pop <CR>");

-- Git operations around branch
vim.keymap.set("n", "<leader>gb", ":Git checkout ");


