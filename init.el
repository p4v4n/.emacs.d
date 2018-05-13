;; BASIC CUSTOMIZATION

;;-------packages-----------

(require 'package)

;;add more repositories to fetch-archive list
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

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

;; Move custom-config to a seperate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
;;----------------------------------
;;set my todo-list as default buffer on startup if it exists
(if (file-exists-p "~/.emacs.d/todo-lists/daily-list.org")
    (setq initial-buffer-choice "~/.emacs.d/todo-lists/daily-list.org"))
;;---------------

;;load all customizations from myinit.org
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

;;------------

;;set default-browser to chromium
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium-browser")
