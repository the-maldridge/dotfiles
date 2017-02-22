;; Spaces vs Tabs
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

;; Other
(setq require-final-newline t)
(setq show-trailing-whitespace t)

;; Fill column and indicator
(use-package fill-column-indicator
  :ensure t
  :config
  (setq fci-rule-column 80)
  (setq fci-rule-color "darkblue")
  )

(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda ()
    (if (and
         (not (string-match "^\*.*\*$" (buffer-name)))
         (not (eq major-mode 'dired-mode)))
        (fci-mode 1))))
(global-fci-mode 1)

(add-hook 'after-change-major-mode-hook 'global-fci-mode)
