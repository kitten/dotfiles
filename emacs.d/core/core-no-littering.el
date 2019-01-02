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

(provide 'core-no-littering)
