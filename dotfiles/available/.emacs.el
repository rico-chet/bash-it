(eval-when-compile
  (require 'use-package))

(use-package evil
  :config
  (evil-mode t))

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package editorconfig
  :config
  (editorconfig-mode 1))

;; don't pollute directories
(setq auto-save-default nil)
(setq make-backup-files nil)
