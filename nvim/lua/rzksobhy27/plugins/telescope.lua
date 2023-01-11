local telescope = require("telescope")
local themes = require("telescope.themes")
-- local actions = require("telescope.actions")

telescope.setup({
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        ["ui-select"] = {
            themes.get_dropdown(),
        },
    },
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("live_grep_args")
