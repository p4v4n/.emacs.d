;; Personal Customizations


;; Load the htdp-design-recipe file with M-x [space] htdp
(defun user-load-htdp-recipe ()
  "loads htdp-recipe.org file."
  (interactive)
  (let ((htdp-file "~/.emacs.d/org-notes/htdp-recipe.org"))
    (if (file-exists-p htdp-file)
        (save-selected-window (find-file-read-only-other-window htdp-file))
      (message "the recipe file does not exist."))))


;; Move to previous-window (bound to C-x p)
(defun other-window-backward (&optional n)
  "Select the nth previous window"
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))

(global-set-key "\C-xp" 'other-window-backward)
