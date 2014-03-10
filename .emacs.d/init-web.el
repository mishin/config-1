(require-package 'js2-mode)
(require 'js2-mode)
(setq js2-highlight-level 3)
(setq-default js2-basic-offset 2)

(require-package 'ac-js2)
(require-package 'tern)
(require-package 'tern-auto-complete)

(after 'js2-mode-autoloads
  (setq auto-mode-alist (cons '("\\.js\\'" . js2-mode) auto-mode-alist)))

(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(after 'tern
  (after 'auto-complete
    (require 'tern-auto-complete)
    (tern-ac-setup)))


(require-package 'jade-mode)

(require-package 'skewer-mode)
(skewer-setup)

(require-package 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; indent after deleting a tag
(defadvice sgml-delete-tag (after reindent activate)
  (indent-region (point-min) (point-max)))

(provide 'init-web)