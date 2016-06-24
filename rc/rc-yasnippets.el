;; Configuration for yasnippet

(use-package yasnippet
  :bind (("s-w" . aya-create)
         ("s-y" . aya-expand))
  :init
  (yas-global-mode 1)
  :config
  ;; Make the "yas-minor-mode"'s expansion behavior to take input world including hyphen
  (defvar yas-key-syntaxes
    (list "w_" "w_." "w_.()" #'yas-try-key-from-whitespace))
)

(provide 'rc-yasnippets)
