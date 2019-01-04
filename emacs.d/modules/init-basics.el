(use-package 'exec-path-from-shell)

(require 'thingatpt)
(require 'cl-lib)
(require 'exec-path-from-shell)

;; Fix missing $PATH from shell
(exec-path-from-shell-initialize)

;; Non exhaustive list of things to copy
(exec-path-from-shell-copy-env "YARN_CACHE_FOLDER")
(exec-path-from-shell-copy-env "HOSTNAME")
(exec-path-from-shell-copy-env "EDITOR")
(exec-path-from-shell-copy-env "GPG_AGENT_INFO")
(exec-path-from-shell-copy-env "SSH_AUTH_SOCK")
(exec-path-from-shell-copy-env "GPG_TTY")

;; Change GC threshold to >100MB
(setq gc-cons-threshold 100000000)

;; Warn on files >100MB
(setq large-file-warning-threshold 100000000)

;; Disable backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Default indentation
(setq-default indent-tabs-mode nil tab-width 2)

(provide 'init-basics)
