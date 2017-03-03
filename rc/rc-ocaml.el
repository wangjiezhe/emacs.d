;;; Configration for ocaml

;; Add the opam lisp dir to the emacs load path
(add-to-list
 'load-path
 (replace-regexp-in-string
  "\n" "/share/emacs/site-lisp"
  (shell-command-to-string "opam config var prefix")))

(require 'utop)
(require 'ocp-indent)

;; Automatically load utop.el
(setq utop-command "opam config exec -- utop -emacs")

(add-hook 'tuareg-mode-hook 'utop-minor-mode)


(provide 'rc-ocaml)
