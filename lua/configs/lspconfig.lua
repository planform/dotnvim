require("nvchad.configs.lspconfig").defaults()

local rounded_float = { border = "rounded" }
local default_hover = vim.lsp.buf.hover
local default_signature_help = vim.lsp.buf.signature_help

vim.lsp.buf.hover = function(config)
    return default_hover(vim.tbl_deep_extend("force", config or {}, rounded_float))
end

vim.lsp.buf.signature_help = function(config)
    return default_signature_help(vim.tbl_deep_extend("force", config or {}, rounded_float))
end

local servers = { "html", "cssls", "rust_analyzer" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
-- lsp config for clangd
vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--background-index", -- 后台建立索引
        "--clang-tidy", -- 开启clang-tidy诊断
        "--completion-style=detailed", -- 更详细的补全信息
        "--header-insertion=iwyu", -- 自动根据代码插入头文件
        "--function-arg-placeholders", -- 补全函数时显示参数占位符
        "--pch-storage=memory", -- 将预编译头文件保存在内存中，性能更好
        "--fallback-style=llvm", -- 在没有 .clang-format 文件时的后备格式化风格
        "-j=2", -- 使用 2 个异步工作线程，根据你 CPU 核心数调整
    },
})

vim.lsp.enable "clangd"
