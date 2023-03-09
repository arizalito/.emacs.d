;;; early-init.el

;; optimize gc
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook (lambda ()
				(setq gc-cons-threshold (* 16 1024 1024))))

;; show messages when collecting garbage
(setq garbage-collection-messages t)

;; prevent package.el loading packages prior to their init-file loading.
(setq package-enable-at-startup nil)

;; disable backup
(setq backup-inhibited t)
;; disable auto save
(setq auto-save-default nil)

;; disable the startup screen
(setq inhibit-startup-screen t)

;; ui settings
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(menu-bar-mode -1)
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; globally column mode
(setq column-number-mode t)

;; window size and features
(setq-default
 window-resize-pixelwise t
 frame-resize-pixelwise t)

;; make C-z do nothing
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

(provide 'early-init)
;;; early-init.el ends here
