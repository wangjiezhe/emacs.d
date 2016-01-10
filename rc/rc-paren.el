;;; Configuration for pare1nthesis

;;; autoload paredit in lisp modes
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook #'enable-paredit-mode)
(add-hook 'racket-mode-hook #'enable-paredit-mode)

;;; enable smartparens-mode
(smartparens-global-strict-mode 1)
(require 'smartparens-config)
;; (--each '("python-mode" "python")
;;   (eval-after-load it '(electric-pair-mode -1)))

(provide 'rc-paren)