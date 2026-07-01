require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "gp", "<C-t>", { desc = "go back from definition jump" })
map("n", "gP", "<C-o>", { desc = "goto previous position" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "telescope list document symbols" })
map("n", "<leader>fc", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "telescope list workspace symbols" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- flash key mappings config
--
-- just search and jump
map({ "n", "x", "o" }, "s", function()
    require("flash").jump()
end, { desc = "Flash jump" })
-- search based on treesitter
map({ "n", "x", "o" }, "S", function()
    require("flash").treesitter()
end, { desc = "Flash treesitter" })
-- remote mode, jump to target make some change and jump back
map("o", "r", function()
    require("flash").remote()
end, { desc = "Flash remote" })
-- op remote code block based on treesitter
map({ "x", "o" }, "R", function()
    require("flash").treesitter_search()
end, { desc = "Flash treesitter search" })

-- ── Debug (quickdebug.nvim + nvim-dap) ───────────────────────────────────────
local wk_ok, wk = pcall(require, "which-key")
if wk_ok then
    wk.add { { "<leader>d", group = "debug" } }
end

-- DAP execution control — pcall + silent so these work from any window
-- (including dapui panels) without showing errors when no session is active.
local function dap_call(fn)
    return function()
        local ok, dap = pcall(require, "dap")
        if ok then
            pcall(dap[fn])
        end
    end
end
map("n", "<F5>", dap_call "continue", { desc = "dap: continue/run", silent = true })
map("n", "<F10>", dap_call "step_over", { desc = "dap: step over", silent = true })
map("n", "<F11>", dap_call "step_into", { desc = "dap: step into", silent = true })
map("n", "<F12>", dap_call "step_out", { desc = "dap: step out", silent = true })

-- quickdebug project operations
map("n", "<leader>db", function()
    require("quickdebug").build()
end, { desc = "debug: build project" })
map("n", "<leader>dl", function()
    require("quickdebug").debug()
end, { desc = "debug: launch (auto local/remote)" })
map("n", "<leader>dr", function()
    require("quickdebug").debug_remote()
end, { desc = "debug: force remote gdbserver" })
map("n", "<leader>dd", function()
    require("quickdebug").deploy()
end, { desc = "debug: deploy to remote" })
map("n", "<leader>dk", function()
    require("quickdebug").kill_gdbserver()
end, { desc = "debug: kill remote gdbserver" })

-- Breakpoints (only allowed in normal source buffers)
local function in_source_buf()
    return vim.bo.buftype == ""
end
map("n", "<leader>dB", function()
    if in_source_buf() then
        require("dap").toggle_breakpoint()
    end
end, { desc = "debug: toggle breakpoint" })
map("n", "<leader>dC", function()
    if in_source_buf() then
        require("dap").set_breakpoint(vim.fn.input "Condition: ")
    end
end, { desc = "debug: conditional breakpoint" })

-- UI
map("n", "<leader>du", function()
    require("dapui").toggle()
end, { desc = "debug: toggle UI panels" })
map({ "n", "v" }, "<leader>de", function()
    require("dapui").eval()
end, { desc = "debug: evaluate expression" })
map("n", "<leader>dq", function()
    require("quickdebug").quit_debug()
end, { desc = "debug: quit debug session" })
