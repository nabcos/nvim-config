(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

;space is reserved to be lead
(vim.keymap.set :n :<space> :<nop> {:noremap true})

;sets a nvim global options
(let [options
      {;tabs is space
       :expandtab true
       ;tab/indent size
       :tabstop 2
       :shiftwidth 2
       :softtabstop 2
       ;settings needed for compe autocompletion
       :completeopt "menuone,noselect"
       ;case insensitive search
       :ignorecase true
       ;smart search case
       :smartcase true
       ;shared clipboard with linux
       :clipboard "unnamedplus"
       ;show line numbers
       :number true
       ;show line and column number
       :ruler true
       ;makes signcolumn always one column with signs and linenumber
       :signcolumn "number"}]
  (each [option value (pairs options)]
    (core.assoc vim.o option value)))

(vim.keymap.set :n :k "v:count == 0 ? 'gk' : 'k'" { :expr true :silent true })
(vim.keymap.set :n :j "v:count == 0 ? 'gj' : 'j'" { :expr true :silent true })

-- rewrite file as root
(vim.keymap.set :c :w!! "%!sudo tee >/dev/null %<cr>" { :desc "Re[w]rite file as root" })

(vim.keymap.set :n :<A-j> ":m .+1<CR>==" {:desc  "move lines down"}) ;; move line up(n)
(vim.keymap.set :n :<A-k> ":m .-2<CR>==" {:desc  "move lines up"}) ;; move line down(n)
(vim.keymap.set :v :<A-j> ":m '>+1<CR>gv=gv" {:desc  "move lines down"}) ;; move line up(v)
(vim.keymap.set :v :<A-k> ":m '<-2<CR>gv=gv" {:desc  "move lines up"}) ;; move line down(v)

; These mappings control the size of splits (height/width)
(vim.keymap.set :n :<M-t> "<c-w>5<")
(vim.keymap.set :n :<M-s> "<c-w>5>")
(vim.keymap.set :n "<M-,>" "<C-W>+")
(vim.keymap.set :n "<M-.>" "<C-W>-")
(vim.keymap.set :n :<tab> "za" { :desc  "Toggle fold" })


(vim.api.nvim_create_autocmd "FileType" {
  :pattern [ "markdown" ]
  :callback (fn []
    (vim.keymap.set :i :<esc> "<esc>:update<cr>")
    )
})

{}
