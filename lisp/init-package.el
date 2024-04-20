;;; init-package.el

;; hide minor-modes in modeline
(leaf diminish)

;; display available keybings in popup
(leaf which-key
  :diminish t
  :config
  (which-key-mode))

;; orderless
(leaf orderless
  :init
  (setq completion-styles '(orderless basic)
	completion-category-overrides '((file (styles partial-completion)))))

;; vertico, minibuffer completion tool
(leaf vertico
  :init (vertico-mode))

(leaf vertico-directory
  :after vertico
  :straight nil
  :bind (:vertico-map
	 :package vertico
              ("RET" . vertico-directory-enter)
              ("M-DEL" . vertico-directory-delete-word)))

;; buffer completion tool
(leaf corfu
  :setq
  (corfu-auto . t)
  :init
  (global-corfu-mode))

;; cape, completion at point extensions for corfu
(leaf cape
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file))

;; eglot, a light lsp client
(leaf eglot
  :hook (LaTeX-mode-hook . eglot-ensure)
  :hook (prog-mode-hook . (lambda ()
			    (unless (eq major-mode 'lisp-interaction-mode)
			      (eglot-ensure)))))

;; git tool
(leaf magit)

;; yasnippet, a template system for emacs
(leaf yasnippet
  :diminish yas-minor-mode
  :hook
  (prog-mode-hook . yas-minor-mode)
  (yas-keymap-disable-hook . (lambda ()
			       (and (frame-live-p corfu--frame)
				    (frame-visible-p corfu--frame)))))

;; add marginalia to the minibuffer completions
(leaf marginalia
  :after vertico
  :init (marginalia-mode))

;; epub reader
(leaf nov
  :mode ("\\.epub\\'")
  :config
  (setq nov-text-width t)
  (add-hook 'nov-mode-hook
	    #'(lambda nil
		(text-scale-set 1)
		(visual-line-mode)))
  :bind
  (:nov-mode-map
   ("n" . next-line)
   ("p" . previous-line)))

;; consult
(leaf consult
  :bind
  (("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
   ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
   ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
   ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
   ("C-x t b" . consult-buffer-other-tab)    ;; orig. switch-to-buffer-other-tab
   ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
   ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
   ("M-y" . consult-yank-pop)                ;; orig. yank-pop
   ("M-g g" . consult-goto-line)             ;; orig. goto-line
   ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
   ("M-g i" . consult-imenu)
   ("M-g I" . consult-imenu-multi)
   ("M-s l" . consult-line)
   ("M-s L" . consult-line-multi)))

;; embark
(leaf embark
  :bind ("C-." . 'embark-act))

(leaf embark-consult
  :after embark
  :require t)

;; advanced ctags frontend
(leaf citre)

;; fold code block
(leaf hs-minor-mode
  :straight nil
  :hook ((prog-mode-hook . hs-minor-mode))
  :diminish t)

(leaf eldoc
  :straight nil
  :diminish t)

(leaf tab-bar
  :straight nil
  :defer-config (setq tab-bar-select-tab-modifiers '(control)))

;; simple templates for emacs
(leaf tempel
  :bind
  (("M-+" . 'tempel-complete)
   ("M-*" . 'tempel-insert)))

(leaf tempel-collection)

;; markdown
(leaf markdown-mode)

(leaf yaml-mode)

;; delete the selected region when yanking
(leaf delsel
  :straight nil
  :hook (after-init-hook . delete-selection-mode))

(leaf haskell-mode)

(provide 'init-package)
;;; init-package.el ends here
