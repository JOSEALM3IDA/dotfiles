return {
    {
        "nvim-telescope/telescope.nvim", tag = "v0.2.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },

        config = function()
            require('telescope').setup({
                defaults = {
                  mappings = {
                    i = {
                      -- map actions.which_key to <C-h> (default: <C-/>)
                      -- actions.which_key shows the mappings for your picker,
                      -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                      ["<C-h>"] = "which_key"
                    }
                  }
                },
                extensions = {
                  -- Your extension configuration goes here:
                  -- extension_name = {
                  --   extension_config_key = value,
                  -- }
                  -- please take a look at the readme of the extension you want to configure
                      fzf = {
                          fuzzy = true,                    -- false will only do exact matching
                          override_generic_sorter = true,  -- override the generic sorter
                          override_file_sorter = true,     -- override the file sorter
                          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                                           -- the default case_mode is "smart_case"
                    }
                }
            })

            require('telescope').load_extension('fzf');
            require('telescope').load_extension('file_browser')

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope git files" })
            vim.keymap.set("n", "<leader>fb", function()
                require("telescope").extensions.file_browser.file_browser()
            end, { desc = "Telescope file browser" })
            vim.keymap.set("n", "<leader>fs", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ")  })
            end)
        end
    }
}
