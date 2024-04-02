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
	:repo "akib/emacs-eat")
  :setq
  (eat-term-name . "xterm-256color"))

(provide 'init-term)
;;; init-shell.el ends here
