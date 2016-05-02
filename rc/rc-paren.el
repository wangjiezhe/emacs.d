;;; Configuration for pare1nthesis

;;; autoload paredit in lisp modes
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook #'enable-paredit-mode)
(add-hook 'racket-mode-hook #'enable-paredit-mode)
(add-hook 'racket-repl-mode-hook #'enable-paredit-mode)
(add-hook 'sly-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook #'enable-paredit-mode)
(add-hook 'inferior-scheme-mode-hook #'enable-paredit-mode)


(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'paredit-mode-hook
          (lambda () (electric-pair-mode 0)))

(add-hook 'prog-mode-hook 'paredit-everywhere-mode)
(eval-after-load 'paredit
  '(require 'paredit-menu))

;;; enable smartparens-mode
;; (smartparens-global-mode 1)
;; (require 'smartparens-config)
;; (--each '("python-mode" "python")
;;   (eval-after-load it '(electric-pair-mode -1)))

(define-key paredit-mode-map (kbd "M-[") 'paredit-backward)
(define-key paredit-mode-map (kbd "M-]") 'paredit-forward)

(global-set-key (kbd "C-=") 'er/expand-region)

(provide 'rc-paren)
