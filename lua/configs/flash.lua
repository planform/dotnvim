local options = {
    label = {
        uppercase = true, --允许大写标签
        exclude = "hjkliardc", -- 排除特定字符作为标签
        style = "overlay",
    },

    search = {
        multi_window = true, -- 跨窗口搜索
        wrap = true, -- 循环搜索
        mode = "exact", -- 默认搜索模式
        exclude = {
            "notify",
            function(win)
                return not vim.api.nvim_win_get_config(win).focusable
            end,
        },
    },

    jump = {
        jumplist = true, -- 记录跳转历史
        pos = "start", -- 跳转定位点
        autojump = true, -- 单匹配自动跳转
        inclusive = nil, -- 只能判断包含性
    },
}

return options
