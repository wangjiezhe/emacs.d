;;; Configuration for browsers

;;; make emacs always use its own browser for opening URL links
;;; or set specific browser to open links
(setq browse-url-browser-function 'eww-browse-url)

;;; enable command `eww-list-bookmarks'
;; (require 'eww)
(autoload 'eww-list-bookmarks "eww" "Display the bookmarks" t)

;;; press `f' to follow links
(eval-after-load "eww"
  '(progn (define-key eww-mode-map "f" 'eww-lnum-follow)
          (define-key eww-mode-map "F" 'eww-lnum-universal)))

;; (setq browse-url-browser-function 'browse-url-chromium)
;; (setq browse-url-browser-function 'browse-url-firefox)

;; (setq browse-url-browser-function 'w3m-browse-url)
;; (setq w3m-use-cookies t)

(provide 'rc-browser)
