(use-package 'night-owl-theme)
(use-package 'powerline)
(use-package 'spaceline)
(use-package 'which-key)
(use-package 'golden-ratio)

(require 'spaceline-config)
(require 'which-key)
(require 'golden-ratio)

;; resize windows according to the golden ratio
(golden-ratio-mode 1)

;; clean up modes
(global-eldoc-mode -1)

;; show available keybindings after you start typing
(which-key-mode +1)

;; disable fringe icons
(fringe-mode '(1 . 0))

;; Empty scratch on start
(setq initial-scratch-message "")

;; Fix powerline images on Mac
(setq powerline-image-apple-rgb t)

;; font attributes
(set-face-attribute 'default nil :family "Dank Mono")
(set-face-attribute 'default nil :height 130)

;; disable unnecessary UI stuff
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(scroll-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0)
(setq scroll-conservatively 100000)
(setq scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; Configure modeline content
(setq powerline-default-separator 'nil)

;; set UI theme
(load-theme 'night-owl t)
(spaceline-spacemacs-theme)
(spaceline-toggle-minor-modes-off)

;; Use italics for comments
(custom-theme-set-faces
  'night-owl
  `(font-lock-comment-delimiter-face
     ((t (:foreground ,night-owl-comments
                      :inherit italic))))
  `(font-lock-comment-face
     ((t (:foreground ,night-owl-comments
                      :inherit italic))))
  )

;; Define git-gutter settings
(custom-set-variables
  '(git-gutter:hide-gutter t)
  '(git-gutter:modified-sign "~")
  '(git-gutter:added-sign "+")
  '(git-gutter:deleted-sign "-"))

;; Invert default git-gutter face from night-owl
(custom-theme-set-faces
  'night-owl
  `(git-gutter:added
     ((t (:background ,night-owl-background
                      :foreground ,night-owl-orange))))
  `(git-gutter:deleted
     ((t (:background ,night-owl-background
                      :foreground ,night-owl-magenta))))
  `(git-gutter:modified
     ((t (:background ,night-owl-background
                      :foreground ,night-owl-blue))))
  )

(provide 'init-ui)
