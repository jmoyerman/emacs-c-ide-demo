;; Personal emacs configuration touches
(load-theme 'wombat t)


;; Test always speedbar
;(sr-speedbar-open)


;; Hungry delete in C mode
(add-hook 'c-mode-common-hook (lambda () (c-toggle-auto-hungry-state 1)))


;; Google code style
; https://google-styleguide.googlecode.com/svn/trunk/google-c-style.el
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

;;More whitespace stuff
 (require 'whitespace)
 (setq whitespace-style '(face empty lines-tail trailing))
 (global-whitespace-mode t)

(setq ecb-tip-of-the-day nil) ; Ugly tooltip
(require 'ecb)
(ecb-activate)



(setq sp-autoescape-string-quote nil)


;;Javascript stuff
(setq js-indent-level 2)

(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
