require("mason-nvim-dap").setup { ensure_installed = { "cppdbg" } }

require("quickdebug").setup {
    dapui = {
        layouts = {
            { -- left column (full height): Locals / Expressions / Breakpoints
                elements = {
                    { id = "scopes", size = 0.40 },
                    { id = "watches", size = 0.35 },
                    { id = "breakpoints", size = 0.25 },
                },
                size = 38,
                position = "left",
            },
            { -- bottom of center area (REPL + Console)
                -- created before "right" so the split only affects center, not left column
                -- height matches the bottom-left panel (25% of editor rows)
                elements = {
                    { id = "repl", size = 0.5 },
                    { id = "console", size = 0.5 },
                },
                size = math.floor((vim.o.lines - 2) * 0.25),
                position = "bottom",
            },
            { -- right of center top area: Stacks, same height as source code
                elements = { { id = "stacks", size = 1.0 } },
                size = 35,
                position = "right",
            },
        },
    },
}
