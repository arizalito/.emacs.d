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
;;(require 'eglot)
(add-hook 'prog-mode-hook 'eglot-ensure)
;;(add-to-list 'eglot-server-programs '((c++-mode c-mode).("clangd" "--background-index" "--header-insertion=iwyu")))

;; git tool
(straight-use-package 'magit)

;; vterm, best terminal emulator in emacs
(straight-use-package 'vterm)

;; yasnippet, a template system for emacs
(straight-use-package 'yasnippet)
(add-hook 'prog-mode-hook 'yas-minor-mode)

;; dired-sidebar, minimal file explorer in tree style
(straight-use-package 'dired-sidebar)

;; add marginalia to the minibuffer completions
(straight-use-package 'marginalia)
(marginalia-mode)

;; epub reader
(straight-use-package 'nov)
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(add-hook 'nov-mode-hook (lambda () (text-scale-set 2)))

;; consult
(straight-use-package 'consult)

;; embark
(straight-use-package 'embark)

;; advanced ctags frontend
(straight-use-package 'citre)

;; pdf-tools
(straight-use-package 'pdf-tools)
(pdf-loader-install)

;; benchmark tool
(straight-use-package 'esup)

(provide 'init-package)
;;; init-package.el ends here

