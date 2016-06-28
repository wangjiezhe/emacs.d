;;; Bootstrap for emacs

;; (add-to-list 'load-path (expand-file-name "~/.cask"))
(add-to-list 'load-path (expand-file-name "rc" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

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

;;; use emacs behind proxy
;; (setq url-proxy-services
;;       '(("https" . "127.0.0.1:8087")
;;         ;; ("http" . "127.0.0.1:8087")
;;         ("no-proxy" . "^\\(localhost\\|.*\\.popkit\\.org\\)")))

;;; use cask and pallet to manage packages
(require 'cask (expand-file-name "~/.cask/cask.el"))
(cask-initialize)
(require 'pallet)
(pallet-mode t)


;;; Load configs for specific features and modes

;;; built-in
(require 'rc-appearance)                ; change the appearance/gui
(require 'rc-defaults)                  ; change the default settings
(require 'rc-org)

(use-package recentf
  :bind ("C-c r" . recentf-open-files)
  :init
  (recentf-mode 1)
  :config
  (setq recentf-max-menu-items 25)
  (setq recentf-max-saved-items 30)
  (add-hook 'kill-emacs-hook 'remove-sudo-in-recentf)
)

(defun remove-sudo (flist)
  (cond
   ((null flist) (quote ()))
   ((string-prefix-p "/sudo:" (car flist)) (cdr flist))
   (t (cons (car flist) (remove-sudo (cdr flist))))))

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

;;; site-lisp
(require 'qt-pro)                       ; Qt Pro/Pri major mode
;; (require 'unicad)                       ; auto detect charset
;; (require 'srt-mode)
(require 'kconfig-mode)

;;; packages

(use-package undo-tree
  ;; use <f7> to show undo-tree (default is "C-x u", still available)
  :bind ("<f7>" . undo-tree-visualize)
  :init
  (global-undo-tree-mode 1))

(require 'rc-paren)

(use-package anzu
  :bind (("M-%" . anzu-query-replace-regexp)
         ("C-M-%" . anzu-query-replace-at-cursor))
  :init
  (global-anzu-mode 1))
  :config
  (setq anzu-replace-to-string-separator " => ")
  ;; use whitespace to split key word
  (setq search-whitespace-regexp ".*?")

(use-package isearch
  :bind (:map isearch-mode-map
              ;; up/down is history
              ("<up>" . isearch-ring-retreat)
              ("<down>" . isearch-ring-advance)
              ;; left/right is backward/forward
              ("<left>" . isearch-repeat-backward)
              ("<right>" . isearch-repeat-forward)))

(use-package ivy
  :bind (("C-s" . swiper)
         ("C-c C-r" . ivy-resume)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("<f2> i" . counsel-info-lookup-symbol)
         ("<f2> u" . counsel-unicode-char)
         ("C-c g" . counsel-git)
         ("C-c j" . counsel-git-grep)
         ("C-c k" . counsel-ag)
         ("C-x l" . counsel-locate)
         ("C-S-o" . counsel-rhythmbox))
  :bind (:map read-expression-map
              ("C-r" . counsel-expression-history))
  :bind (:map ivy-minibuffer-map
              ("<return>" . ivy-alt-done)
              ("C-f" . eh-ivy-open-current-typed-path))
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-extra-directories nil)
  (setq ivy-count-format "(%d/%d) ")
  )

(defun eh-ivy-open-current-typed-path ()
  (interactive)
  (when ivy--directory
    (let* ((dir ivy--directory)
           (text-typed ivy-text)
           (path (concat dir text-typed)))
      (delete-minibuffer-contents)
      (ivy--done path))))


(use-package chinese-pyim
  :config
  (chinese-pyim-greatdict-enable)
  (setq default-input-method "chinese-pyim")
  (setq pyim-isearch-enable-pinyin-search t)
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-program-mode
                  pyim-probe-isearch-mode
                  ;; pyim-probe-dynamic-english
                  pyim-probe-org-speed-commands
                  pyim-probe-org-structure-template))
  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))
  (setq pyim-use-tooltip 'popup
        pyim-page-length 5)
  (use-package chinese-pyim-company
    :config
    (setq pyim-company-max-length 6))
  )

(use-package magit
  :commands (magit-after-save-refresh-status
             magit-completing-read-function)
  :config
  (add-hook 'after-save-hook 'magit-after-save-refresh-status)
  (setq magit-completing-read-function 'ivy-completing-read)
  )

(use-package company
  :bind (:map company-active-map
              ("<tab>" . company-complete-common-or-cycle)
              ("<backtab>" . company-select-previous))
  :init
  (company-quickhelp-mode 1)
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-require-match 'never)
  ;; (setq company-quickhelp-delay nil)
  (add-to-list 'company-backends 'sly-company)
  (add-to-list 'company-backends '(company-jedi company-files))
)

(use-package git-gutter
  :bind (("C-x v =" . git-gutter:popup-hunk)
         ("C-x p" . git-gutter:previous-hunk)
         ("C-x n" . git-gutter:next-hunk)
         ("C-x v s" . git-gutter:stage-hunk)
         ("C-x v r" . git-gutter:revert-hunk))
  :init
  (global-git-gutter-mode 1)
  (git-gutter:linum-init)
  :config
  (setq git-gutter:update-interval 1)
  (setq git-gutter:modified-sign "=="
        git-gutter:added-sign "++"
        git-gutter:deleted-sign "--")
  (setq git-gutter:lighter " GG")
  (setq git-gutter:handled-backends '(git hg svn bzr))
  (add-to-list 'git-gutter:update-hooks 'focus-in-hook)
  (add-to-list 'git-gutter:update-windows-commands 'other-window)
  (setq git-gutter:disabled-modes '(asm-mode image-mode))
  (setq git-gutter:hide-gutter t)
  (setq git-gutter:diff-option "-w")
)

(use-package avy
  :bind (("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)
         ("M-g e" . avy-goto-word-0)
         ("C-'" . avy-goto-word-or-subword-1))
  :init
  (avy-setup-default))

;;; ace-window
(use-package ace-window
  :bind ("M-p" . ace-window))

;;; switch-window
(use-package switch-window
  :bind ("C-x o" . switch-window))

;;; window-numbering
(use-package window-numbering
  :init
  (window-numbering-mode 1)
  :config
  (setq window-numbering-assign-func
        (lambda () (when (equal (buffer-name) "*Calculator*") 9)))
)

(use-package tex
  :config
  ;; enable document parsing
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  ;; aware of the multi-file document structure
  (setq-default TeX-master nil)
  ;; enable RefTeX
  (use-package reftex
    :config
    (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
    ;; integrate RefTeX with AUCTeX
    (setq reftex-plug-into-AUCTeX t))
  ;; enable latex-extra
  (use-package latex-extra
    :config
    (add-hook 'LaTeX-mode-hook 'latex-extra-mode))
)

(require 'rc-c)

(use-package elpy
  :init
  (elpy-enable)
  (setq elpy-rpc-backend "jedi")

  :config
  (elpy-use-ipython)
  (add-hook 'elpy-mode-hook
            (lambda ()
              (setq fill-column 120)
              (auto-fill-mode 1)))

  (use-package flycheck
    :config
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode)
    )
  )

(use-package ag
  :config
  (setq ag-highlight-search t)
  (setq ag-reuse-buffers t)
  (setq ag-reuse-window t)
  )

(use-package sly
  :config
  ;; inferior lisp
  (setq inferior-lisp-program "sbcl")
  ;; multiple lisps
  (setq sly-lisp-implementations
        '((sbcl ("sbcl"))
          (ecl ("ecl"))
          (clisp ("clisp"))))
  ;; clear last REPL prompt's output
  (use-package sly-mrepl
    :after sly-mrepl
    :bind (:map sly-mrepl-mode-map
                ("C-c C-k" . sly-mrepl-clear-recent-output)))
  ;; generalized documentation lookup
  :after sly
  :bind (:map sly-prefix-map
              ("M-h" . sly-documentation-lookup))
  )

(use-package tabbar-ruler
  :bind ("C-c t" . tabbar-ruler-move)

  :init
  (tabbar-install-faces)

  :config
  (setq tabbar-ruler-global-tabbar t) ; If you want tabbar
  (setq tabbar-ruler-global-ruler t) ; if you want a global ruler
  (tabbar-ruler-group-buffer-groups)
  (tabbar-ruler-group-by-projectile-project)
)

(use-package projectile
  :init
  (projectile-global-mode)
  :config
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy))

(use-package browse-kill-ring+
  :bind ("C-c y" . browse-kill-ring)
  :init
  (setq browse-kill-ring-highlight-current-entry t))

(use-package yafolding
  :commands yafolding-show-all
  :bind (:map yafolding-mode-map
              ("<C-S-return>" . yafolding-hide-parent-element)
              ("<C-M-return>" . yafolding-toggle-all)
              ("<C-return>" . yafolding-toggle-element))
  :config
  (add-hook 'prog-mode-hook 'yafolding-mode))

(use-package youdao-dictionary
  :bind ("C-c d" . youdao-dictionary-search-at-point)
  :config
  (setq url-automatic-caching t)
  (setq youdao-dictionary-search-history-file "~/.emacs.d/.youdao")
  (setq youdao-dictionary-use-chinese-word-segmentation t)
)

(use-package ecb
  :config
  (setq ecb-layout-name "leftright2")
  (setq ecb-windows-width 0.2)
  (setq ecb-tip-of-the-day nil)
)

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package yasnippet
  :bind (("s-w" . aya-create)
         ("s-y" . aya-expand))
  :init
  (yas-global-mode 1)
  :config
  ;; Make the "yas-minor-mode"'s expansion behavior to take input world including hyphen
  (defvar yas-key-syntaxes
    (list "w_" "w_." "w_.()" #'yas-try-key-from-whitespace))
)

(require 'rc-scheme)
(require 'rc-eshell)

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
