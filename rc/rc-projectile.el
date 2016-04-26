;;; Configuration for projectile

;;; enable projectile
(projectile-global-mode)

;;; enable cashing
(setq projectile-enable-caching t)

;;; use ivy
(setq projectile-completion-system 'ivy)

(provide 'rc-projectile)
