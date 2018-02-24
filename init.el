;; BASIC CUSTOMIZATION

;;hide the start-up message
(setq inhibit-startup-message t)

;;open emacs in full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;---------------------

;;disable menu-bar
;;(menu-bar-mode -1)

;;disable tool-bar
(tool-bar-mode -1)

;;disable scroll-bar
(scroll-bar-mode -1)

;;-----------------------

;;show line-numbers
(global-linum-mode 1)

;;highlight current-line
(global-hl-line-mode 1)

;;highlight matching parenthesis
(show-paren-mode 1)

;;insert matching delimiters
(electric-pair-mode 1)

;;automatically reload files when they change on disk
(global-auto-revert-mode 1)

;;show column number in mode line
(column-number-mode 1)

;;enable incremental completion in mini-buffer
(icomplete-mode 1)

;;don't blink cursor
(blink-cursor-mode 0)

;;show file-size in chars
(size-indication-mode t)

;;change all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;;display time on mode-line
(setq display-time-24hr-format t)
(display-time-mode 1)

;;stop making backup(~) files
(setq make-backup-files nil)

;;set encoding to utf-8
(prefer-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-auto-unix)

;;remove trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;keep track of window configurations
(winner-mode t)
;; Usage: C-c left(winner-undo) C-c right(winner-redo)

;;move directionally between neighbouring windows
(windmove-default-keybindings)
;; Usage: S-[left right top down]

;;disable arrow keys
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<C-left>"))
(global-unset-key (kbd "<C-right>"))
(global-unset-key (kbd "<C-up>"))
(global-unset-key (kbd "<C-down>"))
(global-unset-key (kbd "<M-up>"))
(global-unset-key (kbd "<M-down>"))
;; Usage: C-p(up) C-n(down) C-b(left) C-f(right)

;;sort results of apropos by relevancy
(setq apropos-sort-by-scores t)
;;-------------------------
;;-------packages-----------

(require 'package)

;;add more repositories to fetch-archive list
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

;;load and activate emacs lisp packages
(package-initialize)

;;don't activate all the installed packages
(setq package-enable-at-startup nil)

;;inform emacs about the latest versions of all packages
(when (not package-archive-contents)
  (package-refresh-contents))

;;install use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)

;;change theme to gruvbox-dark-hard
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'gruvbox-dark-hard t)

;;install company-mode for auto-completion and activate it in all buffers
(use-package company
  :ensure t
  :config (global-company-mode))

;;use magit for git
(use-package magit
  :ensure t)

;;add smex and replace M-x with it.
(use-package smex
  :config (smex-initialize))

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;better syntax highlighting for clojure files
(use-package clojure-mode-extra-font-locking
  :ensure t)

;;add colours to matching parens
(use-package rainbow-delimiters
  :ensure t
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;;aggressively indent clojure-code
(use-package aggressive-indent
  :ensure t
  :config (add-hook 'clojure-mode-hook 'aggressive-indent-mode))

;;add paredit for easier sexp navigation/manipulation
(use-package paredit
  :ensure t
  :init (add-hook 'clojure-mode-hook 'enable-paredit-mode))

;;add cider(connects clojure repl to buffer)
(use-package cider
  :ensure t)

;;add clj-refactor(provides refactoring support)
(use-package clj-refactor
  :ensure t)

;;set my todo-list as default buffer on startup
(setq
 org-default-notes-file "~/.emacs.d/todo-lists/daily-list.org"
 initial-buffer-choice org-default-notes-file)

;;---picked from Mrinal---
;; for html & css
(use-package web-mode
  :ensure t
  :defer t
  :mode
  ("\\.html?\\'" . web-mode)
  ("\\.css?\\'" . web-mode)
  :config
  (setq-default indent-tabs-mode nil)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-script-padding 0)
  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-auto-pairing nil)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-quoting t)
  (setq web-mode-auto-close-style 2)      ;;close after opening-tag
  (setq web-mode-auto-quote-style 2))     ;;use single-quotes for attributes(requires v15)
