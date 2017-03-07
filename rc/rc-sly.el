;;; Configuration for sly

;;; inferior lisp
(setq inferior-lisp-program "sbcl --no-linedit")

;;; generalized documentation lookup
(eval-after-load 'sly
  '(define-key sly-prefix-map (kbd "M-h") 'sly-documentation-lookup))

;;; clear last REPL prompt's output
(eval-after-load 'sly-mrepl
  '(define-key sly-mrepl-mode-map (kbd "C-c C-k") 'sly-mrepl-clear-recent-output))

;;; multiple lisps
(setq sly-lisp-implementations
      '((sbcl ("sbcl"))
        (ecl ("ecl"))
        (clisp ("clisp"))))

(add-hook 'sly-mode-hook 'sly-company-mode)


(provide 'rc-sly)
