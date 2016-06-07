#!/bin/sh -e

echo "Attempting startup...\n"

${EMACS:=emacs} -nw -batch -eval \
                '(let ((user-init-file (expand-file-name "init.el")))
                   (load-file user-init-file)
                   (run-hooks (quote after-init-hook)))'

echo "\nStartup successful"
