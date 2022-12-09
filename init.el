;;; My Emacs Configuration
;;; init.el

;;; straight.el: next-generation, purely functional package manager for the Emacs hacker.
(setq straight-check-for-modifications 'live-with-find)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; make lisp directory work
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (locate-user-emacs-file "custom.el"))

(require 'init-package)
(require 'init-rime)
(require 'init-org)
(require 'init-llvm)
(require 'init-tablegen)
(require 'init-shell)

;;; init.el ends here
