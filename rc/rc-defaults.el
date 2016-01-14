;;; Configuration for defaults.


;;; make buffer auto switch command auto suggestions, also for find-file command
(ido-mode 1)
;;; enable edo-everywhere
(ido-everywhere 1)
;;; enable flx with ido
(flx-ido-mode 1)
;;; make ido display choices vertically
(setq ido-separator "\n")
;;; display any item that contains the chars you typed.
(setq ido-enable-flex-matching t)
;;; disable ido faces to see flx highlights
(setq ido-use-faces nil)
;;; make some thresholds for flx larger
(setq flx-ido-threshold 10000)
(setq gc-cons-threshold 20000000)

;;; reopen file with sudo
(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;;; auto open read-only file with sudo
;; (defadvice ido-find-file (after find-file-sudo activate)
;;   "Find file as root if necessary."
;;   (unless (and buffer-file-name
;;                (file-writable-p buffer-file-name))
;;     (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;;; auto show completions for execute-extended-command
(icomplete-mode 1)

;;; auto close bracket insertion
;; (electric-pair-mode 1)
;; (setq electric-pair-pairs '(
;;                             (?\" . ?\")
;;                             (?\{ . ?\})
;;                             ))

;;; make ibuffer default
(defalias 'list-buffers 'ibuffer)


;;; set UTF-8 as default file encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(define-coding-system-alias 'UTF-8 'utf-8)
(define-coding-system-alias 'utf8 'utf-8)
(define-coding-system-alias 'UTF8 'utf-8)


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

;;; aloow minibuffer command while in the minibuffer
(setq enable-recursive-minibuffers t)

;; recenter the window when there is only three lines
(setq scroll-margin 3)

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

;;; use a larger kill ring
(setq kill-ring-max 200)

;;; add a newline automatically at the end of the line when saved
(setq require-final-newline t)

;;; flash the frame to represent a bell
(setq visible-bell t)

;;; `load' prefers the newest version of a file
(setq load-prefer-newer t)

;; Usage: emacs -diff file1 file2
(defun command-line-diff (switch)
  (let ((file1 (pop command-line-args-left))
        (file2 (pop command-line-args-left)))
    (ediff file1 file2)))
(add-to-list 'command-switch-alist '("diff" . command-line-diff))

;;; saner ediff default
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; (add-hook 'ediff-before-setup-hook 'new-frame)
;; (add-hook 'ediff-quit-hook 'delete-frame)

;;; visit image files as images
(auto-image-file-mode)

;;; enable Font-Lock mode to highlight
(global-font-lock-mode)

;;; auto revert
(global-auto-revert-mode)

;;; enable some diabled function
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

;;; use version control when save backups
;; (setq version-control t)
;; (setq kept-new-versions 3)
;; (setq delete-old-versions t)
;; (setq kept-old-versions 2)
;; (setq dired-kept-versions 1)

;;; enable editorconfig mode
(editorconfig-mode 1)

;;; custom filetype
;; (add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))
;; (add-to-list 'auto-mode-alist '("\\.sage\\'" . python-mode))
(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(mapc
 (function (lambda (setting)
             (setq auto-mode-alist
                   (cons setting auto-mode-alist))))
 '(("Cask" . emacs-lisp-mode)
   ("\\.sage\'" . python-mode)
   ("PKGBUILD" . pkgbuild-mode)
   ("\\.mkd\'" . markdown-mode)
   ("yaourtrc" . conf-mode)
   ("npmrc" . conf-mode)))


;;; user's information
(setq user-full-name "Jiezhe Wang")
(setq user-mail-address "wangjiezhe@gmail.com")


(provide 'rc-defaults)
