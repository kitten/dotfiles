(use-package 'night-owl-theme)
(use-package 'which-key)
(use-package 'golden-ratio)

;; resize windows according to the golden ratio
(require 'golden-ratio)
(golden-ratio-mode 1)

;; show available keybindings after you start typing
(require 'which-key)
(which-key-mode +1)

;; disable fringe icons
(fringe-mode '(1 . 0))

;; Empty scratch on start
(setq initial-scratch-message "")

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

;; set UI theme
(load-theme 'night-owl t)

;; Use italics for comments
(custom-theme-set-faces
  'night-owl
  `(font-lock-comment-delimiter-face
     ((t (:foreground ,night-owl-comments
                      :inherit italic))))
  `(font-lock-comment-face
     ((t (:foreground ,night-owl-comments
                      :inherit italic)))))

;; Add border to popups
(custom-theme-set-faces
  'night-owl
   `(popup-face
     ((t (:background ,night-owl-highlight-line
                      :foreground ,night-owl-foreground
                      :box (:color ,"#204462"
                                   :line-width 1)))))
   `(popup-tip-face
     ((t (:background ,night-owl-highlight-line
                      :foreground ,night-owl-foreground
                      :box (:color ,"#204462"
                                   :line-width 1)))))
   )

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
                      :foreground ,night-owl-blue)))))

;; Define git-gutter settings
(custom-set-variables
  '(git-gutter:hide-gutter t)
  '(git-gutter:modified-sign "~")
  '(git-gutter:added-sign "+")
  '(git-gutter:deleted-sign "-"))

(custom-theme-set-faces
  'night-owl
  `(header-line ((t (:foreground ,night-owl-foreground
                                 :background ,night-owl-background-highlight
                                 :box nil))))
  `(elscreen-tab-current-screen-face ((t (:background ,night-owl-background))))
  `(elscreen-tab-other-screen-face ((t (:background ,night-owl-background-highlight))))
  )

(provide 'init-ui)
