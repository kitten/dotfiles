(use-package 'transient)
(use-package 'magit)
(use-package 'evil-magit)

(setq
	magit-refresh-status-buffer nil
	evil-magit-want-horizontal-movement t)

(require 'magit)
(require 'evil-magit)

(define-prefix-command 'evil-leader-magit-map)
(define-key 'evil-leader-magit-map "s" 'magit-status)
(evil-leader/set-key "g" 'evil-leader-magit-map)

(provide 'init-magit)
