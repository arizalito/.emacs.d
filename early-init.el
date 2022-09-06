;;; early-init.el

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
  (scroll-bar-mode nil))

;; window size and features
(setq-default
 window-resize-pixelwise t
 frame-resize-pixelwise t)

(provide 'early-init)
;;; early-init.el ends here
