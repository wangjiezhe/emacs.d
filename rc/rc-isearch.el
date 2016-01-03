;;; Configuration for isearch mode

;;; use whitespace to split key word
(setq search-whitespace-regexp ".*?")

;;; search for regular expression first
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'flx-isearch-forward)
(global-set-key (kbd "C-M-r") 'flx-isearch-backward)

;;; set arrow keys in isearch
(progn
  ;; up/down is history
  (define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat )
  (define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance )
  ;; left/right is backward/forward
  (define-key isearch-mode-map (kbd "<left>") 'isearch-repeat-backward)
  (define-key isearch-mode-map (kbd "<right>") 'isearch-repeat-forward)
  ;; RET to exit
  )

(provide 'rc-isearch)
