(use-package 'xterm-color)
(use-package 'esh-autosuggest)
(use-package 'eshell-z)

(require 'eshell)
(require 'esh-autosuggest)

(setq
  eshell-highlight-prompt nil
  eshell-buffer-shorthand t
  eshell-cmpl-ignore-case t
  eshell-cmpl-cycle-completions t
  eshell-destroy-buffer-when-process-dies t
  eshell-history-size 10000
  eshell-buffer-maximum-lines 20000
  eshell-hist-ignoredups t
  eshell-error-if-no-glob t
  eshell-glob-case-insensitive t
  eshell-scroll-to-bottom-on-input 'all
  eshell-scroll-to-bottom-on-output 'all
  eshell-list-files-after-cd t
  eshell-banner-message "")

(setq eshell-visual-commands
      '("vi" "vim" "nvim" "top" "less" "more"))

(setq eshell-visual-subcommands '(("git" "log" "diff" "show")))

(add-hook 'eshell-before-prompt-hook (lambda () (setq xterm-color-preserve-properties t)))
(add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
(setq eshell-output-filter-functions (remove 'eshell-handle-ansi-color eshell-output-filter-functions))

(add-hook 'eshell-mode-hook #'esh-autosuggest-mode)

;; Override default clear function to start at top
(defun eshell/clear ()
  "Clear terminal"
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(defun setup-eshell ()
	(interactive)
  (require 'eshell-z)
	(local-set-key (kbd "C-l") 'eshell/clear)
	(define-key eshell-mode-map (kbd "<tab>") 'completion-at-point)
	(semantic-mode -1)
	(hl-line-mode -1))
(add-hook 'eshell-mode-hook 'setup-eshell)

;; Keybinding
(evil-leader/set-key "e" 'eshell)

(provide 'init-shell-mode)
