;;; init-shell.el

;; vterm, best terminal emulator in emacs
(straight-use-package 'vterm)

(add-hook 'vterm-mode-hook
	  (lambda ()
	    (set-face-attribute 'vterm-color-black nil
				:foreground "#000000"
				:background "#555555")))

(straight-use-package 'vterm-toggle)
(keymap-global-set "C-`" 'vterm-toggle)
(setq vterm-toggle-hide-method 'reset-window-configration)

(straight-use-package 'multi-vterm)

(provide 'init-shell)
;;; init-shell.el ends here
