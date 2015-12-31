;;; Configuration for avy

;;; input one char, jump to it with a tree
;; (global-set-key (kbd "C-:") 'avy-goto-char)

;;; input two consecutive chars, jump to the first one with a tree
;; (global-set-key (kbd "C-'") 'avy-goto-char-2)

;;; input zero char, jump to a line start with a tree
;; (global-set-key (kbd "M-g f") 'avy-goto-line)

;;; input one char at word start, jump to a word start with a tree
;; (global-set-key (kbd "M-g w") 'avy-goto-word-1)

;;; input zero char, jump to a word start with a tree
;; (global-set-key (kbd "M-g e") 'avy-goto-word-0)

(global-set-key (kbd "C-'") 'avy-goto-word-or-subword-1)

;;; enable "C-'" in isearch-mode
(avy-setup-default)

(provide 'rc-avy)
