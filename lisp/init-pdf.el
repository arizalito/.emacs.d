;;; init-pdf.el

;; pdf-tools
(use-package pdf-tools
  :init (pdf-loader-install))

(use-package saveplace-pdf-view
  :after pdf-tools
  :hook (pdf-view-mode . save-place-mode))

(provide 'init-pdf)
;;; init-pdf.el ends here
