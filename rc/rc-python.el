;;; Configuration for python

(use-package elpy
  :init
  (elpy-enable)
  (setq elpy-rpc-backend "jedi")

  :config
  (elpy-use-ipython)
  (add-hook 'elpy-mode-hook
            (lambda ()
              (setq fill-column 120)
              (auto-fill-mode 1)))

  (use-package flycheck
    :config
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode)
    )
  )

(provide 'rc-python)
