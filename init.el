;;; init.el --- -*- lexical-binding: t -*-,.
(add-to-list 'load-path "~/.emacs.d/customizations")
(load "setup-proxy.el")

(org-babel-load-file "~/.emacs.d/systemhalted.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-mode xclip idle-highlight treemacs use-package toc-org projectile org-sidebar org-plus-contrib nova-theme nov magit ivy ereader define-word ample-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
