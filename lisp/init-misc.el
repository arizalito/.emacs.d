(leaf emacs
  :straight nil
  :init
  (defun kill-ring-save-with-join-line (beg end &optional region)
    (interactive (list (mark) (point) 'region))
    (let ((str (if region
		   (funcall region-extract-function nil)
		 (filter-buffer-substring beg end))))
      (subst-char-in-string ?\n ?\s str t)
      (if (eq last-command 'kill-region)
	  (kill-append str (< end beg))
	(kill-new str)))
    (setq deactivate-mark t)
    nil)
  :bind
  ("M-W" . #'kill-ring-save-with-join-line))

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
  :defer-config
  (setq tab-bar-select-tab-modifiers '(control))
  (setq tab-bar-show 1))

;; delete the selected region when yanking
(leaf delsel
  :straight nil
  :hook (after-init-hook . delete-selection-mode))

(provide 'init-misc)
;;; init-misc.el ends here
