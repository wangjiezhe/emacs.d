;; Configuration for yasnippet

;; auto enable yasnippet
(yas-global-mode 1)
(yas-reload-all)

(defun my-yas-init ()
  (yas-minor-mode 1)
  (yas-reload-all)
  )

;; (add-hook 'prog-mode-hook 'my-yas-init)

;; Make the "yas-minor-mode"'s expansion behavior to take input world including hyphen
;; (setq yas-key-syntaxes
;;       (list "w_" "w_." "w_.()" #'yas-try-key-from-whitespace))

(provide 'rc-yasnippets)
