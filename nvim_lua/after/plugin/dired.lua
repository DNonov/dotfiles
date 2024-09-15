-- Neovim configuration for the 'dired' plugin
local home_dir = os.getenv("HOME")
package.path = home_dir .. "/Documents/workspace/dired.nvim/lua/dired/?.lua;" .. package.path

-- Set up the 'dired' plugin with custom options
require("dired").setup({
    path_separator = "/",               -- Use '/' as the path separator
    show_hidden = true,                 -- Show hidden files
    show_icons = true,
    show_banner = false,                 -- Do not show the banner
    hide_details = false,                -- Show file details by default
    sort_order = "name",                 -- Sort files by name by default

    -- Define keybindings for various 'dired' actions
    keybinds = {
        dired_enter = "<cr>",
        dired_back = "-",
        dired_up = "_",
        dired_rename = "R",
        dired_create = "d",
        dired_delete = "D",
        dired_delete_range = "D",
        dired_copy = "C",
        dired_copy_range = "C",
        dired_copy_marked = "MC",
        dired_move = "X",
        dired_move_range = "X",
        dired_move_marked = "MX",
        dired_paste = "P",
        dired_mark = "M",
        dired_mark_range = "M",
        dired_delete_marked = "MD",
        dired_toggle_hidden = ".",
        dired_toggle_sort_order = ",",
        dired_toggle_colors = "c",
        dired_toggle_hide_details = "(",
        dired_quit = "q",
    },
    -- Define colors for different file types and attributes
    colors = {
        -- DiredDotfile = { link = {}, bg = "NONE", fg = "626262" },
        -- DiredFadeText1 = { link = {}, bg = "NONE", fg = "626262", gui = "NONE" },
        -- DiredFadeText2 = { link = {}, bg = "NONE", fg = "444444", gui = "NONE" },
        -- DiredSize = { link = { "Normal" }, bg = "NONE", fg = "None", gui = "NONE" },
        DiredUsername = { link = {}, bg = "NONE", fg = "NONE", gui = "NONE" },
        -- DiredMonth = { link = { "Normal" }, bg = "NONE", fg = "None", gui = "bold" },
        -- DiredDay = { link = { "Normal" }, bg = "NONE", fg = "None", gui = "bold" },
        -- DiredFileName = { link = {}, bg = "NONE", fg = "NONE", gui = "NONE" },
        -- DiredFileSuid = { link = {}, bg = "ff6666", fg = "000000", gui = "bold" },
        -- DiredNormal = { link = { "Normal" }, bg = "NONE", fg = "NONE", gui = "NONE" },
        -- DiredNormalBold = { link = {}, bg = "NONE", fg = "ffffff", gui = "bold" },
        -- DiredSymbolicLink = { link = {}, bg = "NONE", fg = "33ccff", gui = "bold" },
        -- DiredBrokenLink = { link = {}, bg = "2e2e1f", fg = "ff1a1a", gui = "bold" },
        -- DiredSymbolicLinkTarget = { link = {}, bg = "5bd75b", fg = "000000", gui = "bold" },
        -- DiredBrokenLinkTarget = { link = {}, bg = "2e2e1f", fg = "ff1a1a", gui = "bold" },
        -- DiredFileExecutable = { link = {}, bg = "NONE", fg = "5bd75b", gui = "bold" },
        -- DiredMarkedFile = { link = {}, bg = "NONE", fg = "a8b103", gui = "bold" },
        -- DiredCopyFile = { link = {}, bg = "NONE", fg = "ff8533", gui = "bold" },
        -- DiredDimText = { link = {}, bg = "NONE", fg = "505050", gui = "NONE" },
        DiredDirectoryName = { link = {}, bg = "NONE", fg = "8397A9", gui = "NONE" },
        -- DiredMoveFile = { link = {}, bg = "NONE", fg = "ff3399", gui = "bold" },
    },
})
