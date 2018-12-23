(use-package 'lsp-mode)
(use-package 'company)
(use-package 'company-lsp)
(use-package 'flycheck)
(use-package 'editorconfig)
(use-package 'git-gutter)
(use-package 'json-mode)

(require 'lsp)
(require 'company)
(require 'company-lsp)
(require 'flycheck)
(require 'editorconfig)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'lsp)
(add-hook 'prog-mode-hook 'company-mode)
(add-hook 'prog-mode-hook 'flycheck-mode)
(add-hook 'prog-mode-hook 'editorconfig-mode)
(add-hook 'prog-mode-hook 'git-gutter-mode)

(add-hook 'prog-mode-hook (lambda () (setq truncate-lines t)))

(push 'company-lsp company-backends)

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection '("flow-language-server" "--stdio" "--try-flow-bin"))
                  :major-modes '(js-mode js2-mode js2-jsx-mode rjsx-mode)
                  :server-id 'flow-ls))

(provide 'init-prog-mode)
