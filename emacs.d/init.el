(defvar init-dir (file-name-directory load-file-name) "The config root dir.")
(defvar init-core-dir (expand-file-name "core" init-dir) "The core modules.")
(defvar init-vendor-dir (expand-file-name "vendor" init-core-dir) "The vendored core modules.")
(defvar init-modules-dir (expand-file-name "modules" init-dir) "The main init modules.")

(setq load-prefer-newer t)
(add-to-list 'load-path init-core-dir)
(add-to-list 'load-path init-vendor-dir)
(add-to-list 'load-path init-modules-dir)

;; CORE MODULES
(require 'core-no-littering)
(require 'core-use-package)

;; MAIN MODULES
(require 'init-basics)
(require 'init-evil)
(require 'init-ui)
(require 'init-modeline)
(require 'init-projects)
(require 'init-prog-mode)
(require 'init-shell-mode)

;; MAC ONLY
(when (eq system-type 'darwin)
  (require 'init-mac))

;; LINUX ONLY
(when (eq system-type 'gnu/linux)
  (require 'init-linux))

(provide 'init)
