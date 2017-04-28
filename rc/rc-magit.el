;; Configuration for magit-mode

(autoload 'magit-after-save-refresh-status "magit-mode" "Refresh the status buffer of the current repository." t)
(autoload 'magit-process-file "magit-process" "Process files synchronously in a separate process." t)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(add-hook 'after-save-hook 'magit-after-save-refresh-status)

;;; use ivy
(setq magit-completing-read-function 'ivy-completing-read)


(provide 'rc-magit)
