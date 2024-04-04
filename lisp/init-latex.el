;;; init-latex.el

;; latex
(leaf auctex)

;; cdlatex, a fast input methods in LaTeX and org-mode
(leaf cdlatex
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

(provide 'init-latex)
;;; init-latex.el ends here
