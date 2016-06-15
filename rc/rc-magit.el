;; Configuration for magit-mode

(require 'magit-mode)
(require 'magit-process)

(add-hook 'after-save-hook 'magit-after-save-refresh-status)

;;; use ivy
(setq magit-completing-read-function 'ivy-completing-read)

;;; git wip
;; (magit-wip-after-save-mode)

(provide 'rc-magit)
