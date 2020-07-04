;;; init.el --- -*- lexical-binding: t -*-,.
(add-to-list 'load-path "~/.emacs.d/customizations")
(load "setup-proxy.el")

;; setup package repositories
(require 'package)
(setq-default
   load-prefer-newer t
   package-enable-at-startup nil)
(add-to-list 'package-archives
             '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
              '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; install and configure use-package
 (unless (package-installed-p 'use-package)
       (package-refresh-contents)
       (package-install 'use-package t))
 (setq-default use-package-always-defer t
	       use-package-always-ensure t)

;; setup ido: Generic completion frontend that's just awesome! Let's install and enable it.
 (use-package ivy
   :demand t)

 ;; magit - magical interface for git
 (use-package magit
   :commands (magit-status magit-blame magit-log-buffer-file magit-log-all))

  ;; org-mode
      (use-package org
         :ensure org-plus-contrib
         :pin org
         :defer t
         :config (setq org-log-done 'time
		       org-log-done 'note
		       org-agenda-files (list "~/org/inbox.org"
                             "~/org/gtd.org" 
                             "~/org/tickler.org"
			     "~/org/references.org")
				org-capture-templates '(("t" "Todo [inbox]" entry
							                       (file+headline "~/org/inbox.org" "Tasks")
									       "* TODO %i%?")
							                 ("T" "Tickler" entry
									       (file+headline "~/org/tickler.org" "Tickler")
									       "* %i%? \n %U"))
				org-todo-keywords '((sequence "TODO(t)" "IN-PROGRESS" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)" "HOLD(h)")))
         :init
             (define-key global-map (kbd "C-c l") 'org-store-link)
             (define-key global-map (kbd "C-c a") 'org-agenda)
             (define-key global-map (kbd "C-c c") 'org-capture)
         )

;; (setq  org-refile-targets '(("~/org/gtd.org" :maxlevel . 3)
;;                                                        ("~/org/someday.org" :maxlevel . 1)
;;                                                        ("~/org/tickler.org" :maxlevel . 2)))

(setq org-refile-targets '((org-agenda-files :maxlevel . 4)
					                ("~/org/someday.org" :maxlevel . 1)))


;; Projectile is a quick and easy project management package that "just works".
;; We're going to install it and make sure it's loaded immediately.
      (use-package projectile
          :ensure t
          :bind-keymap
          ("C-c p" . projectile-command-map)
          :config
          (projectile-mode +1))

;;Toc-org
;;Let's install and load the =toc-org= package after org mode is loaded. This is the
;;package that automatically generates an up to date table of contents for us.
    (use-package toc-org
      :after org
      :init (add-hook 'org-mode-hook #'toc-org-enable))

;;Org-sidebar
;; When I write, I need a map of the document or the table of content on the side. Org-sidebar helps with that:
    (use-package org-sidebar
        :custom (org-sidebar-tree-side 'left))

;; UI Customizations

;; Load Theme
(use-package ample-theme
  :init (progn (load-theme 'ample t t)
               (load-theme 'ample-flat t t)
               (load-theme 'ample-light t t)
               (enable-theme 'ample-light))
  :defer t
  :ensure t)

;; Disable startup/splash screen
(setq inhibit-startup-screen t)

;; Disable unnecessary interfaces
;;(menu-bar-mode -1)
(menu-bar-mode -1)
(unless (and (display-graphic-p) (eq system-type 'darwin))
  (push '(menu-bar-lines . 0) default-frame-alist))
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Setup initial major mode to Org-mode
(setq-default initial-major-mode (quote org-mode))

;; Remove scratch message file
(setq-default initial-scratch-message nil)

;; When you press C-x, for example, and hesitate with a next character, C-x will be displayed in the echo-area after some time.
;; But I don’t see any reason why you should wait for it.
(setq echo-keystrokes 0.001)

;; Simply Yes/No Prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; But make it hard to accidentally exit
(setq-default confirm-kill-emacs (quote y-or-n-p))

;; Shut up the bell
(setq ring-bell-function 'ignore)

;; Set font
(set-face-attribute 'default nil :family "DejaVu Sans Mono")

(load "setup-speedtest.el")
(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ample-theme dracula-theme yasnippet-snippets xclip use-package toc-org slack org-sidebar org-plus-contrib magit lsp-ui lsp-java idle-highlight flycheck dap-mode counsel-projectile company-lsp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
