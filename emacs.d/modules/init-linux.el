;; Touchpad scrolling needs to fucking chill
(setq mouse-wheel-scroll-amount '(1))
(setq mouse-wheel-progressive-speed nil)

;; Adjust keystroke echoing
(setq echo-keystrokes 0.02)

;; font attributes for wonky HiDPI
(set-face-attribute 'default nil :height 100)

;; Support emojis because why not
(use-package 'emojify)
(setq emojify-emoji-styles '(unicode))
(add-hook 'after-init-hook #'global-emojify-mode)

(provide 'init-linux)
