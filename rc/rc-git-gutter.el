;; Configuration for git-gutter

;; enable global minor mode
(global-git-gutter-mode 1)

;; use git-gutter with linum-mode
(git-gutter:linum-setup)

;; key bindings
(global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

;; live updating
(setq git-gutter:update-interval 1)

;; change signs
(setq git-gutter:modified-sign "=="
      git-gutter:added-sign "++"
      git-gutter:deleted-sign "--")

;; change minor-mode name in mode-line
(setq git-gutter:lighter " GG")

;; custom backends
(setq git-gutter:handle-backends '(git hg svn bzr))

;; update hooks
(add-to-list 'git-gutter:update-hooks 'focus-in-hook)

;; update commands
(add-to-list 'git-gutter:update-commands 'other-window)

;; disactivate modes
(setq git-gutter:disabled-modes '(asm-mode image-mode))

;; hide gutter if there is no changes
(setq git-gutter:hide-gutter t)

;; pass options to `git diff' command
;; ignore all spaces
(setq git-gutter:diff-option "-w")

(provide 'rc-git-gutter)
