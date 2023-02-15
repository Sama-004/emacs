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
 '(custom-enabled-themes '(wheatgrass))
 '(package-selected-packages '(org-bullets which-key which\.key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
