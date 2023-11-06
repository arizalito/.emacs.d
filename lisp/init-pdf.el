;;; init-pdf.el

;; pdf-tools
(straight-use-package 'pdf-tools)
(setq pdf-view-continuous nil)
(pdf-loader-install)

(straight-use-package 'saveplace-pdf-view)
(with-eval-after-load 'pdf-tools
  (require 'saveplace-pdf-view))

(add-hook 'pdf-view-mode-hook 'save-place-local-mode)

(provide 'init-pdf)
;;; init-pdf.el ends here
