;;; markdown-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (gfm-mode markdown-mode) "markdown-mode" "markdown-mode.el"
;;;;;;  (21716 58099 174585 685000))
;;; Generated autoloads from markdown-mode.el

(autoload 'markdown-mode "markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t nil)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode" "\
Major mode for editing GitHub Flavored Markdown files.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("markdown-mode-pkg.el") (21716 58099 250083
;;;;;;  53000))

;;;***

(provide 'markdown-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; markdown-mode-autoloads.el ends here
