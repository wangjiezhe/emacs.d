;;; Configuration for defaults.


;;; make buffer auto switch command auto suggestions, also for find-file command
(ido-mode 1)
;;; make ido display choices vertically
(setq ido-separator "\n")
;;; display any item that contains the chars you typed.
(setq ido-enable-flex-matching t)

;;; auto show completions for execute-extended-command
(icomplete-mode 1)

;;; keep a list of recent open files
(recentf-mode 1)

;;; auto close bracket insertion
(electric-pair-mode 1)

;;; make ibuffer default
(defalias 'list-buffers 'ibuffer)


;;; set UTF-8 as default file encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)


;;; stop creating those backup~ files
(setq make-backup-files nil)

;;; save bookmark immediately when changed
(setq bookmark-save-flag 1)

;;; rember cursor position
(require 'saveplace)
(setq-default save-place t)


;;; disable tab indentation by default
(setq-default indent-tabs-mode nil)

;;; use hippie expand instead of dbbrev-expand
(global-set-key (kbd "M-/") 'hippie-expand)

;;; use zap-up-to-char
(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR." t)
(global-set-key (kbd "M-z") 'zap-up-to-char)


;;; dont't let the cursor go into minibuffer prompt
(setq minibuffer-prompt-properties
      (quote (read-only t point-entered minibuffer-avoid-prompt
			face minibuffer-prompt)))

;;; after copy Ctrl+c in Linux X11, you can paste by `yank' in emacs
(setq x-select-enable-clipboard t)
;;; after mouse selection in X11, you can paste by `yank' in emacs
(setq x-select-enable-primary t)

;;; save clipboard strings into kill ring before replacing them
(setq save-interprogram-paste-before-kill t)

;;; apropos command perform more extensively searches
(setq apropos-do-all t)

;;; mouse yank at point instead of at click
(setq mouse-yank-at-point t)

;;; add a newline automatically at the end of the line when saved
(setq require-final-newline t)

;;; flash the frame to represent a bell
(setq visible-bell t)

;;; `load' prefers the newest version of a file
(setq load-prefer-newer t)

;;; ediff is set up to use the existing frame instead of creating a new one
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


;;; custom filetype
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.sage\\'" . python-mode))


(provide 'rc-defaults)
