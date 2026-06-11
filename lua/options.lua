require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g
local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.cursorline = true -- 高亮当前行
opt.cursorlineopt = "number,line" -- 同时高亮行号和文本行
opt.termguicolors = true
opt.smoothscroll = true
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99

opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

g.clipboard = {
    name = "wsl-clipboard",
    copy = {
        ["+"] = "wcopy",
        ["*"] = "wcopy",
    },
    paste = {
        ["+"] = "wpaste",
        ["*"] = "wpaste",
    },
    cache_enabled = true,
}
