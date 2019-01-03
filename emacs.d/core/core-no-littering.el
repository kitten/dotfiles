;; No littering directories
(setq no-littering-etc-directory (expand-file-name "etc/" init-dir))
(setq no-littering-var-directory (expand-file-name "var" init-dir))

(require 'no-littering)

;; Save custom settings in etc/
(setq custom-file (no-littering-expand-etc-file-name "custom.el"))

;; Save auto-save files in var/
(setq auto-save-file-name-transforms
	`((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

;; Save auto-update file in var/
(setq auto-package-update-last-update-day-filename
	(no-littering-expand-var-file-name ".last-package-update-day"))

;; Set up eshell files in var/
(setq eshell-directory-name (no-littering-expand-var-file-name "eshell/"))
(setq eshell-history-file-name (no-littering-expand-var-file-name "eshell/history"))
(setq eshell-aliases-file (no-littering-expand-var-file-name "eshell/.alias"))
(setq eshell-last-dir-ring-file-name (no-littering-expand-var-file-name "eshell/.last-dir"))

(provide 'core-no-littering)
