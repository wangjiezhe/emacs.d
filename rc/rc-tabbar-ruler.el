;;; Configuration for tabbar and ruler

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

(provide 'rc-tabbar-ruler)
