(require 'cl)
(require 'package)

;; Add MELPA to package archives
(if (eq system-type 'windows-nt)
    (add-to-list 'package-archives
                 '("melpa" . "http://melpa.org/packages/") t)
    (add-to-list 'package-archives
                 '("melpa" . "https://melpa.org/packages/") t))

;; Package install path
(setq package-user-dir (expand-file-name "elpa" init-dir))
(package-initialize)

(defvar installed-packages '()
  "Continuously updates list of installed packages")

(defun use-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package installed-packages)
    (add-to-list 'installed-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(require 'auto-package-update)

(setq
  auto-package-update-prompt-before-update t
  auto-package-update-delete-old-versions t
  auto-package-update-hide-results t
  auto-package-update-interval 1)

(add-hook 'emacs-startup-hook (lambda () (auto-package-update-maybe)))

(provide 'core-use-package)
