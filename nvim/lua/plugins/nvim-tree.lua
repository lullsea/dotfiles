return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- optionally enable 24-bit colour
        vim.opt.termguicolors = true

        require("nvim-tree").setup{
            renderer = {
                icons = {
                    show = {
                        git = true,
                        file = true,
                        folder = true,
                        folder_arrow = true,
                    },
                    glyphs = {
                        folder = {
                            arrow_closed = "",
                            arrow_open = "",
                        },
                        git = {
                            unstaged = "✗",
                            staged = "✓",
                            unmerged = "⌥",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "⊖",
                            ignored = "◌",
                        },
                    },
                },
            },
            sync_root_with_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = false
            }
        }
    end
}
