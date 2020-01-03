(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
       ;; "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
        "~/.emacs.d/elpa/yasnippet-snippets-20191230.1405/yasnippet/yasmate/snippets" ;; the yasmate collection
        ))

(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already
