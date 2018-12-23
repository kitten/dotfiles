(require 'thingatpt)
(require 'cl-lib)

;; Change GC threshold to >100MB
(setq gc-cons-threshold 100000000)

;; Warn on files >100MB
(setq large-file-warning-threshold 100000000)

;; Disable backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-basics)
