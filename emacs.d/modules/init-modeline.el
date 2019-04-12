(use-package 'moody)
(use-package 'powerline)

(require 'moody)
(require 'powerline)

(when (eq system-type 'darwin) (setq moody-slant-function 'moody-slant-apple-rgb))

(setq moody-mode-line-height 24)
(setq x-underline-at-descent-line t)

(when (not (eq system-type 'darwin)) (setq moody-mode-line-height 48))

(set-face-attribute 'mode-line          nil :box        nil)
(set-face-attribute 'mode-line-inactive nil :box        nil)
(set-face-attribute 'mode-line-inactive nil :background "#010F1D")

;; mode line settings
(global-eldoc-mode -1)
(size-indication-mode -1)
(line-number-mode -1)
(column-number-mode -1)
(size-indication-mode -1)

;; Provide evil mode-line faces
(defface evil-mode-line:normal
  '((t :foreground "#82AAFF"))
  "evil-mode-line:normal face")
(defface evil-mode-line:insert
  '((t :foreground "#F78C6C"))
  "evil-mode-line:insert face")
(defface evil-mode-line:visual
  '((t :foreground "#C792EA"))
  "evil-mode-line:visual face")

;; Replace evil mode-line with colorised version
(defun evil-generate-mode-line-tag (&optional state)
  "Generate the evil mode-line tag for STATE."
  (let ((tag (evil-state-property state :tag t)))
    (if (stringp tag)
      (propertize tag
                  'face (cond
                          ((string= "normal" state) 'evil-mode-line:normal)
                          ((string= "insert" state) 'evil-mode-line:insert)
                          ((string= "visual" state) 'evil-mode-line:visual))
                  'help-echo (evil-state-property state :name)
                  'mouse-face 'mode-line-highlight)
      tag)))

(customize-set-variable 'mode-line-format
  '("%e"
    " "
    (:eval evil-mode-line-tag)
    "  "
    moody-mode-line-buffer-identification
    "  "
    mode-name
    "  "
    moody-vc-mode
    "  "
    mode-line-misc-info
    "  "
    mode-line-end-spaces
  ))

(moody-replace-mode-line-buffer-identification)
(moody-replace-vc-mode)

(provide 'init-modeline)
