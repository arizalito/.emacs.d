;;; init-package.el

;; diminish, hide minor-modes in modeline
(straight-use-package 'diminish)

;; display available keybings in popup
(straight-use-package 'which-key)
(which-key-mode)
(diminish 'which-key-mode)

;; orderless
(straight-use-package 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (styles basic partial-completion))))

;; vertico, minibuffer completion tool
(straight-use-package
 '(vertico :includes vertico-directory
	   :files (:defaults "extensions/vertico-directory.el")))
(vertico-mode)
(keymap-set vertico-map "M-DEL" #'vertico-directory-delete-word)

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
(add-hook 'yas-keymap-disable-hook (lambda () (and (frame-live-p corfu--frame) (frame-visible-p corfu--frame))))

;; add marginalia to the minibuffer completions
(straight-use-package 'marginalia)
(marginalia-mode)

;; epub reader
(straight-use-package 'nov)
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(setq nov-text-width t)
(add-hook 'nov-mode-hook (lambda ()
			   (text-scale-set 2)
			   (visual-line-mode)
			   (keymap-unset nov-mode-map "n")
			   (keymap-set nov-mode-map "n" 'next-line)
			   (keymap-unset nov-mode-map "p")
			   (keymap-set nov-mode-map "p" 'previous-line)
			   ))

;; consult
(straight-use-package 'consult)
;; M-s bindings (search-map)
(keymap-global-set "M-g g" 'consult-goto-line)
(keymap-global-set "M-g M-g" 'consult-goto-line)
(keymap-global-set "M-s l" 'consult-line)
(keymap-global-set "C-x b" 'consult-buffer)

;; embark
(straight-use-package 'embark)
(keymap-global-set "C-." 'embark-act)
(straight-use-package 'embark-consult)

;; advanced ctags frontend
(straight-use-package 'citre)

;; pdf-tools
(straight-use-package
 '(pdf-tools
   :host github
   :branch "pdf-roll"
   :repo "dalanicolai/pdf-tools"
   :files ("lisp/*.el"
           "README"
           ("build" "Makefile")
           ("build" "server"))))
(pdf-loader-install)

(straight-use-package
 '(image-roll
   :host github
   :repo "dalanicolai/image-roll.el"))
(add-hook 'pdf-view-mode-hook 'pdf-view-roll-minor-mode)

;; fold code block
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'hs-minor-mode-hook
	  (lambda ()
	    (diminish 'hs-minor-mode)))

;; simple templates for emacs
(straight-use-package 'tempel)
(keymap-global-set "M-+" 'tempel-complete)
(keymap-global-set "M-*" 'tempel-insert)
(straight-use-package 'tempel-collection)

;; markdown
(straight-use-package 'markdown-mode)

;; latex
(straight-use-package 'auctex)

;; switch tab with Mod+num in tab-bar-mode
(setq tab-bar-select-tab-modifiers '(control))

(provide 'init-package)
;;; init-package.el ends here
