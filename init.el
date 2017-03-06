;; disable messaging on scratch pad
(setq initial-scratch-message "")
;; get rid of bells
(setq visible-bell nil)             
(setq ring-bell-function 'ignore)
;; to show cursor
(global-hl-line-mode 1) 
;; to show line numbers
(global-linum-mode t) 
;; no wrap
(set-default 'truncate-lines t) 
;; Leave this here, or package.el will just add it again.
(package-initialize)
;; start package 
(require 'package)
;; dont activate packages on start up
(setq package-enable-at-startup nil)
;; including package archives
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

;; added by emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(neo-window-fixed-size nil)
 '(package-selected-packages
   (quote
    (multi-term java-imports java-snippets javadoc-lookup jdecomp jdee jtags thread-dump web-beautify colemak-evil helm-ag projectile helm-fuzzy-find magit all-the-icons neotree airline-themes zenburn-theme helm use-package evil-visual-mark-mode)))
 '(projectile-enable-caching t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil : background "#3F3F3F" :foreground "#DCDCCC" : inverse-video nil :box nil :strike-through nil : overline nil :underline nil :slant normal : weight normal :height 140 :width normal : foundry "nil" :family "Meslo LG S DZ for Powerline")))))

;; evil mode to get VIM bindings
(require 'evil)
(evil-mode 1)

;; refreshing packages and contents
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; Essential settings.
;; disable splash screen
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
;; disable menu for GUI
(menu-bar-mode -1)
;; disable tool bar
(tool-bar-mode -1)
;; disable scroll bar
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
;; show matching parenthesis 
(show-paren-mode 1)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq-default left-fringe-width nil)
(setq-default indicate-empty-lines t)
(setq-default indent-tabs-mode nil)
(eval-after-load "vc" '(setq vc-handled-backends nil))
(setq vc-follow-symlinks t)
(setq large-file-warning-threshold nil)
(setq split-width-threshold nil)
(setq custom-safe-themes t)
(column-number-mode t)
(setq tab-width 4)

(use-package helm
  :ensure t
  :diminish helm-mode
  :commands helm-mode
  :config
  (helm-mode 1)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40)
  (define-key helm-map (kbd "S-SPC") 'helm-toggle-visible-mark)
  (define-key helm-find-files-map (kbd "C-k") 'helm-find-files-up-one-level))

(use-package dired
  :config
  (require 'dired-x)
  (setq dired-omit-files "^\\.?#\\|^\\.[^.].*")

  (defun air-dired-buffer-dir-or-home ()
    "Open dired to the current buffer's dir, or $HOME."
    (interactive)
    (let ((cwd (or (file-name-directory (or (buffer-file-name) ""))
                   (expand-file-name "~"))))
      (dired cwd)))

  (add-hook 'dired-mode-hook (lambda ()
                               (dired-omit-mode t)))
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  (define-key dired-mode-map (kbd "^")   (lambda () (interactive) (find-alternate-file "..")))
  (define-key dired-mode-map (kbd "C-.") 'dired-omit-mode)
  (define-key dired-mode-map (kbd "c")   'find-file)
  (define-key dired-mode-map (kbd "/")   'evil-search-forward)
  (define-key dired-mode-map (kbd "?")   'evil-search-backward))

(global-set-key (kbd "C-c h") 'helm-command-prefix)

;; To have Zenburn theme
(load-theme 'zenburn t)
;; airline themes
(require 'airline-themes)
(load-theme 'airline-light)
(setq powerline-utf-8-separator-left        #xe0b0
      powerline-utf-8-separator-right       #xe0b2
      airline-utf-glyph-separator-left      #xe0b0
      airline-utf-glyph-separator-right     #xe0b2
      airline-utf-glyph-subseparator-left   #xe0b1
      airline-utf-glyph-subseparator-right  #xe0b3
      airline-utf-glyph-branch              #xe0a0
      airline-utf-glyph-readonly            #xe0a2
      airline-utf-glyph-linenumber          #xe0a1)

;; neo tree settings
(require 'neotree)
(global-set-key "\C-xt" 'neotree-toggle)
(global-set-key "\C-xT" 'neotree-find)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-smart-open t)
(put 'dired-find-alternate-file 'disabled nil)

;; recent file settings
(require 'recentf)
(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files)
(setq recentf-auto-cleanup 'never)

;; magit settings
(global-set-key (kbd "C-x g") 'magit-status)
(require 'helm-fuzzy-find)

;; Projectile settings
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;;autocomplete settings
(require 'auto-complete)

;; shell settings
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
