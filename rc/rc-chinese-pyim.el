;;; Configuration for chinese-pyim input method

(require 'chinese-pyim)
;; (setq default-input-method "chinese-pyim")
(setq default-input-method "TeX")

(chinese-pyim-greatdict-enable)

;;; enable pinyin search
(setq pyim-isearch-enable-pinyin-search t)

;;; dynamic change between Chinese and English
(setq-default pyim-english-input-switch-functions
              '(pyim-probe-program-mode
                pyim-probe-isearch-mode
                ;; pyim-probe-dynamic-english
                pyim-probe-org-speed-commands
                pyim-probe-org-structure-template))

(setq-default pyim-punctuation-half-width-functions
              '(pyim-probe-punctuation-line-beginning
                pyim-probe-punctuation-after-punctuation))

(setq pyim-use-tooltip 'popup
      pyim-page-length 5)

;;; disable fuzzy pinyin
(setq pyim-fuzzy-pinyin-alist '())

;;; use pyim to improve auto completion for chinese
(require 'chinese-pyim-company)
(setq pyim-company-max-length 6)


(provide 'rc-chinese-pyim)
