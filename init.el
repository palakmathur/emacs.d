;;; init.el --- -*- lexical-binding: t -*-,.
(add-to-list 'load-path "~/.emacs.d/customizations")
(load "setup-proxy.el")

(org-babel-load-file "~/.emacs.d/rambunctious.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-sidebar-tree-side (quote left) t)
 '(package-selected-packages (quote (org-plus-contrib use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
