return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        require("telescope").setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--multiline",
                },
            },
        })

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<C-p>", function()
            builtin.git_files({ show_untracked = true })
        end, {})
        vim.keymap.set("n", "<leader>pf", function()
            builtin.find_files({ hidden = true })
        end, {})
        vim.keymap.set("n", "<leader>pg", builtin.live_grep)
        vim.keymap.set("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            builtin.live_grep({ default_text = word })
        end)
        vim.keymap.set("n", "<leader>pWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.live_grep({ default_text = word })
        end)
        vim.keymap.set("n", "<leader>pr", function()
            builtin.resume()
        end)
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end,
}
