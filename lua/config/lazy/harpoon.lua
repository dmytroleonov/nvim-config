return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({
            global_settings = {
                save_on_toggle = true,
            },
        })

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end)
        vim.keymap.set("n", "<leader>e", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
        vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
        vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
        vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
        vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
        vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)

        vim.keymap.set("n", "<leader>r1", function() harpoon:list():replace_at(1) end)
        vim.keymap.set("n", "<leader>r2", function() harpoon:list():replace_at(2) end)
        vim.keymap.set("n", "<leader>r3", function() harpoon:list():replace_at(3) end)
        vim.keymap.set("n", "<leader>r4", function() harpoon:list():replace_at(4) end)
        vim.keymap.set("n", "<leader>r5", function() harpoon:list():replace_at(5) end)
        vim.keymap.set("n", "<leader>r6", function() harpoon:list():replace_at(6) end)
        vim.keymap.set("n", "<leader>r7", function() harpoon:list():replace_at(7) end)
        vim.keymap.set("n", "<leader>r8", function() harpoon:list():replace_at(8) end)
        vim.keymap.set("n", "<leader>r9", function() harpoon:list():replace_at(9) end)
    end,
}
