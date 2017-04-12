;; Set certain global settings

(package-initialize)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq user-full-name "Michael Aldridge")
(setq user-mail-address "aldridge.mac@gmail.com")

;; Set global startup settings
(setf inhibit-splash-screen t ;; Get rid of the splash screen
      inhibit-startup-message t ;; Don't load the annoying startup message
      initial-major-mode #'fundamental-mode ;; Probably going to do basic text first
      initial-scratch-message nil ;; No prefilled scratch message
      )


(show-paren-mode t)

;; Load package-config.el
(load (expand-file-name "package-config.el" user-emacs-directory))
;; Load all elisp files inside config/
(defun load-directory (directory)
  "Recursively load all '.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t)
             (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil)
             (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))
(load-directory "~/.emacs.d/pkg-conf")
