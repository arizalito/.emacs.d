;;; init-rime.el

;; rime in emacs
(use-package rime
  :config
  (setq default-input-method "rime"
	rime-title "R"
	rime-translate-keybindings '("C-`")
	rime-show-candidate 'posframe)
  ;; kill rime before exiting emacs to avoid crash
  (add-hook 'kill-emacs-hook
	    (lambda ()
	      (if (fboundp 'rime-lib-finalize) (rime-lib-finalize)))))

(provide 'init-rime)
;;; init-rime.el ends here
