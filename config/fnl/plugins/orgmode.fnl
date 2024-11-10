[{1 :nvim-orgmode/orgmode
  :dependencies [:akinsho/org-bullets.nvim]
  :event :VeryLazy
  :ft [:org]
  :config (fn []
            (let [orgmode (require :orgmode)
                  bullets (require :org-bullets)]
              (orgmode.setup {:org_agenda_files "~/orgfiles/**/*"
                              :org_default_notes_file "~/orgfiles/refile.org"
                              :org_adapt_indentation true
                              :org_capture_templates {:t {:description :Todo
                                                          :template "* TODO %?
DEADLINE: %T"}
                                                      :n {:description :Note
                                                          :template "* %?\n"}
                                                      :m {:description :Meeting
                                                          :template "* %?
SCHEDULED: %^t"}}})
              (bullets.setup {:concealcursor true
                              :symbols {:list "•"
                                        :headlines [" " "󰺕 " "✸" "✿"]
                                        :checkboxes {:half [""
                                                            :OrgTSCheckboxHalfChecked]
                                                     :done ["✓" :OrgDone]
                                                     :todo ["×" :OrgTODO]}}})))}]
