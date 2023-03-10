;; This buffer is for textthat is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(setq inhibit-startup-message t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(defvar my-term-shell "/bin/zsh")
(defadvice ansi-term (before force-zsh)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)
(defalias 'yes-or-no-p 'y-or-n-p)
(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(setq make-backup-files nil)
(setq auto-save-default nil)
(global-hl-line-mode t)
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(menu-bar-mode -1)


;; Auto completion
(use-package auto-complete
:ensure t
:init
(progn
(ac-config-default)
(global-auto-complete-mode t)))



;; snippets and snippet expansion
(use-package yasnippet
:ensure t
:init
(yas-global-mode 1))


;; tags for code navigation
(use-package ggtags
:ensure t
:config
(add-hook 'c-mode-common-hook
(lambda ()
(when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
(ggtags-mode 1))))
)

;; flycheck
(use-package flycheck
:ensure t
:init
(global-flycheck-mode t))



(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'catppuccin t)
(load-theme 'zenburn t)

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ggtags yasnippet flycheck auto-complete org-bullets which-key which\.key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
