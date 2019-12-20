;;; 
;; LATEX
;;;
(getenv "PATH")
 (setenv "PATH"
(concat
 "/Library/TeX/texbin" ":"
 (getenv "PATH")))

;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
              '("melpa" . "http://melpa.org") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(magit . "melpa-stable") t)
;;(add-to-list 'package-pinned-packages '(helm-projectile . "melpa-stable") t)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)
(setq package-enable-at-startup nil)
(require 'use-package)
(setq use-package-always-ensure t)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-context-switch-command nil)
(defvar ido-cur-list nil)
(defvar predicate nil)
(defvar inherit-input-method nil)

;; (defvar my-packages
;;   '( color-theme-sanityinc-tomorrow  company-quickhelp crux csharp-mode dockerfile-mode edn enh-ruby-mode  flycheck  git-gutter haml-mode haskell-mode helm-ag helm-descbinds helm-git-grep helm-ls-git helm-projectile helm helm-core hydra inflections  git-commit magit-popup markdown-mode markup-faces multiple-cursors noflet paredit peg php-mode popup pos-tip projectile pkg-info epl queue  seq  smex spinner tagedit s thesaurus typescript typescript-mode use-package diminish bind-key  with-editor dash async yaml-mode yasnippet))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(
    ;;theme that I will be using
    color-theme-sanityinc-tomorrow

    helm
    w3m
    web-mode


    ack-and-a-half

    adjust-parens

    ;;adhoc-mode

    ag

    aggressive-indent

    clj-refactor
    
    ;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/better-defaults.el line 47 for a description
    ;; of ido
    ido-ubiquitous

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; On OS X, an Emacs instance started from the graphical user
    ;; interface will have a different environment than a shell in a
    ;; terminal window, because OS X does not run a shell during the
    ;; login. Obviously this will lead to unexpected results when
    ;; calling external utilities like make from Emacs.
    ;; This library works around this problem by copying important
    ;; environment variables from the user's shell.
    ;; https://github.com/purcell/exec-path-from-shell
    exec-path-from-shell

    ;; project navigation
    projectile

    helm-projectile


    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit

    yaml-mode
    coffee-mode
    scss-mode

    ;;haskell
    haskell-mode
    company
    company-cabal
    company-ghci
    ghci-completion
    shakespeare-mode
    company-quickhelp

    ack-and-a-half
    ag
    enh-ruby-mode

    typescript-mode
    ;;tide
    ;;ng2-mode
    ivy
))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")

;;load neotree
(add-to-list 'load-path "~/.emacs.d/vendor/neotree-20181121.2026")
(require 'neotree)
(setq-default neo-show-hidden-files t) ;;show hidden files in neotree
(setq neo-window-fixed-size nil) ;;make neotree resizable

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Email
(load "setup-vm.el")
(load "setup-email.el")

;; helm
(load "setup-helm.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-css.el")
(load "setup-yaml.el")
(load "setup-org.el")
(load "setup-prolog.el")
(load "setup-ruby.el")
(load "setup-haskell.el")
(load "setup-c.el")
(load "setup-projectile")

(add-to-list 'load-path "~/.emacs.d/vendor/function-args")
(load "setup-function-args.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#c5c8c6" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#373b41"))
 '(coffee-tab-width 2)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#373b41")
 '(package-selected-packages
   (quote
    (sr-speedbar projectile helm-mode-manager helm-mode ac-emmet helm-emmet tide typescript typescript-mode clojure-mode scss-mode yaml-mode web-mode use-package thesaurus tagedit smex rainbow-delimiters php-mode noflet markdown-mode magit ido-ubiquitous helm-projectile helm-ls-git helm-git-grep helm-descbinds helm-ag helm-gtags helm haskell-mode haml-mode git-gutter exec-path-from-shell enh-ruby-mode dockerfile-mode csharp-mode crux company color-theme-sanityinc-tomorrow coffee-mode clj-refactor aggressive-indent ag adoc-mode adjust-parens ack-and-a-half zygospore yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "#333" :background "#bad063" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
