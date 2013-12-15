;; custom files

(defvar peanuts-dir (file-name-directory load-file-name)
  "The root dir of Emacs peanuts setting.")

(setq custom-file (expand-file-name "custom.el" peanuts-dir))
(load custom-file)

;; packages
(package-initialize)

;; ido-mode
(ido-mode +1)
(ido-ubiquitous-mode +1)
(flx-ido-mode +1)

;; smex
;; (smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; old M-x
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; auto-complete-mode
(require 'auto-complete-config)
(ac-config-default)

;; smart parens
(require 'smartparens-config)
(smartparens-global-mode +1)

;; recent files
(recentf-mode)

;; theme
(load-theme 'solarized-dark t)

;; flymake jshint
(add-hook 'javascript-mode-hook
	  (lambda () (flymake-mode t)))
(add-hook 'js3-mode-hook
	  (lambda () (flymake-mode t)))

;; sr-speedbar
(require 'sr-speedbar)

;; PATH
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append exec-path
      '("/usr/local/share/npm/bin")))

;; yasnippet
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook
	  '(lambda ()
	     (yas-minor-mode)))

;; angular-snippets
(require 'angular-snippets)
(eval-after-load "sgml-mode"
  '(define-key html-mode-map (kbd "C-c C-d") 'ng-snip-show-docs-at-point))
