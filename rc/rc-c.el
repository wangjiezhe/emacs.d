;;; Configuration for C/C++

;;; enable function-args
(fa-config-default)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(set-default 'semantic-case-fold t)

(provide 'rc-c)
