# markdown-paste-image
Enable pasting image in markdown mode for emacs. Only in windows.

Just put this in emacs load path and:
``` elisp
(require 'markdown-paste-image)
;; to use 'C-c v' to invoke pasting, uncomment next line;
;; (markdown-paste-image-keyset) 
```
If you use `use-package`:
``` elisp
(use-package markdown-paste-image
  :config
  (markdown-paste-image-setkey)
  )
``` 

Powershell is used to save clipboard to file, you may have to `Set-ExecutionPolicy Unrestricted` to allow it to run script.

When file name is not given, `(format-time-string "%s")` is used as file name. 

`./img` folder is used to save the image files by default. It can be configured with `clipboard-to-image-prefix`.
