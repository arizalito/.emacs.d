;;; init-package.el

;; display available keybings in popup
(straight-use-package 'which-key)
(which-key-mode)

;; orderless
(straight-use-package 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (styles basic partial-completion))))

;; vertico, minibuffer completion tool
(straight-use-package 'vertico)
(vertico-mode)

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

;; vterm, best terminal emulator in emacs
(straight-use-package 'vterm)

;; yasnippet, a template system for emacs
(straight-use-package 'yasnippet)
(yas-global-mode 1)

(provide 'init-package)
;;; init-package.el ends here
