(use-package 'markdown-mode)

(custom-theme-set-faces 'night-owl
  `(markdown-language-keyword-face ((t (:inherit default :family "Dank Mono"))))
  `(markdown-language-info-face ((t (:inherit default :family "Dank Mono"))))
  `(markdown-pre-face ((t (:inherit default :family "Dank Mono"))))
  `(markdown-code-face ((t (:inherit default :family "Dank Mono"))))
  `(markdown-inline-code-face
    ((t (:foreground ,night-owl-blue :inherit default :family "Dank Mono"))))
  `(markdown-table-face ((t (:inherit default :family "Dank Mono"))))
  `(markdown-url-face ((t (:weight normal))))
  )

(defun setup-markdown ()
	(interactive)
  (setq buffer-face-mode-face '(
    :family "iA Writer Quattro S" :height 130 :width semi-condensed))
  (buffer-face-mode)
  (setq markdown-fontify-code-blocks-natively t)
  (setq markdown-code-lang-modes
    '(("ocaml" . tuareg-mode) ("elisp" . emacs-lisp-mode) ("ditaa" . artist-mode)
        ("asymptote" . asy-mode) ("dot" . fundamental-mode) ("sqlite" . sql-mode)
        ("calc" . fundamental-mode) ("C" . c-mode) ("cpp" . c++-mode)
        ("C++" . c++-mode) ("screen" . shell-script-mode) ("shell" . sh-mode)
        ("bash" . sh-mode) ("ts" . typescript-mode) ("typescript" . typescript-mode)
        ("js" . js-mode) ("javascript" . js-mode) ("reason" . reason-mode)
        ("json" . json-mode)))
  (setq markdown-pre-face '(:family "Dank Mono"))
  (setq markdown-code-face '(:family "Dank Mono"))
  (setq markdown-inline-code-face '(:family "Dank Mono"))
  (setq markdown-language-keyword-face '(:family "Dank Mono"))
  (setq markdown-language-info-face '(:family "Dank Mono"))
  (setq markdown-link-title-face '(:weight normal))
  (setq markdown-line-break-face '(:height 90))
  (setq markdown-hide-urls t)
  (setq markdown-url-compose-char "…")
  (gfm-mode))

(add-hook 'markdown-mode-hook 'setup-markdown)

(provide 'init-markdown-mode)
