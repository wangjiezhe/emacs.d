;; Configuration for smex

;; initialize first
(smex-initialize)

;; Bind keys for smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "<menu>") 'smex-major-mode-commands)
;; old M-x
(global-set-key (kbd "C-c M-x") 'execute-extended-command)

(provide 'rc-smex)
