;;; Configuration for quickly switch windows

;;; ace-window
(use-package ace-window
  :bind ("M-p" . ace-window))

;;; switch-window
(use-package switch-window
  :bind ("C-x o" . switch-window))

;;; window-numbering
(use-package window-numbering
  :init
  (window-numbering-mode 1)
  :config
  (setq window-numbering-assign-func
        (lambda () (when (equal (buffer-name) "*Calculator*") 9)))
)

(provide 'rc-window)
