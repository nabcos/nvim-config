[{1 :nvim-neo-tree/neo-tree.nvim
  :dependencies [:nvim-lua/plenary.nvim
                 :nvim-tree/nvim-web-devicons
                 :MunifTanjim/nui.nvim]
  :config (fn []
            (let [tree (require :neo-tree)] (tree.setup)
              (vim.keymap.set :n :<leader>fs "<cmd>Neotree toggle<cr>"
                              {:desc "Open [F]ile[S]ystem view in sidebar"})
              (vim.cmd "let g:neo_tree_remove_legacy_commands = 1")))}]
