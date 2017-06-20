
;; These customizations change the way emacs looks and disable/enable
;; some user interface elements. Some useful customizations are
;; commented out, and begin with the line "CUSTOMIZE". These are more
;; a matter of preference and may require some fiddling to match your
;; preferences

;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)

;; You can uncomment this to remove the graphical toolbar at the top. After
;; awhile, you won't need the toolbar.

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(if (boundp 'fringe-mode)
  (fringe-mode '(4 . 0)))
(global-git-gutter-mode +1)

;; Configure the mode line
(setq-default mode-line-format
              '((:eval (propertize " %b" 'face 'mode-line-highlight))
                " %l:%c %p %m"))

;; typography
(setq-default line-spacing nil)
(setq mac-allow-anti-aliasing t)
(global-prettify-symbols-mode t)

;; Increase size for my poor eyes
(set-face-attribute 'default nil :height 120)

;; Better scrolling
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; Color Themes
;; Read http://batsov.com/articles/2012/02/19/color-theming-in-emacs-reloaded/
;; for a great explanation of emacs color themes.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;; for a more technical explanation.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
;; (load-theme 'spacegray t)
;;(load-theme 'tomorrow-night-bright t)
(require 'color-theme-sanityinc-tomorrow)
;;(color-theme-sanityinc-tomorrow-bright)


;; powerline customizes the mode line
 (add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
 (require 'powerline)
(custom-set-faces
 '(mode-line ((t (:foreground "#333" :background "#bad063" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it
(if (or (equal system-name "DH.local")
        (equal system-name "waffles")) 
    (setq initial-frame-alist '((top . 0) (left . 0)
                                (width . 180) (height . 70)))
  (setq initial-frame-alist '((top . 0) (left . 0)
                              (width . 180) (height . 70 ))))

;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)

;; open files in existing frame
(setq ns-pop-up-frames nil)

;; ;;; Fira code
;; ;; This works when using emacs --daemon + emacsclient
;; (add-hook 'after-make-frame-functions (lambda (frame) (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")))
;; ;; This works when using emacs without server/client
;; (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")
;; ;; I haven't found one statement that makes both of the above situations work, so I use both for now

;; (defconst fira-code-font-lock-keywords-alist
;;   (mapcar (lambda (regex-char-pair)
;;             `(,(car regex-char-pair)
;;               (0 (prog1 ()
;;                    (compose-region (match-beginning 1)
;;                                    (match-end 1)
;;                                    ;; The first argument to concat is a string containing a literal tab
;;                                    ,(concat "	" (list (decode-char 'ucs (cadr regex-char-pair)))))))))
;;           '(("\\(www\\)"                   #Xe100)
;;             ("[^/]\\(\\*\\*\\)[^/]"        #Xe101)
;;             ("\\(\\*\\*\\*\\)"             #Xe102)
;;             ("\\(\\*\\*/\\)"               #Xe103)
;;             ("\\(\\*>\\)"                  #Xe104)
;;             ("[^*]\\(\\*/\\)"              #Xe105)
;;             ("\\(\\\\\\\\\\)"              #Xe106)
;;             ("\\(\\\\\\\\\\\\\\)"          #Xe107)
;;             ("\\({-\\)"                    #Xe108)
;;             ("\\(\\[\\]\\)"                #Xe109)
;;             ("\\(::\\)"                    #Xe10a)
;;             ("\\(:::\\)"                   #Xe10b)
;;             ("[^=]\\(:=\\)"                #Xe10c)
;;             ("\\(!!\\)"                    #Xe10d)
;;             ("\\(!=\\)"                    #Xe10e)
;;             ("\\(!==\\)"                   #Xe10f)
;;             ("\\(-}\\)"                    #Xe110)
;;             ("\\(--\\)"                    #Xe111)
;;             ("\\(---\\)"                   #Xe112)
;;             ("\\(-->\\)"                   #Xe113)
;;             ("[^-]\\(->\\)"                #Xe114)
;;             ("\\(->>\\)"                   #Xe115)
;;             ("\\(-<\\)"                    #Xe116)
;;             ("\\(-<<\\)"                   #Xe117)
;;             ("\\(-~\\)"                    #Xe118)
;;             ("\\(#{\\)"                    #Xe119)
;;             ("\\(#\\[\\)"                  #Xe11a)
;;             ("\\(##\\)"                    #Xe11b)
;;             ("\\(###\\)"                   #Xe11c)
;;             ("\\(####\\)"                  #Xe11d)
;;             ("\\(#(\\)"                    #Xe11e)
;;             ("\\(#\\?\\)"                  #Xe11f)
;;             ("\\(#_\\)"                    #Xe120)
;;             ("\\(#_(\\)"                   #Xe121)
;;             ("\\(\\.-\\)"                  #Xe122)
;;             ("\\(\\.=\\)"                  #Xe123)
;;             ("\\(\\.\\.\\)"                #Xe124)
;;             ("\\(\\.\\.<\\)"               #Xe125)
;;             ("\\(\\.\\.\\.\\)"             #Xe126)
;;             ("\\(\\?=\\)"                  #Xe127)
;;             ("\\(\\?\\?\\)"                #Xe128)
;;             ("\\(;;\\)"                    #Xe129)
;;             ("\\(/\\*\\)"                  #Xe12a)
;;             ("\\(/\\*\\*\\)"               #Xe12b)
;;             ("\\(/=\\)"                    #Xe12c)
;;             ("\\(/==\\)"                   #Xe12d)
;;             ("\\(/>\\)"                    #Xe12e)
;;             ("\\(//\\)"                    #Xe12f)
;;             ("\\(///\\)"                   #Xe130)
;;             ("\\(&&\\)"                    #Xe131)
;;             ("\\(||\\)"                    #Xe132)
;;             ("\\(||=\\)"                   #Xe133)
;;             ("[^|]\\(|=\\)"                #Xe134)
;;             ("\\(|>\\)"                    #Xe135)
;;             ("\\(\\^=\\)"                  #Xe136)
;;             ("\\(\\$>\\)"                  #Xe137)
;;             ("\\(\\+\\+\\)"                #Xe138)
;;             ("\\(\\+\\+\\+\\)"             #Xe139)
;;             ("\\(\\+>\\)"                  #Xe13a)
;;             ("\\(=:=\\)"                   #Xe13b)
;;             ("[^!/]\\(==\\)[^>]"           #Xe13c)
;;             ("\\(===\\)"                   #Xe13d)
;;             ("\\(==>\\)"                   #Xe13e)
;;             ("[^=]\\(=>\\)"                #Xe13f)
;;             ("\\(=>>\\)"                   #Xe140)
;;             ("\\(<=\\)"                    #Xe141)
;;             ("\\(=<<\\)"                   #Xe142)
;;             ("\\(=/=\\)"                   #Xe143)
;;             ("\\(>-\\)"                    #Xe144)
;;             ("\\(>=\\)"                    #Xe145)
;;             ("\\(>=>\\)"                   #Xe146)
;;             ("[^-=]\\(>>\\)"               #Xe147)
;;             ("\\(>>-\\)"                   #Xe148)
;;             ("\\(>>=\\)"                   #Xe149)
;;             ("\\(>>>\\)"                   #Xe14a)
;;             ("\\(<\\*\\)"                  #Xe14b)
;;             ("\\(<\\*>\\)"                 #Xe14c)
;;             ("\\(<|\\)"                    #Xe14d)
;;             ("\\(<|>\\)"                   #Xe14e)
;;             ("\\(<\\$\\)"                  #Xe14f)
;;             ("\\(<\\$>\\)"                 #Xe150)
;;             ("\\(<!--\\)"                  #Xe151)
;;             ("\\(<-\\)"                    #Xe152)
;;             ("\\(<--\\)"                   #Xe153)
;;             ("\\(<->\\)"                   #Xe154)
;;             ("\\(<\\+\\)"                  #Xe155)
;;             ("\\(<\\+>\\)"                 #Xe156)
;;             ("\\(<=\\)"                    #Xe157)
;;             ("\\(<==\\)"                   #Xe158)
;;             ("\\(<=>\\)"                   #Xe159)
;;             ("\\(<=<\\)"                   #Xe15a)
;;             ("\\(<>\\)"                    #Xe15b)
;;             ("[^-=]\\(<<\\)"               #Xe15c)
;;             ("\\(<<-\\)"                   #Xe15d)
;;             ("\\(<<=\\)"                   #Xe15e)
;;             ("\\(<<<\\)"                   #Xe15f)
;;             ("\\(<~\\)"                    #Xe160)
;;             ("\\(<~~\\)"                   #Xe161)
;;             ("\\(</\\)"                    #Xe162)
;;             ("\\(</>\\)"                   #Xe163)
;;             ("\\(~@\\)"                    #Xe164)
;;             ("\\(~-\\)"                    #Xe165)
;;             ("\\(~=\\)"                    #Xe166)
;;             ("\\(~>\\)"                    #Xe167)
;;             ("[^<]\\(~~\\)"                #Xe168)
;;             ("\\(~~>\\)"                   #Xe169)
;;             ("\\(%%\\)"                    #Xe16a)
;;             ;; ("\\(x\\)"                   #Xe16b) This ended up being hard to do properly so i'm leaving it out.
;;             ("[^:=]\\(:\\)[^:=]"           #Xe16c)
;;             ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
;;             ("[^\\*/<>]\\(\\*\\)[^\\*/<>]" #Xe16f))))

;; (defun add-fira-code-symbol-keywords ()
;;   (font-lock-add-keywords nil fira-code-font-lock-keywords-alist))

;; (add-hook 'prog-mode-hook
;;           #'add-fira-code-symbol-keywords)

;; (set-language-environment "UTF-8")
;; (set-default-coding-systems 'utf-8)
