(use-package 'lsp-mode)
(use-package 'company)
(use-package 'company-lsp)
(use-package 'editorconfig)
(use-package 'git-gutter)
(use-package 'json-mode)
(use-package 'typescript-mode)
(use-package 'flymake-diagnostic-at-point)

(require 'lsp)
(require 'company)
(require 'company-lsp)
(require 'flymake)
(require 'flymake-diagnostic-at-point)
(require 'editorconfig)

(custom-set-variables
	'(lsp-prefer-flymake t)
	'(flymake-diagnostic-at-point-display-diagnostic-function flymake-diagnostic-at-point-display-popup)
  '(flymake-diagnostic-at-point-timer-delay 0.3)
  '(flymake-diagnostic-at-point-error-prefix "> "))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'lsp)
(add-hook 'prog-mode-hook 'company-mode)
(add-hook 'prog-mode-hook 'flymake-mode)
(add-hook 'prog-mode-hook 'editorconfig-mode)
(add-hook 'prog-mode-hook 'git-gutter-mode)

(add-hook 'prog-mode-hook (lambda () (setq truncate-lines t)))

(add-hook 'flymake-mode-hook #'flymake-diagnostic-at-point-mode)

(push 'company-lsp company-backends)

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection '("flow-language-server" "--stdio" "--try-flow-bin"))
                  :major-modes '(js-mode js2-mode js2-jsx-mode rjsx-mode)
                  :server-id 'flow-ls))

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection '("javascript-typescript-stdio"))
                  :major-modes '(typescript-mode)
                  :server-id 'typescript-ls))

(provide 'init-prog-mode)
