(use-package 'ivy)
(use-package 'counsel)
(use-package 'projectile)
(use-package 'counsel-projectile)
(use-package 'ag)
(use-package 'ranger)

(require 'projectile)
(require 'ivy)

;; Setup ranger
(ranger-override-dired-mode t)
(setq
  ranger-cleanup-eagerly t
  ranger-modify-header nil)

;; Set up ivy
(ivy-mode 1)
(setq
  ivy-use-virtual-buffers t
  enable-recursive-minibuffers t)

(projectile-mode +1)
(counsel-projectile-mode)
(setq projectile-completion-system 'ivy)

;; Keybinding
(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
(evil-leader/set-key "p" 'counsel-projectile-switch-project)
(evil-leader/set-key "o" 'counsel-projectile-find-file)
(evil-leader/set-key "f" 'counsel-projectile-rg)
(evil-leader/set-key "b" 'counsel-projectile-switch-to-buffer)

;; Set up a default search path for projects
(setq projectile-project-search-path '("~/Development/"))

;; Open dired when switching projects
(setq projectile-switch-project-action #'projectile-dired)

;; Bind "-" to directory viewer
(evil-global-set-key 'normal "-" 'deer)

(provide 'init-projects)
