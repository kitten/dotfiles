(use-package 'lsp-mode)
(use-package 'lsp-ui)
(use-package 'company)
(use-package 'company-lsp)
(use-package 'editorconfig)
(use-package 'git-gutter)
(use-package 'json-mode)
(use-package 'typescript-mode)
(use-package 'markdown-mode)
(use-package 'reason-mode)
(use-package 'flymake-diagnostic-at-point)

(require 'lsp)
(require 'company)
(require 'company-lsp)
(require 'flymake)
(require 'flymake-diagnostic-at-point)
(require 'editorconfig)

(custom-set-variables
  '(typescript-indent-level 2)
  '(typescript-auto-indent-flag nil)
  '(typescript-indent-switch-clause nil)
  '(lsp-auto-guess-root t)
	'(lsp-prefer-flymake t)
  '(lsp-markup-display-all nil)
  '(lsp-auto-require-clients t)
  '(lsp-ui-sideline-enable nil)
  '(lsp-ui-peek-enable t)
  '(lsp-ui-doc-enable nil)
	'(flymake-diagnostic-at-point-display-diagnostic-function flymake-diagnostic-at-point-display-popup)
  '(flymake-diagnostic-at-point-timer-delay 0.3)
  '(flymake-diagnostic-at-point-error-prefix "> "))

(push 'company-lsp company-backends)

(add-hook 'prog-mode-hook 'lsp)
(add-hook 'prog-mode-hook 'company-mode)
(add-hook 'prog-mode-hook 'flymake-mode)
(add-hook 'prog-mode-hook 'editorconfig-mode)
(add-hook 'flymake-mode-hook #'flymake-diagnostic-at-point-mode)

(provide 'init-prog-mode)
