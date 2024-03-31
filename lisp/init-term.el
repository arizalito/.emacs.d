;;; init-shell.el

;; vterm, best terminal emulator in emacs
(leaf vterm
  :hook
  (vterm-mode-hook .
		   (lambda ()
		     (set-face-attribute 'vterm-color-black nil
					 :foreground "#000000"
					 :background "#555555"))))

(leaf vterm-toggle
  :bind ("C-`" . 'vterm-toggle)
  :config
  (setq vterm-toggle-hide-method 'reset-window-configration))

(leaf multi-vterm)

(provide 'init-term)
;;; init-shell.el ends here
