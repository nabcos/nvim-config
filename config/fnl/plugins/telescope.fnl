[{1 :nvim-telescope/telescope.nvim
  :dependencies [:nvim-telescope/telescope-ui-select.nvim
                 :nvim-lua/popup.nvim
                 :nvim-lua/plenary.nvim
                 :nvim-telescope/telescope-fzf-native.nvim]
  :init (fn []
          (vim.keymap.set :n :<leader>ff
                          ":lua require('telescope.builtin').find_files()<CR>"
                          {:noremap true})
          (vim.keymap.set :n :<leader>gf
                          ":lua require('telescope.builtin').git_files()<CR>"
                          {:noremap true})
          (vim.keymap.set :n :<leader>sg
                          ":lua require('telescope.builtin').live_grep()<CR>"
                          {:noremap true})
          (vim.keymap.set :n :<leader>sw
                          ":lua require('telescope.builtin').grep_string()<CR>"
                          {:noremap true})
          (vim.keymap.set :n :<leader>sh
                          ":lua require('telescope.builtin').help_tags()<CR>"
                          {:noremap true})
          (vim.keymap.set :n :<leader><space>
                          ":lua require('telescope.builtin').buffers()<CR>"
                          {:noremap true}))
  :config (fn []
            (let [telescope (require :telescope)
                  themes (require :telescope.themes)]
              (telescope.setup {:defaults {:file_ignore_patterns [:node_modules]
                                           :vimgrep_arguments [:rg
                                                               :--color=never
                                                               :--no-heading
                                                               :--with-filename
                                                               :--line-number
                                                               :--column
                                                               :--smart-case
                                                               :--iglob
                                                               :!.git
                                                               :--hidden]}
                                :extensions {:ui-select {1 (themes.get_dropdown {})}}})
              (telescope.load_extension :ui-select)
              (telescope.load_extension :projects)
              (telescope.load_extension :fzf)))}]
