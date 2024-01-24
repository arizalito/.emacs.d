;;; init-shell.el

;; vterm, best terminal emulator in emacs
(use-package vterm
  :hook
  (vterm-mode-hook .
		   (lambda ()
		     (set-face-attribute 'vterm-color-black nil
					 :foreground "#000000"
					 :background "#555555"))))

(use-package vterm-toggle
  :bind ("C-`" . 'vterm-toggle)
  :config
  (setq vterm-toggle-hide-method 'reset-window-configration))

(use-package multi-vterm)

(provide 'init-shell)
;;; init-shell.el ends here
