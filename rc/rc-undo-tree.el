;;; Configuration for undo-tree-mode

;;; enable undo-tree
(global-undo-tree-mode 1)

;;; use <f7> to show undo-tree (default is "C-x u", still available)
(global-set-key (kbd "<f7>") 'undo-tree-visualize)

(provide 'rc-undo-tree)
