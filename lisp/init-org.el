;;; org-mode

(straight-use-package 'org-mode)
(keymap-global-set "C-c a" #'org-agenda)
(keymap-global-set "C-c c" #'org-capture)
(if (file-directory-p "~/org/agenda")
(setq org-agenda-files (directory-files-recursively "~/org/agenda/" "\\.org$")))

(straight-use-package 'org-roam)
(setq org-roam-directory "~/org/roam")
(keymap-global-set "C-c n l" 'org-roam-buffer-toggle)
(keymap-global-set "C-c n f" 'org-roam-node-find)
(keymap-global-set "C-c n g" 'org-roam-graph)
(keymap-global-set "C-c n i" 'org-roam-node-insert)
(keymap-global-set "C-c n c" 'org-roam-capture)
;; Dailies
(keymap-global-set "C-c n j" 'org-roam-dailies-capture-today)

(provide 'init-org)
;;; init-org.el ends here
