;;; vm-cus-load.el --- automatically extracted custom dependencies
;;
;;; Code:

(put 'vm-faces 'custom-loads '(vm-vars))
(put 'vm-compose 'custom-loads '(vm-vars))
(put 'vm-grepmail 'custom-loads '(vm-grepmail))
(put 'vm-imap 'custom-loads '(vm-vars))
(put 'vm-ext 'custom-loads '(u-vm-color vm-avirtual vm-biff vm-message-history vm-pgg vm-pine vm-rfaddons vm-serial vm-pcrisis))
(put 'vm-serial 'custom-loads '(vm-serial))
(put 'vmpc 'custom-loads '(vm-pcrisis))
(put 'news 'custom-loads '(vcard))
(put 'vm-toolbar 'custom-loads '(vm-vars vm-toolbar))
(put 'vm-hooks 'custom-loads '(vm-vars))
(put 'vm-presentation 'custom-loads '(vm-vars vm-w3m))
(put 'vm-avirtual 'custom-loads '(vm-avirtual))
(put 'vm-frames 'custom-loads '(vm-vars))
(put 'vm-digest 'custom-loads '(vm-vars))
(put 'vm-dispose 'custom-loads '(vm-vars))
(put 'u-vm-color 'custom-loads '(u-vm-color))
(put 'vm-url 'custom-loads '(vm-vars))
(put 'vm-w3m 'custom-loads '(vm-w3m))
(put 'vm-rfaddons 'custom-loads '(vm-rfaddons vm-vars))
(put 'vm 'custom-loads '(vm-vars vm-grepmail))
(put 'vm-helpers 'custom-loads '(vm-vars))
(put 'vm-biff 'custom-loads '(vm-biff))
(put 'vm-pop 'custom-loads '(vm-vars))
(put 'vm-summary 'custom-loads '(vm-vars))
(put 'vcard 'custom-loads '(vcard))
(put 'vm-summary-faces 'custom-loads '(vm-vars))
(put 'faces 'custom-loads '(vm-pgg))
(put 'vm-pgg 'custom-loads '(vm-pgg))
(put 'vm-folders 'custom-loads '(vm-vars))
(put 'mail 'custom-loads '(vcard vm-vars))
(put 'vm-misc 'custom-loads '(vm-vars))
(put 'vm-print 'custom-loads '(vm-vars vm-ps-print))
(put 'vm-pine 'custom-loads '(vm-pine))
(put 'vm-mime 'custom-loads '(vm-vars vm-mime))
(put 'vm-message-history 'custom-loads '(vm-message-history))
;; These are for handling :version.  We need to have a minimum of
;; information so `customize-changed-options' could do its job.

;; For groups we set `custom-version', `group-documentation' and
;; `custom-tag' (which are shown in the customize buffer), so we
;; don't have to load the file containing the group.

;; `custom-versions-load-alist' is an alist that has as car a version
;; number and as elts the files that have variables or faces that
;; contain that version. These files should be loaded before showing
;; the customization buffer that `customize-changed-options'
;; generates.

;; This macro is used so we don't modify the information about
;; variables and groups if it's already set. (We don't know when
;; vm-cus-load.el is going to be loaded and at that time some of the
;; files might be loaded and some others might not).
(defmacro custom-put-if-not (symbol propname value)
  `(unless (get ,symbol ,propname)
     (put ,symbol ,propname ,value)))


(defvar custom-versions-load-alist nil
 "For internal use by custom.")

(provide 'vm-cus-load)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; vm-cus-load.el ends here
