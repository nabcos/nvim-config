[{1 :ahmedkhalf/project.nvim
  :init (fn []
          (vim.keymap.set :n :<leader>gp
                          ":lua require('telescope').extensions.projects.projects()<CR>"
                          {:noremap true})
          )
  :config (fn []
            (let [plugin (require :project_nvim)] 
              (plugin.setup {})))}]
