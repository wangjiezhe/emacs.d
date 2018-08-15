;;; Bootstrap for emacs

(add-to-list 'exec-path (concat (getenv "HOME") "/.opam/system/bin"))

;;; set UTF-8 as default file encoding
(set-language-environment "UTF-8")
;; (set-default-coding-systems 'utf-8)
;; (set-default buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(define-coding-system-alias 'UTF-8 'utf-8)
(define-coding-system-alias 'utf8 'utf-8)
(define-coding-system-alias 'UTF8 'utf-8)

(setq temporary-file-directory
      (expand-file-name "emacs" temporary-file-directory))
(make-directory temporary-file-directory t)

;; (setq package-archives '(("gnu"   . "https://")
;;                       ("melpa" . "https://melpa.org/packages/")))
(require 'package)
;; (add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))
(add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/"))
(package-initialize)


;;; custom theme
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
(load-theme 'molokai t)

;;; set a default font
(when (and (display-graphic-p)
           (member "Source Code Pro" (font-family-list)))
  (set-frame-font "Source Code Pro-13:demibold")
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Source Han Sans CN"))))

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

;;; stop creating those backup~ files
(setq make-backup-files nil)

;;; make ibuffer default
(defalias 'list-buffers 'ibuffer)

;;; always show line numbers
(global-linum-mode 1)

;;; always show line and column number
(line-number-mode 1)
(column-number-mode 1)

;;; turn on highlight current line
(global-hl-line-mode 1)

;;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)
(setq show-paren-style 'mixed)	; parenthesis, expression or mixed

;;; make soft wrap
(global-visual-line-mode 1)

;;; display "lambda" as "λ"
(global-prettify-symbols-mode 1)

;;; set fill-column
(setq fill-column 80)

(use-package highlight-defined
  :ensure t
  :hook (emacs-lisp-mode . highlight-defined-mode) )

(use-package flx-ido
  :ensure t
  :config
  ;; enable ido with flx
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  (setq ido-separator "\n")
  ;;; disable ido faces to see flx highlights
  (setq ido-enable-flex-matching t)
  ;; (setq ido-use-faces nil)
  ;;; make some thresholds for flx larger
  (setq flx-ido-threshold 10000)
  (setq gc-cons-threshold 20000000)
  ;;; disable prompt when creating new buffer
  (setq ido-create-new-buffer 'always))

;;; disable yes-or-no-p
;; (defalias 'yes-or-no-p 'y-or-n-p)

;;; faster than the default scp
(setq tramp-default-method "ssh")

;;; use bash inside tramp
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

;;; reopen file with sudo
(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo::"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo::" buffer-file-name))))

;;; auto open read-only file with sudo
;; (defadvice ido-find-file (after find-file-sudo activate)
;;   "Find file as root if necessary."
;;   (unless (and buffer-file-name
;;                (file-writable-p buffer-file-name))
;;     (find-alternate-file (concat "/sudo::" buffer-file-name))))

;;; auto show completions for execute-extended-command
(icomplete-mode 1)

;;; make ibuffer default
(defalias 'list-buffers 'ibuffer)


;;; stop creating those backup~ files
(setq make-backup-files nil)

;;; save bookmark immediately when changed
(setq bookmark-save-flag 1)

;;; rember cursor position
(require 'saveplace)
(setq-default save-place t)


;;; disable tab indentation by default
(setq-default indent-tabs-mode nil)

;;; make the tab do complete
(setq-default tab-always-indent 'complete)


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


;;; clean up white space before save
(add-hook 'before-save-hook 'whitespace-cleanup)

;;; enable which-key mode
;; (which-key-mode)


;;; user's information
(setq user-full-name "Jiezhe Wang")
(setq user-mail-address "wangjiezhe@gmail.com")

(use-package pkgbuild-mode
  :ensure t
  :init
  (setq pkgbuild-user-full-name "wangjiezhe")
  (setq pkgbuild-user-mail-address "wangjiezhe AT yandex DOT com"))

(use-package undohist
  :ensure t
  :config
  (undohist-initialize)
  (setq undohist-ignored-files '("COMMIT_EDITMSG"))
  (setq undo-outer-limit 50000000))


(setq default-input-method "TeX")

(defun single-lines-only ()
  "replace multiple blank lines with a single one"
  (interactive)
  (goto-char (point-min))
  (while (re-search-forward "\\(^\\s-*$\\)\n" nil t)
    (replace-match "\n")
    (forward-char 1)))



;;; move according to logical line
(global-set-key (kbd "M-n") 'next-logical-line)
(global-set-key (kbd "M-p") 'previous-logical-line)

;;; remove more than one blank line
(defun single-lines-only ()
  "replace multiple blank lines with a single one"
  (interactive)
  (goto-char (point-min))
  (while (re-search-forward "\\(^\\s-*$\\)\n" nil t)
    (replace-match "\n")
    (forward-char 1)))

;;; recentf-mode
(use-package recentf
  :bind ("C-c r" . recentf-open-files)
  :config
  (setq recentf-max-menu-items 25)
  (setq recentf-max-saved-items 30)
  (recentf-mode 1)

  (defun remove-sudo-T (filelist savelist)
    (if (null savelist)
        (setq savelist (quote ())))
    (cond ((null filelist) (nreverse savelist))
          ((string-prefix-p "/sudo:" (car filelist))
           (remove-sudo-T (cdr filelist) savelist))
          (t (remove-sudo-T (cdr filelist)
                            (cons (car filelist) savelist)))))
  (defun remove-sudo-in-recentf ()
    (setq recentf-list
          (remove-sudo-T recentf-list nil)))
  (add-hook 'kill-emacs-hook 'remove-sudo-in-recentf))


;;; make the tab do complete
(setq-default tab-always-indent 'complete)

;;; use hippie expand instead of dbbrev-expand
(global-set-key (kbd "M-/") 'hippie-expand)

;;; use zap-up-to-char
(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR." t)
(global-set-key (kbd "M-z") 'zap-up-to-char)


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

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package novel-mode
  :load-path "site-lisp"
  :config
  (setq novel-default-margin 9))

(use-package kconfig-mode
  :load-path "site-lisp")

(use-package qt-pro
  :load-path "site-lisp")

;;; highlight line numbers
(use-package hlinum
  :ensure t
  :config
  (hlinum-activate)
  (setq linum-highlight-in-all-buffersp t))

(use-package switch-window
  :ensure t
  :bind ("C-x o" . switch-window))

(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode 1)
  (setq window-numbering-assign-func
        (lambda () (when (equal (buffer-name) "*Calculator*") 9))))

(use-package paredit
  :ensure t
  :hook ((emacs-lisp-mode
          eval-expression-minibuffer-setup
          ielm-mode
          lisp-mode
          lisp-interaction-mode
          scheme-mode
          racket-mode
          racket-repl-mode
          sly-mode
          inferior-scheme-mode
          lua-mode) . enable-paredit-mode))

(use-package paredit-everywhere
  :ensure t
  :hook (prog-mode . paredit-everywhere-mode))

(use-package paredit-menu
  :ensure t
  :after paredit
  :config
  (define-key paredit-mode-map (kbd "M-[") 'paredit-backward)
  (define-key paredit-mode-map (kbd "M-]") 'paredit-forward))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package anzu
  :ensure t
  :config
  (global-anzu-mode 1)
  ;;; use regex replace by default
  (global-set-key [remap query-replace] 'anzu-query-replace-regexp)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-at-cursor)
  (setq anzu-replace-to-string-separator " => ")
  ;;; use whitespace to split key word
  (setq search-whitespace-regexp ".*?")
  ;;; set arrow keys in isearch
  ;; up/down is history
  (define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat )
  (define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance )
  ;; left/right is backward/forward
  (define-key isearch-mode-map (kbd "<left>") 'isearch-repeat-backward)
  (define-key isearch-mode-map (kbd "<right>") 'isearch-repeat-forward))

(use-package avy
  :ensure t
  :config
  ;;; input one char, jump to it with a tree
  ;; (global-set-key (kbd "C-:") 'avy-goto-char)
  ;;; input two consecutive chars, jump to the first one with a tree
  ;; (global-set-key (kbd "C-'") 'avy-goto-char-2)
  ;;; input zero char, jump to a line start with a tree
  (global-set-key (kbd "M-g f") 'avy-goto-line)
  ;;; input one char at word start, jump to a word start with a tree
  (global-set-key (kbd "M-g w") 'avy-goto-word-1)
  ;;; input zero char, jump to a word start with a tree
  (global-set-key (kbd "M-g e") 'avy-goto-word-0)
  (global-set-key (kbd "C-'") 'avy-goto-word-or-subword-1)
  ;;; enable "C-'" in isearch-mode
  (avy-setup-default))

(use-package smex
  :ensure t)

(use-package counsel
  :ensure t
  :init
  (setq ivy-count-format "(%d/%d) ")
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-extra-directories nil)

  (defun eh-ivy-open-current-typed-path ()
    (interactive)
    (when ivy--directory
      (let* ((dir ivy--directory)
             (text-typed ivy-text)
             (path (concat dir text-typed)))
        (delete-minibuffer-contents)
        (ivy--done path))))

  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
  (define-key ivy-minibuffer-map (kbd "<return>") 'ivy-alt-done)
  (define-key ivy-minibuffer-map (kbd "C-f") 'eh-ivy-open-current-typed-path)

  :bind (("M-x". counsel-M-x)
         ("C-s". swiper)
         ("C-c k". counsel-rg)
         ("C-c g" . counsel-git)
         ("C-c j" . counsel-git-grep)
         ("C-x C-f". counsel-find-file)
         ("C-c C-r". ivy-resume)))

(use-package magit
  :ensure t
  ;; :commands (magit-after-save-refresh-status magit-process-file)
  :bind (("C-x g". magit-status)
         ("C-x M-g". magit-dispatch-popup))
  :hook (after-save . magit-after-save-refresh-status)
  :config
  ;; use ivy
  (setq magit-completing-read-function 'ivy-completing-read))

(use-package company
  :ensure t
  :requires company-quickhelp
  :hook (after-init . global-company-mode)
  :init
  :config
  ;; activate quickhelp
  (company-quickhelp-mode 1)
  ;; make TAB complete first, then cycle
  ;; make S-TAB cycle backwardg
  (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "<backtab>") 'company-select-previous)
  (define-key company-active-map (kbd "\C-n") 'company-select-next)
  (define-key company-active-map (kbd "\C-p") 'company-select-previous)
  (define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
  (define-key company-active-map (kbd "M-.") 'company-show-location)
  ;; cancel selections by typing non-matching characters
  (setq company-require-match 'never)
  ;;; custom backends
  (add-to-list 'company-backends '(company-jedi company-files)))

;; (use-package sly-company
;;   :ensure t)

(use-package sly
  :ensure t
  :hook (sly-mode . sly-company-mode)
  :init
  ;;; inferior lisp
  (setq inferior-lisp-program "sbcl --no-linedit")
  :config
  ;;; generalized documentation lookup
  (define-key sly-prefix-map (kbd "M-h") 'sly-documentation-lookup)
  ;;; clear last REPL prompt's output
  (eval-after-load 'sly-mrepl
    '(define-key sly-mrepl-mode-map (kbd "C-c C-k") 'sly-mrepl-clear-recent-output))
  ;;; multiple lisps
  (setq sly-lisp-implementations
        '((sbcl ("sbcl"))
          (ecl ("ecl"))
          (clisp ("clisp")))))

(use-package dired+
  :ensure t
  :init
  (setq diredp-hide-details-initially-flag nil)
  ;; (setq dired-listing-switches "-alF")
  (setq dired-listing-switches "-lh --group-directories-first")
  )

(use-package vlf
  :ensure t
  :requires vlf-setup
  )

(use-package bookmark+
  :ensure t
  :config
  (setq bmkp-last-as-first-bookmark-file nil))

(use-package flycheck
  :ensure t)

(use-package ggtags
  :ensure t)

(use-package irony-eldoc
  :ensure t)

(use-package function-args
  :ensure t
  :config
  (fa-config-default)
  (set-default 'semantic-case-fold t))

(use-package irony
  :ensure t
  :hook (((c-mode c++-mode objc-mode) . irony-mode)
         (irony-mode . (irony-eldoc flycheck-mode ggtags-mode irony-cdb-autosetup-compile-options)))
  :init
  ;; function decides whether .h file is C or C++ header, sets C++ by
  ;; default because there's more chance of there being a .h without a
  ;; .cc than a .h without a .c (ie. for C++ template files)
  (defun c-c++-header ()
    "sets either c-mode or c++-mode, whichever is appropriate for
header"
    (interactive)
    (let ((c-file (concat (substring (buffer-file-name) 0 -1) "c")))
      (if (file-exists-p c-file)
          (c-mode)
        (c++-mode))))
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c-c++-header))

  ;; and if that doesn't work, a function to toggle between c-mode and
  ;; c++-mode
  (defun c-c++-toggle ()
    "toggles between c-mode and c++-mode"
    (interactive)
    (cond ((string= major-mode "c-mode")
           (c++-mode))
          ((string= major-mode "c++-mode")
           (c-mode))))
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  )

(use-package elpy
  :ensure t
  :hook (elpy-mode . flycheck-mode)
  :config
  (elpy-enable)
  (setq elpy-modules (delq 'elpy-module-flymake) elpy-modules)
  (setq elpy-rpc-backend "jedi")
  (setq python-shell-interpreter "ipython")
  (setq python-shell-interpreter-args "-i --simple-prompt")
  (add-hook 'elpy-mode-hook
            (lambda ()
              (setq fill-column 120)
              (auto-fill-mode 1)
              )))

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  ;; Make the "yas-minor-mode"'s expansion behavior to take input world including hyphen
  (defvar yas-key-syntaxes
    (list "w_" "w_." "w_.()" #'yas-try-key-from-whitespace)))

(use-package auto-yasnippet
  :ensure t
  :bind (("s-w" . aya-create)
         ("s-y" . aya-expand)))

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode 1)
  :bind ("<f7> . undo-tree-visualize"))

(use-package utop
  :ensure t
  :init
  (setq utop-command "opam config exec -- utop -emacs"))

(use-package merlin
  :ensure t
  :config
  (setq merlin-use-auto-complete-mode t)
  (setq merlin-error-after-save nil))

(use-package tuareg
  :ensure t
  :hook (tuareg-mode . (utop-minor-mode merlin-mode)))

(use-package browse-kill-ring
  :ensure t
  :bind ("C-c y" . browse-kill-ring)
  :config
  (setq browse-kill-ring-highlight-current-entry t))

(mapc
 (lambda (setting)
   (setq auto-mode-alist
         (cons setting auto-mode-alist)))
 '(("/Cask" . cask-mode)
   ("\\.sage\\'" . python-mode)
   ("PKGBUILD" . pkgbuild-mode)
   ("\\.install\\'" . sh-mode)
   ("\\.zsh\\'" . sh-mode)
   ("\\.mkd\\'" . markdown-mode)
   ("/README\\'" . markdown-mode)
   ("rc\\(\\'\\|\\.\\)" . conf-mode)
   ("co?nf\\'" . conf-mode)
   ("\\.repo\\'" . conf-mode)
   ("/enp5s0-" . conf-mode)
   ("/wlp4s0-" . conf-mode)
   ("/mirrorlist" . conf-mode)
   ("\\.rules\\'" . conf-mode)
   ("\\.tm\\'" . xml-mode)
   ("\\.ts\\'" . xml-mode)
   ("\\.pac\\'" . javascript-mode)
   ("\\.conkyrc\\'" . lua-mode)
   ("\\.pr[io]\\'" . qt-pro-mode)
   ("\\.vim\\(rc\\)?" . vimrc-mode)
   ("\\.srt\\'" . srt-mode)
   ("\\.lua\\'" . lua-mode)
   ("/MF-" . makefile-gmake-mode)
   ("/[Mm]akefile" . makefile-gmake-mode)
   ("/MF-.*\.in\\'" . makefile-automake-mode)
   ("/[Mm]akefile.*\\.in\\'" . makefile-automake-mode)
   ("\\.kv\\'" . kivy-mode)
   ("\\.pl\\'" . prolog-mode)
   ("\\.topscript\\'" . tuareg-mode)
   ("\\.ocamlinit\\'" . tuareg-mode)
   ("\\.ml[ily]\\'" . tuareg-mode)
   ("\\.topml\\'" . tuareg-mode)
   ("\\.ipy\\'" . python-mode)
   ("\\.sbclrc\'" . lisp-mode)
   ))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (systemd browse-kill-ring merlin tuareg utop undo-tree auto-yasnippet common-lisp-snippets haskell-snippets java-snippets smex yasnippet-snippets avy anzu company-jedi function-args flycheck ggtags irony-eldoc irony expand-region highlight-defined multiple-cursors flx-ido elpy bookmark+ editorconfig paredit switch-window window-numbering lua-mode undohist pkgbuild-mode vlf use-package sly rainbow-delimiters paredit-menu paredit-everywhere magit hlinum dired+ counsel company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
