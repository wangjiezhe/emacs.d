;; Configuration for company

(use-package company
  :bind (:map company-active-map
              ("<tab>" . company-complete-common-or-cycle)
              ("<backtab>" . company-select-previous))
  :init
  (company-quickhelp-mode 1)
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-require-match 'never)
  ;; (setq company-quickhelp-delay nil)
  (add-to-list 'company-backends 'sly-company)
  (add-to-list 'company-backends '(company-jedi company-files))
)

(provide 'rc-company)
