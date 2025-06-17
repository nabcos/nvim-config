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
  :dependencies [:j-hui/fidget.nvim
                 {1 :folke/lazydev.nvim :ft [:lua]}]
  :config (fn []
            (let [lsp (require :lspconfig)
                  cmplsp (require :cmp_nvim_lsp)
                  neodev (require :lazydev)
                  capabilities (cmplsp.default_capabilities (vim.lsp.protocol.make_client_capabilities))
                  on_attach (fn [_ bufnr]
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
                                                             :<leader>lD
                                                             ":lua require('telescope.builtin').lsp_document_symbols()<cr>"
                                                             {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n
                                                             :<leader>lW
                                                             ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>"
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
              (neodev.setup)
              (local setupLspServer
                     (fn [server_name settings]
                       (let [server (. lsp server_name)]
                         (server.setup {: on_attach : capabilities : settings}))))
              (lsp.lemminx.setup {: on_attach : capabilities})
              (setupLspServer :fennel_ls {})
              (setupLspServer :marksman {})
              (setupLspServer :terraformls {})
              (setupLspServer :lua_ls
                              {:Lua {:workspace {:checkThirdParty false}
                                     :telemetry {:enable false}}})
              (setupLspServer :nil_ls
                              {:nil {:formatting {:command [:nixpkgs-fmt]}}
                               :nix {:maxMemoryMB 2560
                                     :flake {:autoArchive :true
                                             :nixpkgsInputName :nixos}}})))}]
