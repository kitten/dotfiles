(use-package 'undo-tree)
(use-package 'evil)
(use-package 'evil-leader)
(use-package 'evil-collection)

(setq evil-want-integration t
  evil-want-keybinding nil
  evil-collection-mode-list nil)

(require 'key-chord)
(require 'evil)
(require 'evil-leader)
(require 'evil-collection-dired)
(require 'evil-collection-ivy)
(require 'evil-collection-eshell)

(evil-mode 1)
(global-evil-leader-mode)
(evil-collection-dired-setup)
(evil-collection-ivy-setup)
(evil-collection-eshell-setup)

(setq night-owl-evil-cursors
      '(("normal" night-owl-orange box)
        ("insert" night-owl-cursor (bar . 2))
        ("emacs" night-owl-cursor (bar . 2))
        ("hybrid" night-owl-cursor (bar . 2))
        ("replace" night-owl-gray (bar . 2))
        ("evilified" night-owl-yellow box)
        ("visual" night-owl-gray (bar . 2))
        ("motion" night-owl-violet box)
        ("lisp" night-owl-red box)
        ("iedit" night-owl-magenta box)
        ("iedit-insert" night-owl-magenta (bar . 2))))

(defun night-owl-set-evil-cursor (state color shape)
  (set (intern (format "evil-%s-state-cursor" state))
       (list color shape)))

(defun night-owl-update-evil-cursors ()
  (let ((current-theme (symbol-name (car custom-enabled-themes))))
    (cl-loop for (state color style) in night-owl-evil-cursors do
             (night-owl-set-evil-cursor state (symbol-value color) style))))

(add-hook 'after-init-hook #'night-owl-update-evil-cursors)

(defvar after-load-theme-hook nil
  "Hook run after a color theme is loaded using `load-theme'.")

(defadvice load-theme (after run-after-load-theme-hook activate)
  "Run `after-load-theme-hook'."
  (message (format "Loading theme %s" (ad-get-arg 0)))
  (run-hooks 'after-load-theme-hook))

(add-hook 'after-load-theme-hook #'night-owl-update-evil-cursors)

;; Rebind C-c to escape in evil and otherwise do C-g
(defun my-esc (prompt)
  "Functionality for escaping generally. Includes exiting Evil insert state and C-g binding. "
  (cond
    ((or (evil-insert-state-p) (evil-normal-state-p) (evil-replace-state-p) (evil-visual-state-p)) [escape])
    (t (kbd "C-g"))))
(define-key key-translation-map (kbd "C-c") 'my-esc)
(define-key evil-operator-state-map (kbd "C-c") 'keyboard-quit)
(set-quit-char "C-c")

;; Use <TAB> to indent in insert mode
(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)

;; Open vsplits to the right
(setq evil-vsplit-window-right t)

;; Use <SPC> key as leader
(evil-leader/set-leader "<SPC>")

;; Bind <ESC> to enter normal mode from emacs mode
(define-key evil-emacs-state-map [escape] 'evil-normal-state)

;; Resizing
(define-key evil-normal-state-map (kbd "C-h") 'shrink-window-horizontally)
(define-key evil-normal-state-map (kbd "C-l") 'enlarge-window-horizontally)
(define-key evil-normal-state-map (kbd "C-j") 'shrink-window)
(define-key evil-normal-state-map (kbd "C-k") 'enlarge-window)

(provide 'init-evil)
