;;; Configuration for sly

(use-package sly
  :config
  ;; inferior lisp
  (setq inferior-lisp-program "sbcl")
  ;; multiple lisps
  (setq sly-lisp-implementations
        '((sbcl ("sbcl"))
          (ecl ("ecl"))
          (clisp ("clisp"))))
  ;; clear last REPL prompt's output
  (use-package sly-mrepl
    :after sly-mrepl
    :bind (:map sly-mrepl-mode-map
                ("C-c C-k" . sly-mrepl-clear-recent-output)))
  ;; generalized documentation lookup
  :after sly
  :bind (:map sly-prefix-map
              ("M-h" . sly-documentation-lookup))
  )

;; (eval-after-load 'sly
;;   '(define-key sly-prefix-map (kbd "M-h") 'sly-documentation-lookup))

;; (eval-after-load 'sly-mrepl
;;   '(define-key sly-mrepl-mode-map (kbd "C-c C-k") 'sly-mrepl-clear-recent-output))

(provide 'rc-sly)
