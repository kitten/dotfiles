(use-package 'night-owl-theme)
(use-package 'which-key)

;; show available keybindings after you start typing
(require 'which-key)
(which-key-mode +1)

;; Hide Fringe wrapping icons
(define-fringe-bitmap 'right-curly-arrow
  [#b00000000
   #b00000000
   #b00000000
   #b00000000
   #b00000000
   #b00000000
   #b00000000
   #b00000000])
(define-fringe-bitmap 'left-curly-arrow
  [#b00000000
   #b00000000
   #b00000000
   #b00000000
   #b00000000
   #b00000000
   #b00000000
   #b00000000])

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

(custom-set-variables
  '(night-owl-blue "#87abf9")
  '(night-owl-background "#031526")
  '(night-owl-comments "#4b6479")
  '(night-owl-line-number "#4b6479")
  '(night-owl-foreground "#dee6f2"))

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

(custom-theme-set-faces
  'night-owl
  `(header-line ((t (:foreground ,night-owl-foreground
                                 :background ,night-owl-background-highlight
                                 :box nil))))
  `(elscreen-tab-current-screen-face ((t (:background ,night-owl-background))))
  `(elscreen-tab-other-screen-face ((t (:background ,night-owl-background-highlight))))
  )

(defun reset-max-width (&optional window)
  (when (eq (window-parameter window 'split-window) 'split-max-width-window)
    (set-window-parameter window 'split-window nil))
  (kill-local-variable 'split-window-preferred-function)
  (set-window-margins window nil))

(defun split-max-width-window (&optional window size side)
  (reset-max-width window)
  (split-window window size side))

(defun split-max-width-window-sensibly (&optional window)
  (reset-max-width window)
  (split-window-sensibly window))

(defun apply-max-width (&optional frame)
  "Resize margin of current window."
  (interactive)
  (mapc (lambda (window)
    (with-selected-window window
      (let* ((width 100)
             (window-width (window-total-width window))
             (fringes (window-fringes window))
             (left-fringe (/ (car fringes) (float (frame-char-width frame))))
             (right-fringe (/ (cadr fringes) (float (frame-char-width frame))))
             (margin-total (max (/ (- window-width width) 2) 0))
             (left-margin (max (round (- margin-total left-fringe)) 0))
             (right-margin (max (round (- margin-total right-fringe)) 0)))
          (display-line-numbers-mode 1)
          (set-window-parameter window 'split-window 'split-max-width-window)
          (setq-local split-window-preferred-function #'split-max-width-window-sensibly)
          (set-window-margins window left-margin right-margin))
      ))
      (window-list nil :exclude-minibuffer)))

(add-hook 'window-configuration-change-hook 'apply-max-width 'append)
(add-hook 'window-size-change-functions 'apply-max-width 'append)

(provide 'init-ui)
