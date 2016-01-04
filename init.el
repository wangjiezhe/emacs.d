;;; Bootstrap for emacs

;; (add-to-list 'load-path (expand-file-name "~/.cask"))
(add-to-list 'load-path (expand-file-name "rc" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisps" user-emacs-directory))

;;; use cask and pallet to manage packages
(require 'cask (expand-file-name "~/.cask/cask.el"))
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;;; use ELPA/MELPA package system
;; (require 'package)
;; (add-to-list 'package-archives
;; 	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (add-to-list 'package-archives
;; 	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("elpy" . "https://jorgenschaefer.github.io/packages/") t)
;; (package-initialize)


;;; Load configs for specific features and modes

;;; built-in
(require 'rc-appearance)                ; change the appearance/gui
(require 'rc-defaults)                  ; change the default settings
(require 'rc-isearch)
(require 'rc-org)

;;; packages
(require 'rc-smex)
(require 'rc-dired)
(require 'rc-undo-tree)
(require 'rc-paredit)
(require 'rc-browser)
(require 'rc-yasnippets)
(require 'rc-auto-yasnippet)
(require 'rc-chinese-pyim)
(require 'rc-magit)
(require 'rc-company)
(require 'rc-git-gutter)
(require 'rc-avy)
(require 'rc-window)
(require 'rc-bookmark)
(require 'rc-tex)
(require 'rc-python)
(require 'rc-ag)
(require 'rc-sly)
(require 'rc-tabbar-ruler)
(require 'rc-projectile)
(require 'rc-browse-kill-ring)
(require 'rc-yafolding)
(require 'rc-dictionary)
(require 'rc-ecb)
(require 'rc-multiple-cursor)

;;; site-lisps
(require 'unicad)                       ; auto detect charset
