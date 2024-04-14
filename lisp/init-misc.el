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

(provide 'init-misc)
