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
  (if (fboundp 'editorconfig-mode) (editorconfig-mode 1)))

(use-package highlight-indentation
  :config
  (add-hook 'after-change-major-mode-hook 'highlight-indentation-mode 1)
)

(use-package fill-column-indicator
  :config
  (add-hook 'after-change-major-mode-hook 'fci-mode 1)
)

(use-package ag
  :config
  (setq ag-highlight-search t)
  (add-hook 'after-change-major-mode-hook 'next-error-follow-minor-mode 1)
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

;; flycheck
(use-package flycheck
  :config
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
  (setq flycheck-checkers (delq 'html-tidy flycheck-checkers))
  (setq flycheck-standard-error-navigation nil)
  (global-flycheck-mode t))

;; hide the menu bar to save space
(if (not (eq window-system 'x))
  (menu-bar-mode -1))
