;;; configuration for recentf-mode

;;; keep a list of recent open files
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 30)
(recentf-mode 1)
(global-set-key (kbd "C-c r") 'recentf-open-files)

;;; remove files opened with sudo in recentf-list
;; (defun remove-sudo (flist)
;;   (cond
;;    ((null flist) (quote ()))
;;    ((string-prefix-p "/sudo:" (car flist)) (cdr flist))
;;    (t (cons (car flist) (remove-sudo (cdr flist))))))

(defun remove-sudo-T (filelist savelist)
  (if (null savelist)
      (setq savelist (quote ())))
  (cond ((null filelist) (nreverse savelist))
        ((string-prefix-p "/sudo:" (car filelist))
         (remove-sudo-T (cdr filelist) savelist))
        (t (remove-sudo-T (cdr filelist) (cons (car filelist) savelist)))))

(defun remove-sudo-in-recentf ()
  (setq recentf-list
        (remove-sudo-T recentf-list nil)))

(add-hook 'kill-emacs-hook 'remove-sudo-in-recentf)

(provide 'rc-recentf)
