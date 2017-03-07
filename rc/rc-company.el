;; Configuration for company

;; use company-mode in all buffers
(add-hook 'after-init-hook 'global-company-mode)

;; make TAB complete first, then cycle
;; make S-TAB cycle backward
(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
     (define-key company-active-map (kbd "<backtab>") 'company-select-previous)
     (define-key company-active-map (kbd "\C-n") 'company-select-next)
     (define-key company-active-map (kbd "\C-p") 'company-select-previous)
     (define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
     (define-key company-active-map (kbd "M-.") 'company-show-location)))

;; cancel selections by typing non-matching characters
(setq company-require-match 'never)

;; activate quickhelp
(company-quickhelp-mode 1)

;; do not popup automatically
;; (setq company-quickhelp-delay nil)

;;; custom backends
(add-to-list 'company-backends 'sly-company)
(add-to-list 'company-backends '(company-jedi company-files))


(provide 'rc-company)
