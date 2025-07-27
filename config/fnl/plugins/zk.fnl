[{1 :zk-org/zk-nvim
  :version "*"
  :config (fn []
            (let [zk (require :zk)
                  opts {:noremap true :silent false}]
              (do
                (zk.setup {:picker :telescope
                           :lsp {:config {:name :zk
                                          :cmd [:zk :lsp]
                                          :filetypes [:markdown]
                                          :root_dir (os.getenv "ZK_NOTEBOOK_DIR")}}
                           :auto_attach {:enabled true}})
                (vim.api.nvim_set_keymap :n :<leader>zn
                                         "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>"
                                         opts)
                (vim.api.nvim_set_keymap :n :<leader>zo
                                         "<Cmd>ZkNotes { sort = { 'modified' } }<CR>"
                                         opts)
                (vim.api.nvim_set_keymap :n :<leader>zf
                                         "<Cmd>ZkNotes { sort = { 'modified'), match = { vim.fn.input('Search: ') } } }<CR>"
                                         opts)
                (vim.api.nvim_set_keymap :n :<leader>zt :<Cmd>ZkTags<CR> opts)
                (vim.api.nvim_set_keymap :v :<leader>zf ":'<,'>ZkMatch<CR>"
                                         opts)
                (vim.api.nvim_create_autocmd :FileType
                                             {:pattern [:markdown]
                                              :callback (fn []
                                                          (let [util (require :zk.util)]
                                                            (when (not= nil
                                                                        (util.notebook_root (vim.fn.expand "%:p")))
                                                              (vim.api.nvim_set_keymap :n
                                                                                       :<CR>
                                                                                       "<Cmd>lua vim.lsp.buf.definition()<cr>"
                                                                                       opts)
                                                              ; (vim.api.nvim_set_keymap :n
                                                              ;                          :<leader>zn
                                                              ;                          "<Cmd>ZkNew { title = vim.fn.input('Title: '), dir = vim.fn.expand('%:p:h') }<CR>"
                                                              ;                          opts)
                                                              (vim.api.nvim_set_keymap :v
                                                                                       :<leader>znt
                                                                                       ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>"
                                                                                       opts)
                                                              (vim.api.nvim_set_keymap :v
                                                                                       :<leader>znc
                                                                                       ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>"
                                                                                       opts)
                                                              (vim.api.nvim_set_keymap :n
                                                                                       :<leader>zb
                                                                                       :<Cmd>ZkBacklinks<CR>
                                                                                       opts)
                                                              (vim.api.nvim_set_keymap :n
                                                                                       :<leader>zl
                                                                                       :<Cmd>ZkLinks<CR>
                                                                                       opts)
                                                              (vim.api.nvim_set_keymap :n
                                                                                       :K
                                                                                       "<Cmd>lua vim.lsp.buf.hover()<CR>"
                                                                                       opts)
                                                              (vim.api.nvim_set_keymap :v
                                                                                       :<leader>zl
                                                                                       ":'<,'>ZkInsertLinkAtSelection<CR>"
                                                                                       opts)
                                                              (vim.api.nvim_set_keymap :v
                                                                                       :<leader>za
                                                                                       ":'<,'>lua vim.lsp.buf.range_code_action()<CR>"
                                                                                       opts))))}))))}]
