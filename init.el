;;; init.el --- -*- lexical-binding: t -*-,.

;; Customizations
(add-to-list 'load-path "~/.emacs.d/customizations")
;; -Customizations
(load "setup-proxy.el")


;; OrgBabel
(org-babel-load-file "~/.emacs.d/systemhalted.org")
;; -OrgBabel

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gac-automatically-push-p nil)
 '(package-selected-packages
   '(slime-autoloads slime git-auto-commit-mode org-books org markdown-mode spaceline spaceline-config smex ido-completing-read+ ido-vertical-mode flx-ido lsp-mode xclip idle-highlight treemacs use-package toc-org projectile org-sidebar org-plus-contrib nova-theme nov magit ivy ereader define-word ample-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
