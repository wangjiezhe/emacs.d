;;; Configuration for search and replace

(use-package anzu
  :bind (("M-%" . anzu-query-replace-regexp)
         ("C-M-%" . anzu-query-replace-at-cursor))
  :init
  (global-anzu-mode 1))
  :config
  (setq anzu-replace-to-string-separator " => ")
  ;; use whitespace to split key word
  (setq search-whitespace-regexp ".*?")

(use-package isearch
  :bind (:map isearch-mode-map
              ;; up/down is history
              ("<up>" . isearch-ring-retreat)
              ("<down>" . isearch-ring-advance)
              ;; left/right is backward/forward
              ("<left>" . isearch-repeat-backward)
              ("<right>" . isearch-repeat-forward)))

(provide 'rc-search)
