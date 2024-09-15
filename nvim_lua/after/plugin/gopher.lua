require("gopher").setup {
    settings = {
        gopls = {
            usePlaceholders = true,
            analyses = {
                unusedparams = true
            }
        }
    },
    commands = {
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "gotests",
        impl = "impl",
        iferr = "iferr",
        dlv = "dlv",
    },
    gotests = {
        -- gotests doesn't have template named "default" so this plugin uses "default" to set the default template
        template = "default",
        -- path to a directory containing custom test code templates
        template_dir = nil,
        -- switch table tests from using slice to map (with test name for the key)
        -- works only with gotests installed from develop branch
        named = false,
    },
    gotag = {
        transform = "snakecase",
    },
}
