;;; Configuration for quickly switch windows

;;; ace-window
(global-set-key (kbd "M-p") 'ace-window)

;;; switch-window
(global-set-key (kbd "C-x o") 'switch-window)

;;; window-numbering
(window-numbering-mode 1)
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))

(provide 'rc-window)
