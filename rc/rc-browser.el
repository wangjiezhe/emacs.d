;;; Configuration for browsers

(use-package eww
  :commands eww-list-bookmarks
  :init
  ;; eww-browse-url, browse-url-chromium, browse-url-firefox
  (setq browse-url-browser-function 'eww-browse-url)

  :after eww
  :bind (:map eww-mode-map
              ("f" . eww-lnum-follow)
              ("F" . eww-lnum-universal))
)

(provide 'rc-browser)
