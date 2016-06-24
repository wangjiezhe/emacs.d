;;; Configuration for dictionarys

(use-package youdao-dictionary
  :bind ("C-c d" . youdao-dictionary-search-at-point)
  :config
  (setq url-automatic-caching t)
  (setq youdao-dictionary-search-history-file "~/.emacs.d/.youdao")
  (setq youdao-dictionary-use-chinese-word-segmentation t)
)

(provide 'rc-dictionary)
