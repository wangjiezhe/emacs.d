;;; Configuration for projectile

(use-package projectile
  :init
  (projectile-global-mode)
  :config
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy))

(provide 'rc-projectile)
