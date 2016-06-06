#!/bin/sh -e

echo "Attempting startup..."

${EMACS:=emacs} --batch --eval \
                '(let ((debug-on-error t)
                       (user-init-file (expand-file-name "init.el")))
                   (load-file user-init-file)
                   (run-hook (quote after-init-hook)))'

echo "Startup successful"
