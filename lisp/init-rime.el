;;; init-rime.el -*- lexical-binding: t -*-

;; rime in emacs
(leaf rime
  :setq ((default-input-method . "rime")
	 (rime-title . "R")
	 (rime-translate-keybindings quote
				     ("C-`"))
	 (rime-show-candidate quote posframe))
  :defer-config
  (add-hook 'kill-emacs-hook
	    (lambda nil
	      (if (fboundp 'rime-lib-finalize)
		  (rime-lib-finalize)))))

(provide 'init-rime)
;;; init-rime.el ends here
