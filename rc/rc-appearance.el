;;; Configuration for appearance

(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))

;;; custom theme
;; (setq molokai-theme-kit t)
(load-theme 'molokai t)
;; (if (display-graphic-p)
;;     (load-theme 'molokai t)
;;   (load-theme 'material t))
;; (if (display-graphic-p)
;;     (load-theme 'airline-molokai t))

;;; set a default font
(when (and (display-graphic-p)
           (member "Source Code Pro" (font-family-list)))
  (set-frame-font "Source Code Pro-13:demibold")
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      "Source Han Sans CN")))


;;; hide the startup message
(setq inhibit-startup-message t)


;;; hide menu bar
(unless (display-graphic-p)
  (menu-bar-mode -1))

;;; hide tool bar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;;; hid scroll bar
(when (and (not (display-graphic-p))
           (fboundp 'scroll-bar-mode))
  (scroll-bar-mode -1))


;;; show directory name when open files with same names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;;; show buffer name in title instead of hostname
(setq frame-title-format "emacs@%b")


;;; always show line numbers
(global-linum-mode 1)
;;; highlight line numbers
(hlinum-activate)
(setq linum-highlight-in-all-buffersp t)

;;; always show line and column number
(line-number-mode 1)
(column-number-mode 1)


;;; turn on highlight current line
(global-hl-line-mode 1)

;;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)
(setq show-paren-style 'mixed)	; parenthesis, expression or mixed

;;; start rainbow-delimiters mode automatically in most programming modes
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


;;; make soft wrap
(global-visual-line-mode 1)

;;; display "lambda" as "λ"
(global-prettify-symbols-mode 1)

;;; avoid mouse point gets too close to cursor
;; (mouse-avoidance-mode 'animate)

;;; set fill-column
(setq fill-column 80)


(provide 'rc-appearance)
