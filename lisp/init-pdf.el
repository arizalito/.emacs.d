;;; init-pdf.el -*- lexical-binding: t -*-

;; pdf-tools
(leaf pdf-tools
  :straight `(pdf-tools
	      :host github
	      :repo "aikrahguzar/pdf-tools")
  :init (pdf-loader-install)
  :hook
  (pdf-view-mode-hook .  pdf-view-roll-minor-mode))

(leaf saveplace-pdf-view
  :after pdf-tools
  :require t
  :hook (pdf-view-mode-hook . save-place-mode))

(provide 'init-pdf)
;;; init-pdf.el ends here
