[{1 :stevearc/oil.nvim
  :config (fn []
            (let [oil (require :oil)] (oil.setup)
              (vim.keymap.set :n :<leader>fs "<cmd>Oil --float<cr>"
                              {:desc "Open [F]ile[S]ystem view"})
              (vim.keymap.set :n :<leader>FS "<cmd>Oil<cr>"
                              {:desc "Open [F]ile[S]ystem view"})
            ))
  :dependencies [ "nvim-tree/nvim-web-devicons" ]
  :lazy false
}]
