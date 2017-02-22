(use-package flycheck
  :ensure t
  :config
  (setq flycheck-highlighting-mode 'symbols)
  (setq flycheck-indication-mode 'left-fringe)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

  :init
  (global-flycheck-mode))
