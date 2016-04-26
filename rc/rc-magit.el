;; Configuration for magit-mode

(require 'magit-mode)

(add-hook 'after-save-hook 'magit-after-save-refresh-status)

;;; use ivy
(setq magit-completing-read-function 'ivy-completing-read)

(provide 'rc-magit)
