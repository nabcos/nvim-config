[{1 :numToStr/Comment.nvim
  :opts {}
  :config (fn [opts]
            (let [commenter (require :Comment)
                  ft (require :Comment.ft)]
              (commenter.setup opts)
              (ft.set :fennel ";%s")))}]
