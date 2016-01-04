;;; Configuration for multiple cursor

;;; add multiple cursors based on continues lines
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;;; add multiple cursors based on key words
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(provide 'rc-multiple-cursor)
