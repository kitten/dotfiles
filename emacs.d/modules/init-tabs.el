(use-package 'moody)

(require 'elscreen)
(require 'evil-tabs)
(require 'moody)

(custom-theme-set-faces
  'night-owl
  `(header-line ((t (:foreground ,night-owl-foreground
                                 :background ,night-owl-background-highlight
                                 :box nil))))
  `(elscreen-tab-current-screen-face ((t (:background ,night-owl-background))))
  `(elscreen-tab-other-screen-face ((t (:background ,night-owl-background-highlight))))
  )

(defun elscreen-format-tab (screen current-screen)
  (let ((screen-name (assoc-default screen screen-to-name-alist)))
    (if (eq current-screen screen)
      (moody-tab (format "%s  " screen-name) 20 'up)
      (format "%s  " screen-name))))

(setq elscreen-display-tab nil)
(global-evil-tabs-mode t)

;; Bind tab shortcuts to c-w map
(define-key evil-window-map "t" 'elscreen-create)
(define-key evil-window-map "q" 'elscreen-kill)

;; Add hook that hides the tab bar when only one tab is active
(defun elscreen-auto-disable ()
  (if (> (elscreen-get-number-of-screens) 1)
    (setq elscreen-display-tab t)
    (setq elscreen-display-tab nil))
  (elscreen-notify-screen-modification 'force))
(add-hook 'elscreen-create-hook 'elscreen-auto-disable)
(add-hook 'elscreen-kill-hook 'elscreen-auto-disable)

(provide 'init-tabs)
