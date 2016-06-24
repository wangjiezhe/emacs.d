;; Configuration for magit-mode

(use-package magit
  :commands (magit-after-save-refresh-status
             magit-completing-read-function)
  :config
  (add-hook 'after-save-hook 'magit-after-save-refresh-status)
  (setq magit-completing-read-function 'ivy-completing-read)
  )

(provide 'rc-magit)
