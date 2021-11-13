(defun ncdulo/-scroll-percentage ()
  "Return a float representing how far down the current window is scrolled."
  (/ (float (line-number-at-pos (window-start)))
     (float (line-number-at-pos (point-max)))))

(defun ncdulo/-set-window-start-to-percentage (scroll-percentage)
  "Scroll the current window down by SCROLL-PERCENTAGE."
  (goto-char (point-min))
  (let ((target-line-number
         (truncate (* (line-number-at-pos (point-max)) scroll-percentage))))
    (forward-line (1- target-line-number)))
  (set-window-start nil (point)))

(defun ncdulo/-render-rst-preview-current-buffer ()
  (message "Rendering rST preview of %s" buffer-file-name)
  (let ((url (concat "file://" buffer-file-name)))
    (shell-command-on-region (point-min) (point-max)
                             "~/opt/anaconda3/bin/rst2html.py" "*Preview rST Output*")
    (switch-to-buffer-other-window "*Preview rST Output*")
    (let ((document (libxml-parse-html-region (point) (point-max))))
      (erase-buffer)
      (shr-insert-document `(base ((href . ,url)) ,document))
      (setq buffer-read-only t))))

(defun ncdulo/-preview-rst-file (filename)
  (save-selected-window
    (find-file filename)
    (let ((scroll-percentage (ncdulo/-scroll-percentage)))
      (ncdulo/-render-rst-preview-current-buffer)
      (ncdulo/-set-window-start-to-percentage scroll-percentage))))

(defun ncdulo/preview-rst (&optional filename)
  "Render a rST preview of FILENAME (by default, the current file) \
to HTML and display it with `shr-insert-document'."
  (interactive "fFile: ")
  (if filename
      (progn
        (ncdulo/-preview-rst-file filename)
        (switch-to-buffer (current-buffer)))
    (ncdulo/-preview-rst-file buffer-file-name)))

(add-hook 'rst-mode-hook
          (lambda ()
            (add-hook 'after-save-hook #'ncdulo/preview-rst nil t)))

(provide 'preview-rst)
