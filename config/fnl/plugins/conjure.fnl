[{1 :Olical/conjure
  :branch :master
  :init (fn []
          (set vim.g.conjure#mapping#doc_word :K) ; Load current file's namespace automatically
          (set vim.g.conjure#client#clojure#nrepl#eval#auto_require true) ; start babashka if no nrepl file is found
          (set vim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled
               true) ; evaluate comment forms as do forms
          (set vim.g.conjure#eval#gsubs
               {:do-comment ["^%(comment[%s%c]" "(do "]})
          ;set up sql integration for devenv-managed database (local user as superuser)
          (set vim.g.conjure#client#sql#stdio#command "psql -U nabcos postgres"))}]
