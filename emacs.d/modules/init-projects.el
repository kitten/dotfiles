(use-package 'projectile)
(use-package 'ivy)

(require 'projectile)
(require 'ivy)

;; Set up ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(projectile-mode +1)
(setq projectile-completion-system 'ivy)

;; Keybinding
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(evil-leader/set-key "p" 'projectile-command-map)

;; Set up a default search path for projects
(setq projectile-project-search-path '("~/Development/"))

;; Open dired when switching projects
(setq projectile-switch-project-action #'projectile-dired)

(provide 'init-projects)
