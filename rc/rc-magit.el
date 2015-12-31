;; Configuration for magit-mode

(require 'magit-mode)

(add-hook 'after-save-hook 'magit-after-save-refresh-status)

(provide 'rc-magit)
