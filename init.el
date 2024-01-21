;;; My Emacs Configuration
;;; init.el

;;; straight.el: next-generation, purely functional package manager for the Emacs hacker.
(setq straight-repository-branch "develop")
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

(straight-use-package 'leaf)
(straight-use-package 'leaf-keywords)
(leaf-keywords-init)
(setq leaf-defaults '(:straight t))

;; make lisp directory work
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (locate-user-emacs-file "custom.el"))

(require 'init-package)
(require 'init-pdf)
(require 'init-rime)
(require 'init-org)
(require 'init-shell)

;; put 3rd party code to site-lisp
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))
(mapc (lambda (name)
        (require (intern (file-name-sans-extension name))))
      (directory-files "~/.emacs.d/site-lisp" nil "\\.el$"))

;;; init.el ends here
