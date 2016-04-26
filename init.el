;;; Bootstrap for emacs

;; (add-to-list 'load-path (expand-file-name "~/.cask"))
(add-to-list 'load-path (expand-file-name "rc" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisps" user-emacs-directory))

;;; set UTF-8 as default file encoding
(set-language-environment "UTF-8")
;; (set-default-coding-systems 'utf-8)
;; (set-default buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(define-coding-system-alias 'UTF-8 'utf-8)
(define-coding-system-alias 'utf8 'utf-8)
(define-coding-system-alias 'UTF8 'utf-8)

;;; use emacs behind proxy
(setq url-proxy-services
      '(("https" . "127.0.0.1:8087")
        ;; ("http" . "127.0.0.1:8087")
        ("no-proxy" . "^\\(localhost\\|.*\\.popkit\\.org\\)")))

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
(require 'rc-recentf)
(require 'rc-isearch)
(require 'rc-org)
(require 'rc-browser)

;;; site-lisps
(require 'qt-pro)                       ; Qt Pro/Pri major mode
;; (require 'unicad)                       ; auto detect charset
;; (require 'srt-mode)
(require 'kconfig-mode)

;;; packages
(require 'rc-smex)
(require 'rc-undo-tree)
(require 'rc-paren)
(require 'rc-chinese-pyim)
(require 'rc-magit)
(require 'rc-company)
(require 'rc-git-gutter)
(require 'rc-avy)
(require 'rc-window)
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
(require 'rc-yasnippets)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
