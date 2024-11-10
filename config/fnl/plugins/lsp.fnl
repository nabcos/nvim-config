;symbols to show for lsp diagnostics
(fn define-signs [prefix]
  (let [error (.. prefix :SignError)
        warn (.. prefix :SignWarn)
        info (.. prefix :SignInfo)
        hint (.. prefix :SignHint)]
    (vim.fn.sign_define error {:text "" :texthl error})
    (vim.fn.sign_define warn {:text "" :texthl warn})
    (vim.fn.sign_define info {:text "" :texthl info})
    (vim.fn.sign_define hint {:text "" :texthl hint})))

(define-signs :Diagnostic)

[{1 :neovim/nvim-lspconfig
  :dependencies [:williamboman/mason.nvim
                 :williamboman/mason-lspconfig.nvim
                 :j-hui/fidget.nvim
                 :folke/neodev.nvim]
  :config (fn []
            (let [lsp (require :lspconfig)
                  cmplsp (require :cmp_nvim_lsp)
                  neodev (require :neodev)
                  mason (require :mason)
                  mason-lspconfig (require :mason-lspconfig)
                  handlers {:textDocument/publishDiagnostics (vim.lsp.with vim.lsp.diagnostic.on_publish_diagnostics
                                                               {:severity_sort true
                                                                :update_in_insert true
                                                                :underline true
                                                                :virtual_text false})
                            :textDocument/hover (vim.lsp.with vim.lsp.handlers.hover
                                                  {:border :single})
                            :textDocument/signatureHelp (vim.lsp.with vim.lsp.handlers.signature_help
                                                          {:border :single})}
                  capabilities (cmplsp.default_capabilities (vim.lsp.protocol.make_client_capabilities))
                  before_init (fn [params]
                                (set params.workDoneToken :1))
                  on_attach (fn [client bufnr]
                              (do
                                (vim.api.nvim_buf_set_keymap bufnr :n :gd
                                                             "<Cmd>lua vim.lsp.buf.definition()<CR>"
                                                             {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :K
                                                             "<Cmd>lua vim.lsp.buf.hover()<CR>"
                                                             {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<C-k>
                                                             "<Cmd>lua vim.lsp.buf.signature_help()<CR>"
                                                             {:desc "Signature Documentation"})
                                (vim.api.nvim_buf_set_keymap bufnr :n
                                                             :<leader>ld
                                                             "<Cmd>lua vim.lsp.buf.declaration()<CR>"
                                                             {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n
                                                             :<leader>lt
                                                             "<cmd>lua vim.lsp.buf.type_definition()<CR>"
                                                             {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n
                                                             :<leader>lh
                                                             "<cmd>lua vim.lsp.buf.signature_help()<CR>"
                                                             {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n
                                                             :<leader>ln
                                                             "<cmd>lua vim.lsp.buf.rename()<CR>"
                                                             {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n
                                                             :<leader>le
                                                             "<cmd>lua vim.diagnostic.open_float()<CR>"
                                                             {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n
                                                             :<leader>lq
                                                             "<cmd>lua vim.diagnostic.setloclist()<CR>"
                                                             {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n
                                                             :<leader>lf
                                                             "<cmd>lua vim.lsp.buf.format()<CR>"
                                                             {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n
                                                             :<leader>lj
                                                             "<cmd>lua vim.diagnostic.goto_next()<CR>"
                                                             {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n
                                                             :<leader>lk
                                                             "<cmd>lua vim.diagnostic.goto_prev()<CR>"
                                                             {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n
                                                             :<leader>la
                                                             "<cmd>lua vim.lsp.buf.code_action()<CR>"
                                                             {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :v
                                                             :<leader>la
                                                             "<cmd>lua vim.lsp.buf.range_code_action()<CR> "
                                                             {:noremap true})
                                ;telescope
                                (vim.api.nvim_buf_set_keymap bufnr :n
                                                             :<leader>lw
                                                             ":lua require('telescope.builtin').diagnostics()<cr>"
                                                             {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n
                                                             :<leader>lr
                                                             ":lua require('telescope.builtin').lsp_references()<cr>"
                                                             {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n
                                                             :<leader>li
                                                             ":lua require('telescope.builtin').lsp_implementations()<cr>"
                                                             {:noremap true})))]
              ;lesser used keymaps saved from previous config
              ;nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
              ;nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
              ;nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
              ;nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
              ;nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
              ;nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
              ;nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
              ;; To add support to more language servers check:
              ;; https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
              ;; Clojure
              (lsp.clojure_lsp.setup {: on_attach
                                      : handlers
                                      : before_init
                                      : capabilities
                                      ; uses fallback when navigating inside dependency jar
                                      :root_dir (fn [pattern]
                                                  (let [util (require :lspconfig.util)
                                                        fallback (vim.loop.cwd)
                                                        patterns [:project.clj
                                                                  :deps.edn
                                                                  :build.boot
                                                                  :shadow-cljs.edn
                                                                  :.git
                                                                  :bb.edn]
                                                        root ((util.root_pattern patterns) pattern)]
                                                    (or root fallback)))})
              (neodev.setup)
              (mason.setup)
              (mason-lspconfig.setup)
              (local setupLspServer
                     (fn [server_name settings]
                       (let [server (. lsp server_name)]
                         (server.setup {: on_attach : capabilities : settings}))))
              (mason-lspconfig.setup_handlers [setupLspServer])
              (lsp.lemminx.setup {: on_attach : capabilities})
              (setupLspServer :marksman {})
              (setupLspServer :terraform_lsp {})
              (setupLspServer :gopls {})
              (setupLspServer :lua_ls
                              {:Lua {:workspace {:checkThirdParty false}
                                     :telemetry {:enable false}}})
              (setupLspServer :nil_ls
                              {:nil {:formatting {:command [:nixpkgs-fmt]}}
                               :nix {:maxMemoryMB 2560
                                     :flake {:autoArchive :true
                                             :nixpkgsInputName :nixos}}})))}]
