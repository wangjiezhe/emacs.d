;;; Configuration for chinese-pyim input method

(use-package chinese-pyim
  :config
  (chinese-pyim-greatdict-enable)
  (setq default-input-method "chinese-pyim")
  (setq pyim-isearch-enable-pinyin-search t)
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-program-mode
                  pyim-probe-isearch-mode
                  pyim-probe-dynamic-english
                  pyim-probe-org-speed-commands
                  pyim-probe-org-structure-template))
  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))
  (setq pyim-use-tooltip 'popup
        pyim-page-length 5)
  (use-package chinese-pyim-company
    :config
    (setq pyim-company-max-length 6))
  )

(provide 'rc-chinese-pyim)
