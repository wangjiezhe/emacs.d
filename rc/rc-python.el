;;; Configuration for python

;;; enable elpy
(elpy-enable)

;;; use jedi as backend instead of rope
(setq elpy-rpc-backend "jedi")

;;; use ipython instead of standard python REPL
(elpy-use-ipython)

;;; enable autopep8 formatting on save
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;;; use flycheck instead of flymake
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(add-hook 'elpy-mode-hook
          (lambda ()
            (setq fill-column 120)
            (auto-fill-mode 1)
            ))


(provide 'rc-python)
