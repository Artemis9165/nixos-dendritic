(require 'org)
(require 'ob-tangle)
(setq dotfiles-dir (expand-file-name "org/" user-emacs-directory))
(setq elpaca-config-file (expand-file-name "config/elpaca.org" dotfiles-dir))
(when (file-exists-p elpaca-config-file)
  (org-babel-load-file elpaca-config-file))
(let ((all-org-files (directory-files-recursively dotfiles-dir "\\.org$")))
  (mapc #'org-babel-load-file
        (remove elpaca-config-file all-org-files)))
