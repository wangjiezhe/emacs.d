;;; Configuration for yafolding

(use-package yafolding
  :bind (:map yafolding-mode-map
              ("<C-S-return>" . yafolding-hide-parent-element)
              ("<C-M-return>" . yafolding-toggle-all)
              ("<C-return>" . yafolding-toggle-element))
  :config
  (add-hook 'prog-mode-hook 'yafolding-mode))

(provide 'rc-yafolding)
