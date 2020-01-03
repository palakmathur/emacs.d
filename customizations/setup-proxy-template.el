;; HttpProxy
(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
        ("http" . "proxy:port")
        ("https" . "proxy:prt")))

(setq url-http-proxy-basic-auth-storage
      (list (list "proxy:port"
                  (cons "Input your LDAP UID !"
                        (base64-encode-string "UserName:Password")))))
;; -HttpProxy
