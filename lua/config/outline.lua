require('symbols-outline').setup({
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    width = 50,
    position = "right",
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    keymaps = {
        close = "<Esc>",
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = { "null-ls" },
})
