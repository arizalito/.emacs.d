;;; org-mode

(use-package org
  :bind
  ("C-c a" . #'org-agenda)
  ("C-c c" . #'org-capture)
  :init
  (if (file-directory-p "~/org/agenda")
      (setq org-agenda-files
	    (directory-files-recursively "~/org/agenda/" "\\.org$"))))

(use-package org-roam
  :init
  (setq org-roam-directory "~/org/roam")
  :bind
  ("C-c n l" . #'org-roam-buffer-toggle)
  ("C-c n f" . #'org-roam-node-find)
  ("C-c n g" . #'org-roam-graph)
  ("C-c n i" . #'org-roam-node-insert)
  ("C-c n c" . #'org-roam-capture)
  ;; Dailies
  ("C-c n j" . #'org-roam-dailies-capture-today))

(use-package ox-hugo
  :demand t
  :after ox)

(provide 'init-org)
;;; init-org.el ends here
