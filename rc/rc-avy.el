;;; Configuration for avy

(use-package avy
  :bind (("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)
         ("M-g e" . avy-goto-word-0)
         ("C-'" . avy-goto-word-or-subword-1))
  :init
  (avy-setup-default))

(provide 'rc-avy)
