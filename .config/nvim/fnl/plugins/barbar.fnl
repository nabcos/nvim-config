[{1 :romgrk/barbar.nvim
  :dependencies [:lewis6991/gitsigns.nvim :nvim-tree/nvim-web-devicons]
  :init (fn [& args] (set vim.g.barbar_auto_setup false))
  :config (fn [_ options] 
            (let [barbar (require :barbar)] (barbar.setup options))
            (vim.keymap.set :n :<C-A-Left> "<Cmd>BufferPrevious<CR>" {:noremap true :silent true})
            (vim.keymap.set :n :<C-A-Right> "<Cmd>BufferNext<CR>" {:noremap true :silent true})
            )
  :opts {:focus_on_close :previous}
  }]
