;;; Configuration for search and replace

(global-anzu-mode 1)

;;; use regex replace by default
(global-set-key (kbd "M-%") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-at-cursor)

(setq anzu-replace-to-string-separator " => ")

;;; use whitespace to split key word
(setq search-whitespace-regexp ".*?")

;;; set arrow keys in isearch
;; up/down is history
(define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat )
(define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance )
;; left/right is backward/forward
(define-key isearch-mode-map (kbd "<left>") 'isearch-repeat-backward)
(define-key isearch-mode-map (kbd "<right>") 'isearch-repeat-forward)


(provide 'rc-search)
