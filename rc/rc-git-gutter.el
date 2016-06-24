;; Configuration for git-gutter

(use-package git-gutter
  :bind (("C-x v =" . git-gutter:popup-hunk)
         ("C-x p" . git-gutter:previous-hunk)
         ("C-x n" . git-gutter:next-hunk)
         ("C-x v s" . git-gutter:stage-hunk)
         ("C-x v r" . git-gutter:revert-hunk))
  :init
  (global-git-gutter-mode 1)
  (git-gutter:linum-init)
  :config
  (setq git-gutter:update-interval 1)
  (setq git-gutter:modified-sign "=="
        git-gutter:added-sign "++"
        git-gutter:deleted-sign "--")
  (setq git-gutter:lighter " GG")
  (setq git-gutter:handled-backends '(git hg svn bzr))
  (add-to-list 'git-gutter:update-hooks 'focus-in-hook)
  (add-to-list 'git-gutter:update-windows-commands 'other-window)
  (setq git-gutter:disabled-modes '(asm-mode image-mode))
  (setq git-gutter:hide-gutter t)
  (setq git-gutter:diff-option "-w")
)

(provide 'rc-git-gutter)
