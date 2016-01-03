;;; Configuration for dictionarys

(global-set-key (kbd "C-c d") 'youdao-dictionary-search-at-point+)

;; Enable Cache
(setq url-automatic-caching t)


;; Set file path for saving search history
(setq youdao-dictionary-search-history-file "~/.emacs.d/.youdao")


;; Enable Chinese word segmentation support (支持中文分词)
(setq youdao-dictionary-use-chinese-word-segmentation t)

(provide 'rc-dictionary)
