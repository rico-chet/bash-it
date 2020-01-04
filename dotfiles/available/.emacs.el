(eval-when-compile
  (require 'use-package))

(use-package evil
  :config
  (evil-mode t))

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))
