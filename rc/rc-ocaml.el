;;; Configration for ocaml

(setq utop-command "opam config exec -- utop -emacs")

(add-hook 'tuareg-mode-hook 'utop-minor-mode)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)


(provide 'rc-ocaml)
