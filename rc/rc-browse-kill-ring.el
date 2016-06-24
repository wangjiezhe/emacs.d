;;; Configuration for browse-kill-ring

(use-package browse-kill-ring+
  :bind ("C-c y" . browse-kill-ring)
  :init
  (setq browse-kill-ring-highlight-current-entry t))

(provide 'rc-browse-kill-ring)
