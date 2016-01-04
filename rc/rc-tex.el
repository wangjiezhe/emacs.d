;;; Configuration for AUCTeX

;;; enable document parsing
(setq TeX-auto-save t)
(setq TeX-parse-self t)

;;; aware of the multi-file document structure
(setq-default TeX-master nil)

;;; enable RefTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
;; (add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode

;;; integrate RefTeX with AUCTeX
(setq reftex-plug-into-AUCTeX t)

;;; enable latex-extra
(add-hook 'LaTeX-mode-hook #'latex-extra-mode)

(provide 'rc-tex)
