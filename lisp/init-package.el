;;; init-package.el

;; hide minor-modes in modeline
(use-package diminish)

;; display available keybings in popup
(use-package which-key
  :diminish which-key-mode
  :defer 2
  :config
  (which-key-mode))

;; orderless
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
	completion-category-overrides '((file (styles partial-completion)))))

;; vertico, minibuffer completion tool
(use-package vertico
  :init (vertico-mode))

(use-package vertico-directory
  :after vertico
  :straight nil
  :bind ( :map vertico-map
	  ("RET" . vertico-directory-enter)
          ("DEL" . vertico-directory-delete-char)
          ("M-DEL" . vertico-directory-delete-word)))

;; buffer completion tool
(use-package corfu
  :custom
  (corfu-auto t)
  :init
  (global-corfu-mode))

;; cape, completion at point extensions for corfu
(use-package cape
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file))

;; eglot, a light lsp client
(use-package eglot
  :hook (LaTeX-mode . eglot-ensure)
  :hook (prog-mode . (lambda ()
		       (unless (eq major-mode 'lisp-interaction-mode)
			 (eglot-ensure)))))

;; git tool
(use-package magit)

;; yasnippet, a template system for emacs
(use-package yasnippet
  :hook
  (prog-mode . yas-minor-mode)
  (yas-keymap-disable . (lambda ()
			  (and (frame-live-p corfu--frame)
			       (frame-visible-p corfu--frame)))))

;; add marginalia to the minibuffer completions
(use-package marginalia
  :after vertico
  :init (marginalia-mode))

;; epub reader
(use-package nov
  :mode ("\\.epub\\'" . nov-mode)
  :config
  (setq nov-text-width t)
  :hook
  (nov-mode . (lambda ()
		(text-scale-set 1)
		(visual-line-mode)))
  :bind ( :map nov-mode-map
	  ("n" . 'next-line)
	  ("p" . 'previous-line)))

;; consult
(use-package consult
  :bind (("M-g g" . 'consult-goto-line)
	 ("M-g M-g" . 'consult-goto-line)
	 ("M-s l" . 'consult-line)
	 ("C-x b" . 'consult-buffer)))

;; embark
(use-package embark
  :bind ("C-." . 'embark-act))

(use-package embark-consult
  :after (consult embark))

;; advanced ctags frontend
(use-package citre)

;; fold code block
(use-package hideshow
  :straight nil
  :hook
  (prog-mode . hs-minor-mode)
  :diminish hs-minor-mode)

(use-package eldoc
  :straight nil
  :diminish eldoc-mode)

(use-package tab-bar
  :straight nil
  :config
  (setq tab-bar-select-tab-modifiers '(control)))

;; simple templates for emacs
(use-package tempel
  :bind
  (("M-+" . 'tempel-complete)
   ("M-*" . 'tempel-insert)))
(use-package tempel-collection
  :after tempel)

;; markdown
(use-package markdown-mode)

;; latex
(use-package auctex)

;; cdlatex, a fast input methods in LaTeX and org-mode
(use-package cdlatex
  :hook
  (LaTeX-mode . cdlatex-mode)
  (org-mode . org-cdlatex-mode))

(use-package yaml-mode)

(use-package delsel
  :straight nil
  :hook (after-init . delete-selection-mode))

(provide 'init-package)
;;; init-package.el ends here
