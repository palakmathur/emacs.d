;; Setting up stunnel for vm
;;; Code:
(add-to-list 'load-path
(expand-file-name "~/.emacs.d/vendor/vm-8.2.0a/lisp"))
(add-to-list 'Info-default-directory-list
(expand-file-name "~/.emacs.d/vm-8.2.0a/info"))
(require 'vm-autoloads)
(setq vm-stunnel-program "/usr/local/bin/stunnel/5.41/bin/stunnel")
;;(setq vm-stunnel-program "/usr/local/etc/stunnel")
;; Set some sane defaults for VM’s replies and forwarding

(setq
vm-forwarding-subject-format "[forwarded from %F] %s"
vm-forwarding-digest-type "rfc934"
vm-in-reply-to-format nil
vm-included-text-attribution-format
"On %w, %m %d, %y at %h (%z), %F wrote:n"
vm-reply-subject-prefix "Re: "
vm-mail-header-from "Palak Mathur <palakmathur@gmail.com>"
)

(setq vm-mime-text/html-handler 'emacs-w3m)

(provide 'setup-vm)
;;;setup-vm ends here
