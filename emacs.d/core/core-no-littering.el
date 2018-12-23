;; No littering directories
(setq no-littering-etc-directory (expand-file-name "etc/" init-dir))
(setq no-littering-var-directory (expand-file-name "var" init-dir))

(require 'no-littering)

(provide 'core-no-littering)
