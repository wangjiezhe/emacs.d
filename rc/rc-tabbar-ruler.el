;;; Configuration for tabbar and ruler

(setq tabbar-ruler-global-tabbar t) ; If you want tabbar
(setq tabbar-ruler-global-ruler t) ; if you want a global ruler
;; (setq tabbar-ruler-popup-menu t) ; If you want a popup menu.
;; (setq tabbar-ruler-popup-toolbar t) ; If you want a popup toolbar
;; (setq tabbar-ruler-popup-scrollbar t) ; If you want to only show the
;;                                       ; scroll bar when your mouse is moving.

(require 'tabbar-ruler)

(global-set-key (kbd "C-c t") 'tabbar-ruler-move)

(tabbar-ruler-group-buffer-groups)
(tabbar-ruler-group-by-projectile-project)

(provide 'rc-tabbar-ruler)
