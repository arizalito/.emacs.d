;;; org-mode

(straight-use-package 'org-mode)
(keymap-global-set "C-c a" #'org-agenda)
(keymap-global-set "C-c c" #'org-capture)
(setq org-agenda-files (directory-files-recursively "~/org/agenda/" "\\.org$"))

(provide 'init-org)
;;; init-org.el ends here
