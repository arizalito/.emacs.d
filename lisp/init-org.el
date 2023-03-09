;;; org-mode

(straight-use-package 'org-mode)
(keymap-global-set "C-c a" #'org-agenda)
(keymap-global-set "C-c c" #'org-capture)

(provide 'init-org)
;;; init-org.el ends here
