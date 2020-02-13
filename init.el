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
                       org-agenda-files '("~/org/gtd.org"
                                          "~/org/inbox.org"
                                          "~/org/tickler.org")
                       org-refile-targets '(( "~/org/gtd.org" :maxlevel . 3)
                                            ( "~/org/someday.org" :level .1)
                                            ( "~/org/tickler.org" :maxlevel .2))
                       org-capture-templates '(("t" "Todo [inbox]" entry
                                                      (file+headline "~/org/inbox.org" "Tasks")
                                                      "* TODO %i%?")
                                               ("T" "Tickler" entry
                                                      (file+headline "~/org/tickler.org" "Tickler")
                                                      "* %i%? \n %U"))
                       org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))
         :init
             (define-key global-map (kbd "C-c l") 'org-store-link)
             (define-key global-map (kbd "C-c a") 'org-agenda)
             (define-key global-map (kbd "C-c c") 'org-capture)
         )

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
;; Disable startup/splash screen
    (setq inhibit-startup-screen t)

;; Setup initial major mode to Org-mode
(setq-default initial-major-mode (quote org-mode))

;; Remove scratch message file
(setq-default initial-scratch-message nil)

;;hen you press C-x, for example, and hesitate with a next character, C-x will be displayed in the echo-area after some time.
;; But I don’t see any reason why you should wait for it.
(setq echo-keystrokes 0.001)
