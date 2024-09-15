local c = require('vscode.colors').get_colors()
require('vscode').setup({
    -- Alternatively set style in setup
    style = 'dark',

    -- Enable transparent background
    transparent = false,

    -- Enable italic comment
    italic_comments = false,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        ["@comment"] = { fg = c.vscGray, bg = c.vscNone },
        ["Label"] = { fg = c.vscBlueGreen, bg = c.vscNone },
        ["Search"] = { fg = c.vscNone, bg = c.vscSelection },
        ["DiffAdd"] = { fg = c.vscGreen, bg = c.None },
        ["DiffDelete"] = { fg = c.vscOrange, bg = c.vscNone },
        ["ngxBlock"] = { fg = c.vscBlue, bg = c.vscNone },
        ["Statement"] = { fg = c.vscBlue, bg = c.vscNone },
        ["PreProc"] = { fg = c.vscBlue, bg = c.vscNone },
        ["gitHead"] = { fg = c.vscBlueGreen, bg = c.vscNone },
        ["fugitiveUnstagedHeading"] = { fg = c.vscBlueGreen, bg = c.vscNone },
        ["fugitiveStagedHeading"] = { fg = c.vscBlueGreen, bg = c.vscNone },
        ["@keyword"] = { fg = c.vscBlue, bg = c.vscNone },
        ["@type.builtin"] = { fg = c.vscBlueGreen, bg = c.vscNone },
        ["@variable.builtin"] = { fg = c.vscBlue, bg = c.vscNone },
        ["@conditional"] = { fg = c.vscBlue, bg = c.vscNone },
        ["@repeat"] = { fg = c.vscBlue, bg = c.vscNone },
        ["@exception"] = { fg = c.vscBlue, bg = c.vscNone },
        ["@include"] = { fg = c.vscBlue, bg = c.vscNone },
        ["@keyword.return"] = { fg = c.vscBlue, bg = c.vscNone },
        ["lualine_b_normal"] = { fg = c.vscWhite, bg = c.vscBlack },
    }
})

--vim.cmd [[colorscheme vscode]]
