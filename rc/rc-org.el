;; Configuration for org-mode

;; make org mode allow eval of some langs
;; (require 'org)
;; (require 'ob)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   ;; (clojure . t)
   ( python . t)
   ;; (ruby . t)
   ))

;; make org mode syntax color embeded source code
(setq org-src-fontify-natively t)

;;; enable pdfview mode
;; (eval-after-load 'org '(require 'org-pdfview))
;; (add-to-list 'org-file-apps '("\\.pdf\\'" . org-pdfview-open))
;; (add-to-list 'org-file-apps '("\\.pdf::\\([[:digit:]]+\\)\\'" . org-pdfview-open))

;;; enable report to reStructuredText
(eval-after-load 'org '(require 'ox-rst))

;;; auto generate toc
(add-hook 'org-mode-hook 'toc-org-enable)
(add-to-list 'org-tag-alist '("TOC" . ?T))

(provide 'rc-org)
