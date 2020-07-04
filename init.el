;;; init.el --- -*- lexical-binding: t -*-,.
(add-to-list 'load-path "~/.emacs.d/customizations")
(load "setup-proxy.el")

(org-babel-load-file "~/.emacs.d/systemhalted.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-tags-on-save t)
 '(org-sidebar-tree-side (quote left) t)
 '(package-selected-packages
   (quote
    (spacemacs-theme yasnippet-snippets xclip use-package toc-org slack org-sidebar org-plus-contrib magit lsp-ui lsp-java idle-highlight flycheck dap-mode counsel-projectile company-lsp ample-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
