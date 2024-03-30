;;; init-pdf.el

;; pdf-tools
(leaf pdf-tools
  :init (pdf-loader-install))

(leaf saveplace-pdf-view
  :after pdf-tools
  :require t
  :hook (pdf-view-mode-hook . save-place-mode))

(provide 'init-pdf)
;;; init-pdf.el ends here
