;;; Configuration for AUCTeX

(use-package tex
  :config
  ;; enable document parsing
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  ;; aware of the multi-file document structure
  (setq-default TeX-master nil)
  ;; enable RefTeX
  (use-package reftex
    :config
    (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
    ;; integrate RefTeX with AUCTeX
    (setq reftex-plug-into-AUCTeX t))
  ;; enable latex-extra
  (use-package latex-extra
    :config
    (add-hook 'LaTeX-mode-hook 'latex-extra-mode))
)

(provide 'rc-tex)
