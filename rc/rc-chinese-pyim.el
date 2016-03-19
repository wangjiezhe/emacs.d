;;; Configuration for chinese-pyim input method

(require 'chinese-pyim )
(setq default-input-method "chinese-pyim")

;;; user dicts
(set 'pyim-dicts
   (quote
    ((:name "BigDict" :file "~/.emacs.d/pyim/dicts/pyim-bigdict.pyim" :coding utf-8-unix :dict-type pinyin-dict))))

;;; dynamic change between Chinese and English
(setq-default pyim-english-input-switch-function
	      'pyim-dynamic-english-input-function)

;; (setq-default pyim-english-input-switch-functions
;;               '(pyim-probe-dynamic-english
;;                 pyim-probe-isearch-mode
;;                 pyim-probe-program-mode
;;                 pyim-probe-org-structure-template))

(setq-default pyim-punctuation-half-width-functions
              '(pyim-probe-punctuation-line-beginning
                pyim-probe-punctuation-after-punctuation))

;;; enable pinyin search
(setq pyim-isearch-enable-pinyin-search t)

(setq pyim-use-tooltip 'popup
      pyim-page-length 5)

;;; use pyim to improve auto completion for chinese
(setq pyim-company-max-length 6)

(provide 'rc-chinese-pyim)
