[{1 :Olical/conjure
  :branch :master
  :init (fn []
          (set vim.g.conjure#mapping#doc_word :K)
          (set vim.g.conjure#client#clojure#nrepl#eval#auto_require false)
          (set vim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled
               false)
          ;set up sql integration for devenv-managed database (local user as superuser)
          (set vim.g.conjure#client#sql#stdio#command "psql -U nabcos postgres"))}]
