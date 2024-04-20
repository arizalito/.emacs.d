;;; init-shell.el

;; vterm, best terminal emulator in emacs
(leaf vterm)

(leaf vterm-toggle
  :bind ("C-`" . 'vterm-toggle)
  :config
  (setq vterm-toggle-hide-method 'reset-window-configration))

(leaf multi-vterm)

;; emulate a terminal, written by elisp
(leaf eat
  :straight
  '(eat :type git
	:host codeberg
	:repo "akib/emacs-eat"
	:files ("*.el" ("term" "term/*.el") "*.texi"
		"*.ti" ("terminfo/e" "terminfo/e/*")
		("terminfo/65" "terminfo/65/*")
		("integration" "integration/*")
		(:exclude ".dir-locals.el" "*-tests.el")))
  :setq
  (eat-term-name . "xterm-256color")
  :hook
  (eat-mode-hook . (lambda () (setq-local  scroll-conservatively 101))))

(provide 'init-term)
;;; init-shell.el ends here
