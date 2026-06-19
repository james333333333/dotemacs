(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(setq inhibit-startup-screen t
      use-short-answers t
      ring-bell-function 'ignore
      auto-save-default nil
      make-backup-files nil
      create-lockfiles nil)

(setq-default indent-tabs-mode nil
              show-trailing-whitespace t
              fill-column 79)

(fido-mode)
(delete-selection-mode)
(column-number-mode)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(load-theme 'wombat)
(set-frame-font "monospace-13")

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(global-set-key (kbd "C-S-l") 'duplicate-line)
(global-set-key (kbd "C-S-j")
                (lambda ()
                  (interactive)
                  (delete-indentation -1)))

(use-package dired
  :config
  (setq-default dired-dwim-target t))

(use-package flyspell
  :custom
  (ispell-dictionary "en_AU")
  :hook
  (text-mode . flyspell-mode))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(use-package magit
  :ensure t)

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package auctex
  :ensure t
  :hook
  (LaTeX-mode . LaTeX-math-mode)
  :custom
  (TeX-view-program-selection '((output-pdf "Zathura")))
  (preview-scale-function 2.0))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode))

(use-package multiple-cursors
  :ensure t
  :bind
  ("C-<" . 'mc/mark-previous-like-this)
  ("C-c C-<" . 'mc/mark-all-like-this)
  ("C->" . 'mc/mark-next-like-this))
