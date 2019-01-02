;; Various Mac UI settings
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)

(setq ns-command-modifier 'meta); Command is Meta
(setq ns-alternate-modifier 'super); Option is Mac Option
(setq ns-function-modifier  'hyper)

(setq mac-right-command-modifier '(:ordinary hyper))
(setq mac-right-option-modifier nil)

;; Super-x as alternate M-x
(global-set-key (kbd "s-x") 'smex)

;; Touchpad scrolling needs to fucking chill
(setq mouse-wheel-scroll-amount '(1))
(setq mouse-wheel-progressive-speed nil)

;; Adjust keystroke echoing
(setq echo-keystrokes 0.02)

;; Support emojis because why not
(when (fboundp 'set-fontset-font)
  (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))

(provide 'init-mac)
