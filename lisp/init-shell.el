;;; init-shell.el

;; vterm, best terminal emulator in emacs
(straight-use-package 'vterm)

(add-hook 'vterm-mode-hook
	  (lambda ()
	    (set-face-attribute 'vterm-color-white   nil :foreground "#555555"   :background "#555555")))

(straight-use-package 'vterm-toggle)
(keymap-global-set "C-`" 'vterm-toggle)

(straight-use-package 'multi-vterm)

(provide 'init-shell)
;;; init-shell.el ends here
