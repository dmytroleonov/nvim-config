vim.g.mapleader = " "

vim.keymap.set("n", "<leader>o", "<cmd>%bd!|e#|bd#<cr>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "gj", [[<cmd>s/\n\s*/<cr>]])

vim.keymap.set("n", ">", ">>")
vim.keymap.set("n", "<", "<<")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<C-_>", "gcc", { remap = true })
vim.keymap.set("v", "<C-_>", "gc", { remap = true })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>lsp", "<cmd>LspRestart<cr>")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]], { remap = true })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>wr", "<cmd>set wrap!<CR>")

local function copy_path()
    local filepath = vim.fn.expand("%:p") -- Absolute path
    local filename = vim.fn.expand("%:t") -- Filename
    local modify = vim.fn.fnamemodify

    local results = {
        filepath, -- Absolute path
        modify(filepath, ":."), -- Path relative to CWD
        modify(filepath, ":~"), -- Path relative to HOME
        filename, -- Filename
        modify(filename, ":r"), -- Filename without extension
        modify(filename, ":e"), -- File extension
    }

    vim.ui.select({
        "1. Absolute path: " .. results[1],
        "2. Path relative to CWD: " .. results[2],
        "3. Path relative to HOME: " .. results[3],
        "4. Filename: " .. results[4],
        "5. Filename without extension: " .. results[5],
        "6. Extension of the filename: " .. results[6],
    }, { prompt = "Choose to copy to clipboard:" }, function(choice)
        if choice then
            local i = tonumber(choice:sub(1, 1))
            if i then
                local result = results[i]
                vim.fn.setreg("+", result)
            end
        end
    end)
end

vim.keymap.set("n", "<leader>cp", copy_path, { desc = "Copy file path" })

vim.g.listchars_visible = false
vim.g.listchars_value = "trail:~,tab:>-,nbsp:␣"

vim.keymap.set("n", "<leader>hl", function()
    if vim.g.listchars_visible then
        vim.opt.list = false
        vim.g.listchars_visible = false
    else
        vim.opt.list = true
        vim.opt.listchars = vim.g.listchars_value
        vim.g.listchars_visible = true
    end
end, { desc = "Toggle listchars" })

vim.keymap.set("n", "<leader>ta", function()
    local nf = vim.opt.nrformats:get()
    if vim.tbl_contains(nf, "alpha") then
        vim.opt.nrformats:remove("alpha")
        print("Alpha increment off")
    else
        vim.opt.nrformats:append("alpha")
        print("Alpha increment on")
    end
end, { desc = "Toggle alpha increment" })
