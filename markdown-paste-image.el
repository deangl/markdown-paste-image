
;;;
(defconst clip2img-path (file-name-directory load-file-name))
(defvar clipboard-to-image-prefix "./img/")

;;;;clip image
(defun tsc-clip2img (imgname)
  (let ((coding-system-for-read 'gbk)
        (coding-system-for-write 'gbk))
    (substring
     (shell-command-to-string
      (format "powershell %s\\clip2img.ps1 %s.png" clip2img-path imgname))
     0
     -1)))


(defun save-clipboard-to-image (image-name)
  "save clipboard to image"
  (if (not (file-directory-p clipboard-to-image-prefix)) (make-directory clipboard-to-image-prefix) )
  (let (
        (image-full-name
         (format
          "%s%s"
          clipboard-to-image-prefix
          (if (= (length image-name) 0)
              (format-time-string "%s")
            image-name))))
    (tsc-clip2img image-full-name)))

(defun md-paste-image (description tsc-filename)
  (interactive "sDescription of image:\nsFile name to save:")
  (let ((saved-file-name (save-clipboard-to-image tsc-filename)))
    (if (not (string= saved-file-name "0"))
        (insert
         ;; (concat "![" description "](" saved-file-name ")")
         (format "![%s](%s)" description saved-file-name)
         )
      (message "No picture in clipboard!"))))

(defun md-local-keys()
  (local-set-key (kbd "C-c v") 'md-paste-image)
  (local-unset-key (kbd "M-n"))
  (local-unset-key (kbd "M-p")))

(defun markdown-paste-image-setkey()
  (add-hook
   'markdown-mode-hook
   'md-local-keys
   ))

(provide 'markdown-paste-image)

;;; markdown-paste-image.el ends here
