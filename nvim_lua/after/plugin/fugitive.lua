-- Git operations related to stash
-- vim.keymap.set("n", "<leader>.", vim.cmd.Git);
vim.keymap.set("n", "<leader>.", ":tab G<CR>");
vim.keymap.set("n", "<leader>gsl", ":Git log -g stash <CR>");
vim.keymap.set("n", "<leader>gs", ":Git stash save");
vim.keymap.set("n", "<leader>gsp", ":Git stash pop <CR>");
--
-- Git operations related to push and pull
vim.keymap.set("n", "<leader>gp", ":Git push <CR>");

-- Git operations related to branch
vim.keymap.set("n", "<leader>gb", ":Git checkout ");
vim.keymap.set("n", "<leader>bl", ":Git branch<CR>");
