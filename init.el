;; Essential settings.
(setq initial-scratch-message "") ;; disable messaging on scratch pad
(setq visible-bell nil) ;; get rid of bells
(setq ring-bell-function 'ignore) ;; get rid of bells

(global-hl-line-mode 1) ;; to show cursor
(global-linum-mode t) ;; to show line numbers
(column-number-mode t) ;; show column number

(set-default 'truncate-lines t) ;; no wrap

;;(menu-bar-mode -1) ;; disable menu for GUI
;; (tool-bar-mode -1) ;; disable tool bar
;; turn off toolbar
(if window-system (tool-bar-mode 0))
(show-paren-mode 1) ;; show matching parenthesis 
(winner-mode t) ;; quickly move between buffers

;; disable splash screen
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; disable scroll bar
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

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

; list the packages you want
(setq package-list
    '(
        git-timemachine web-mode ivy swiper-helm counsel swiper
        eshell-git-prompt git-gutter ox-reveal org-bullets evil-magit
        switch-window exec-path-from-shell 
	ggtags which-key ace-jump-mode multiple-cursors 
	material-theme json-mode atom-dark-theme 
	org helm-ls-git multi-term java-imports java-snippets 
	javadoc-lookup jdecomp thread-dump web-beautify 
	colemak-evil helm-ag projectile helm-fuzzy-find magit 
	all-the-icons neotree airline-themes zenburn-theme helm 
	evil-visual-mark-mode helm-projectile auto-complete dakrone-theme
      )
)

(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
    (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
    (unless (package-installed-p package)
	      (package-install package)))

;; added by emacs - START
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(neo-window-fixed-size nil)
 '(package-selected-packages
   (quote
    (git-timemachine web-mode ivy swiper-helm counsel swiper eshell-git-prompt git-gutter ox-reveal org-bullets evil-magit switch-window exec-path-from-shell ggtags which-key ace-jump-mode multiple-cursors material-theme json-mode atom-dark-theme org helm-ls-git multi-term java-imports java-snippets javadoc-lookup jdecomp thread-dump web-beautify colemak-evil helm-ag projectile helm-fuzzy-find magit all-the-icons neotree airline-themes zenburn-theme helm use-package evil-visual-mark-mode)))
 '(projectile-enable-caching t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil : background "#3F3F3F" :foreground "#DCDCCC" : inverse-video nil :box nil :strike-through nil : overline nil :underline nil :slant normal : weight normal :height 140 :width normal : foundry "nil" :family "Meslo LG S DZ for Powerline")))))
;; added by emacs - END

;; evil mode to get VIM bindings
(require 'evil)
(evil-mode 1)

;; refreshing packages and contents
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq-default left-fringe-width nil)
(setq-default indicate-empty-lines t)
(setq-default indent-tabs-mode nil)
(eval-after-load "vc" '(setq vc-handled-backends nil))
(setq vc-follow-symlinks t)
(setq large-file-warning-threshold nil)
(setq split-width-threshold nil)
(setq custom-safe-themes t)
(setq tab-width 4)

;; helm settings
(require 'helm-fuzzy-find)
(require 'helm-config)
(require 'helm-ls-git)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-d") 'helm-browse-project)
(global-set-key (kbd "C-x f") 'helm-multi-files)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-c h g") 'helm-google-suggest)
(helm-mode 1)

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


;; Theme
(load-theme 'material t)
;;(load-theme 'zenburn t)
;;(load-theme 'wombat t)

;; airline themes
(require 'airline-themes)
;;(load-theme 'airline-light)
(load-theme 'airline-wombat)
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
(setq recentf-auto-cleanup 'never)

;; magit settings
(global-set-key (kbd "C-x g") 'magit-status)

;; Projectile settings
(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
;; start projectile from in any directory
;; (setq projectile-require-project-root nil)

;;autocomplete settings
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; shell settings
(require 'multi-term)
(setq multi-term-program "/bin/zsh")

;; org mode settings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(add-hook 'org-mode-hook (lambda () (linum-mode 0)))
;; org mode bullets
(require 'org-bullets)
(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; org mode presentations
(require 'ox-reveal)
;;(setq org-reveal-root "file:///~/Documents/reveal.js")
(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")

;; utf-8 settings
;; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(setq utf-translate-cjk-mode nil)

(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)

;; set the default encoding system
(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp buffer-file-coding-system)
    (setq buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; Java settings
(global-set-key (kbd "C-h j") 'javadoc-lookup)

;; ditaa mode
(org-babel-do-load-languages
 'org-babel-load-languages '(
        (python . t)
        (ditaa . t))
)
(eval-after-load "artist"
   '(define-key artist-mode-map [(down-mouse-3)] 'artist-mouse-choose-operation)
   )
(setq org-ditaa-jar-path "/Users/rchint1/Documents/ditaa/ditaa0_9.jar")


;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; jump mode
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
;;If you use evil
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

;; which key
(require 'which-key)
(which-key-mode)

;; gtags settings
(use-package ggtags
  :init
  (setenv "GTAGSLABEL" "ctags")
  (push "GTAGS not found" debug-ignored-errors)

  :ensure t
  :config
  (define-key ggtags-mode-map (kbd "C-c g d") 'ggtags-find-definition)
  (define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
  (define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
  (define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
  (define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
  (define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
  (define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags))
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))
(with-eval-after-load 'ggtags
    (evil-make-overriding-map ggtags-mode-map)

    ;; force update evil keymaps after ggtags-mode loaded
    (add-hook 'ggtags-mode-hook #'evil-normalize-keymaps))

;; to have PATH varaibles in UI
(exec-path-from-shell-initialize)

;; undo tree mode
(global-undo-tree-mode) 
(global-set-key (kbd "M-/") 'undo-tree-visualize)

;; switch window
(require 'switch-window)
(global-set-key (kbd "C-M-z") 'switch-window)

;; Change windows settings
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x |") 'toggle-window-split)

;; git gutter
(global-git-gutter-mode +1)
(global-set-key (kbd "C-x C-g") 'git-gutter)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)
;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)
;; Mark current hunk
(global-set-key (kbd "C-x v SPC") #'git-gutter:mark-hunk)

;; eshell settings
(eshell-git-prompt-use-theme 'powerline)

;; Ivy, Counsel, Swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-load-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c C-g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)

;; web mode
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))

;; disable evil on git time machine
(eval-after-load 'git-timemachine
  '(progn
     (evil-make-overriding-map git-timemachine-mode-map 'normal)
     ;; force update evil keymaps after git-timemachine-mode loaded
     (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps)))
