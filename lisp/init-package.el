;;; init-package.el

;; display available keybings in popup
(straight-use-package 'which-key)
(which-key-mode)

;; orderless
(straight-use-package 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (styles basic partial-completion))))

;; vertico, minibuffer completion tool
(straight-use-package
 '(vertico :includes vertico-directory
	   :files (:defaults "extensions/vertico-directory.el")))
(vertico-mode)
(define-key vertico-map (kbd "<DEL>") #'vertico-directory-delete-word)
(define-key vertico-map (kbd "M-<DEL>") #'vertico-directory-delete-char)

;; buffer completion tool
(straight-use-package 'corfu)
(global-corfu-mode)
;; Enable auto completion and configure quitting
(setq corfu-auto t
      corfu-quit-no-match 'separator) ;; or t

;; cape, completion at point extensions for corfu
(straight-use-package 'cape)
;; Add `completion-at-point-functions', used by `completion-at-point'.
(add-to-list 'completion-at-point-functions #'cape-dabbrev)
(add-to-list 'completion-at-point-functions #'cape-file)

;; eglot, a light lsp client
(straight-use-package 'eglot)
(add-hook 'prog-mode-hook 'eglot-ensure)

;; git tool
(straight-use-package 'magit)

;; yasnippet, a template system for emacs
(straight-use-package 'yasnippet)
(add-hook 'prog-mode-hook 'yas-minor-mode)

;; add marginalia to the minibuffer completions
(straight-use-package 'marginalia)
(marginalia-mode)

;; epub reader
(straight-use-package 'nov)
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(add-hook 'nov-mode-hook (lambda () (text-scale-set 2)))

;; consult
(straight-use-package 'consult)
;; M-s bindings (search-map)
(keymap-global-set "M-g g" 'consult-goto-line)
(keymap-global-set "M-g M-g" 'consult-goto-line)
(keymap-global-set "M-s l" 'consult-line)
(keymap-global-set "C-x b" 'consult-buffer)

;; embark
(straight-use-package 'embark)

;; advanced ctags frontend
(straight-use-package 'citre)

;; pdf-tools
(straight-use-package 'pdf-tools)
(pdf-loader-install)

;; benchmark tool
(straight-use-package 'esup)

;; diminish, hide minor-modes in modeline
(straight-use-package 'diminish)
(diminish 'which-key-mode)

(provide 'init-package)
;;; init-package.el ends here
