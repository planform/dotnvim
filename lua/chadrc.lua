-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "onedark",
    transparency = true,

    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
}

M.nvdash = { load_on_startup = true }
M.ui = {
    statusline = {
        theme = "vscode_colored",
        separator_style = "round",
        order = { "mode", "file", "navic", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cursor", "cwd" },
        modules = {
            navic = function()
                local ok, navic = pcall(require, "nvim-navic")
                if ok and navic.is_available() then
                    local loc = navic.get_location()
                    return loc ~= "" and ("%#StText# > " .. loc .. " ") or ""
                end
                return ""
            end,
        },
    },
    tabufline = {
        lazyload = false,
    },
}

M.term = {
    float = {
        row = 0.08,
        col = 0.08,
        width = 0.82,
        height = 0.75,
    },
}

return M
