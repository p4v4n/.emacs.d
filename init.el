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

;;highlight matching parentheis
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
