;;; Configuration for undo-tree-mode

(use-package undo-tree
  ;; use <f7> to show undo-tree (default is "C-x u", still available)
  :bind ("<f7>" . undo-tree-visualize)
  :init
  (global-undo-tree-mode 1))

(provide 'rc-undo-tree)
