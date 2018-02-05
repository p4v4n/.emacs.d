;; BASIC CUSTOMIZATION

;;hide the start-up message
(setq inhibit-startup-message t)

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

;; don't blink cursor
(blink-cursor-mode 0)

;;show file-size in chars
(size-indication-mode t)
