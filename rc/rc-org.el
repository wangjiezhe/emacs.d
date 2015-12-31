;; Configuration for org-mode

;; make org mode allow eval of some langs
(require 'org)
(require 'ob)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   ;; (clojure . t)
   ( python . t)
   ;; (ruby . t)
   ))

;; make org mode syntax color embeded source code
(setq org-src-fontify-natively t)

(provide 'rc-org)
