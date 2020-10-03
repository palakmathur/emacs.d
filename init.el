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
 '(package-selected-packages
   '(doom-modeline all-the-icons htmlize yasnippet-snippets xclip which-key use-package treemacs toc-org spacemacs-theme spaceline smex slime projectile org-sidebar org-plus-contrib org-bullets org-books nova-theme nov markdown-mode magit leuven-theme ivy irony-eldoc ido-vertical-mode ido-completing-read+ idle-highlight git-auto-commit-mode flycheck-clang-analyzer flx-ido ereader define-word company-irony company-c-headers ample-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
