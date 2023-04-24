local autosave = require("auto-save")

autosave.setup({
    enabled = true,
    events = {"InsertLeave", "TextChanged"},
    write_all_buffers = false,
})
