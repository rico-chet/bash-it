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

(use-package highlight-indentation
  :config
  (add-hook 'after-change-major-mode-hook 'highlight-indentation-mode 1)
)

;; don't pollute directories
(setq auto-save-default nil)
(setq make-backup-files nil)

;; check spelling while typing
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; check spelling upon opening a file
;; but not for code to improve static analysis result display
(add-hook 'text-mode-hook 'flyspell-buffer)
