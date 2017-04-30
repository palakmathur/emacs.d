;;Configure Outbound Mail

;;Tell the program who you are

(setq user-full-name "Palak Mathur")
(setq user-mail-address "palakmathur@gmail.com")

;;Tell Emacs to use GNUTLS instead of STARTTLS
;;to authenticate when sending mail.

(setq starttls-use-gnutls t)

;;Tell Emacs about your mail server and credentials

(setq send-mail-function 'smtpmail-send-it
message-send-mail-function 'smtpmail-send-it
smtpmail-starttls-credentials
'(("smtp.gmail.com" 587 nil nil))
smtpmail-auth-credentials
(expand-file-name "~/.authinfo")
smtpmail-default-smtp-server "smtp.gmail.com"
smtpmail-smtp-server "smtp.gmail.com"
smtpmail-smtp-service 587
smtpmail-debug-info t)
(require 'smtpmail)
;;'(send-mail-function (quote smtpmail-send-it))


;;; Set some sane defaults for VM’s replies and forwarding

(setq
vm-forwarding-subject-format "[forwarded from %F] %s"
vm-forwarding-digest-type "rfc934"
vm-in-reply-to-format nil
vm-included-text-attribution-format
"On %w, %m %d, %y at %h (%z), %F wrote:n"
vm-reply-subject-prefix "Re: "
vm-mail-header-from "Palak Mathur <palakmathur@gmail.com>"
)
