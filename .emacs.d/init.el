(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; packages
(defvar my/favorite-packages
  '(
    ;; auto complete
    auto-complete fuzzy popup pos-tip helm flycheck monokai-theme
		  magit git-gutter
		  ))
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))

(load-theme 'monokai t)

(global-linum-mode 1)
(setq linum-format "%d ")

(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

;; don't display startup message
(setq inhibit-startup-message t)

;; hide menubar
(menu-bar-mode -1)

;; no backupfile
(setq make-backup-files nil)

;; tab size
(setq default-tab-width 2 indent-tabs-mode nil)

;; complete bracket
(electric-pair-mode 1)

(require 'auto-complete-config)
(global-auto-complete-mode 0.5)

;; key bindings
;; backspace C-h
(global-set-key "\C-h" 'delete-backward-char)

;; delete whole line
(setq kill-whole-line t)

;; slime
(add-to-list 'load-path (expand-file-name "~/.emacs.d/slime"))
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (git-gutter magit pos-tip fuzzy auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
