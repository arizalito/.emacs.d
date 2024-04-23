;;; init-latex.el

;; latex
(leaf auctex
  :hook
  (LaTeX-mode-hook . TeX-fold-mode)
  (LaTeX-mode-hook . (lambda ()
		       (setq TeX-view-program-selection
			     '((output-pdf "PDF Tools")))))
  :config
  (setq TeX-engine 'xetex))

;; cdlatex, a fast input methods in LaTeX and org-mode
(leaf cdlatex
  :diminish t
  :hook
  (LaTeX-mode-hook . cdlatex-mode)
  (org-mode-hook . org-cdlatex-mode))

(leaf math-delimiters
  :after tex
  :bind
  ((:TeX-mode-map
    ("$" . math-delimiters-insert))
   (:cdlatex-mode-map
    ("$" . nil))))

(leaf xenops
  :diminish t
  :hook
  (LaTeX-mode-hook))

(provide 'init-latex)
;;; init-latex.el ends here
