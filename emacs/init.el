;; -*- lexical-binding: t; -*-

;; UI
(setq inhibit-startup-screen t
      visible-bell -1
      history-length 25)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(recentf-mode 1)

(savehist-mode 1)
(save-place-mode 1)

;; set font
(set-face-attribute 'default nil :font "JetbrainsMonoMedium-12")
;; Prot: 
(let ((mono-spaced-font "Monospace")
      (proportionately-spaced-font "Sans"))
  (set-face-attribute 'default nil  :font "JetbrainsMonoMedium-12" :height 110)
  (set-face-attribute 'fixed-pitch nil :family mono-spaced-font :height 1.0)
  (set-face-attribute 'variable-pitch nil :family proportionately-spaced-font :height 1.0))

;; Prot: use idocn fonts
(use-package nerd-icons
  :ensure t)

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

; use Shift+arrows to move
(windmove-default-keybindings)

;; Prot: put all auto-generated configuration in separate file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-file-is-missing)

;; packages
(require 'package)

;; Add MELPA and other archives
(setq package-archives
      '(("elpa" . "https://elpa.gnu.org/packages/")
        ("elpa-devel" . "https://elpa.gnu.org/devel/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
(add-hook 'after-init-hook 'global-company-mode)
;;(global-company-mode)

;; Refresh package contents if needed
(unless package-archive-contents
  (package-refresh-contents))


;; Prot: Do not show compile/warnings buffer when installing package
(add-to-list 'display-buffer-alist
             '("\\`\\*\\(Warnings\\|Compile-Log\\)\\*\\'"
               (display-buffer-no-window)
               (allow-no-window . t)))
;; Prot: Delete selected text upon insertion
(use-package delsel
  :ensure nil ; no need to install it as it is built-in
  :hook (after-init . delete-selection-mode))

;; Prot: C-g
(defun prot/keyboard-quit-dwim ()
  "Do-What-I-Mean behaviour for a general `keyboard-quit'.

The generic `keyboard-quit' does not do the expected thing when
the minibuffer is open.  Whereas we want it to close the
minibuffer, even without explicitly focusing it.

The DWIM behaviour of this command is as follows:

- When the region is active, disable it.
- When a minibuffer is open, but not focused, close the minibuffer.
- When the Completions buffer is selected, close it.
- In every other case use the regular `keyboard-quit'."
  (interactive)
  (cond
   ((region-active-p)
    (keyboard-quit))
   ((derived-mode-p 'completion-list-mode)
    (delete-completion-window))
   ((> (minibuffer-depth) 0)
    (abort-recursive-edit))
   (t
    (keyboard-quit))))

(define-key global-map (kbd "C-g") #'prot/keyboard-quit-dwim)

;; try to enable vertico mode
;; https://systemcrafters.net/emacs-tips/streamline-completions-with-vertico/
(use-package vertico
  :ensure t
   :bind (:map vertico-map
         ("C-j" . vertico-next)
         ("C-k" . vertico-previous)
         ("C-f" . vertico-exit)
         :map minibuffer-local-map
         ("M-h" . backward-kill-word))
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
  :after vertico
  :ensure t
;;  :custom
;;  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))
;; 🤯 no ide
;;(marginalia-mode -1)

;;https://systemhalted.in/emacs/emacs-which-key/
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Prot: orderless - select with spaces and out of order
(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic))
  (setq completion-category-defaults nil)
  (setq completion-category-overrides nil))

;; Prot: corfu - popup for in-buffer completion

(use-package corfu
  :ensure t
  :hook (after-init . global-corfu-mode)
  :bind (:map corfu-map ("<tab>" . corfu-complete))
  :config
  (setq tab-always-indent 'complete)
  (setq corfu-preview-current nil)
  (setq corfu-min-width 30)

  (setq corfu-popupinfo-delay '(1.25 . 0.5))
  (corfu-popupinfo-mode 1) ; shows documentation after `corfu-popupinfo-delay'

  ;; Sort by input history (no need to modify `corfu-sort-function').
  (with-eval-after-load 'savehist
    (corfu-history-mode 1)
    (add-to-list 'savehist-additional-variables 'corfu-history)))

;; Prot: dired
(use-package dired
  :ensure nil
  :commands (dired)
  :hook
  ((dired-mode . dired-hide-details-mode)
   (dired-mode . hl-line-mode))
  :config
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t)
  (setq dired-dwim-target t))

;;;The dired-subtree package provides commands to quickly view the contents of a folder with the TAB key.

(use-package dired-subtree
  :ensure t
  :after dired
  :bind
  ( :map dired-mode-map
    ("<tab>" . dired-subtree-toggle)
    ("TAB" . dired-subtree-toggle)
    ("<backtab>" . dired-subtree-remove)
    ("S-TAB" . dired-subtree-remove))
  :config
  (setq dired-subtree-use-backgrounds nil))

;; Earlier we set up Dired to move deleted files to the system trash. The trashed package is then useful to provide a Dired-like interface for
;; that compartment (it works the same way as Dired, so check the video I share above).

(use-package trashed
  :ensure t
  :commands (trashed)
  :config
  (setq trashed-action-confirmer 'y-or-n-p)
  (setq trashed-use-header-line t)
  (setq trashed-sort-key '("Date deleted" . t))
  (setq trashed-date-format "%Y-%m-%d %H:%M:%S"))


(use-package ef-themes
  :ensure t
  :init
  ;; This makes the Modus commands listed below consider only the Ef
  ;; themes.  For an alternative that includes Modus and all
  ;; derivative themes (like Ef), enable the
  ;; `modus-themes-include-derivatives-mode' instead.
  (ef-themes-take-over-modus-themes-mode 1)
  ;;(modus-themes-include-derivatives-mode 1)
  :bind
  (("<f5>" . modus-themes-rotate)
   ("C-<f5>" . modus-themes-select)
   ("M-<f5>" . modus-themes-load-random))
  :config
  ;; All customisations here.
  (setq modus-themes-mixed-fonts t)
  (setq modus-themes-italic-constructs t)

  ;; Finally, load your theme of choice (or a random one with
  ;; `modus-themes-load-random', `modus-themes-load-random-dark',
  ;; `modus-themes-load-random-light').
  (modus-themes-load-theme 'ef-spring))

;; Org-mode loaded here
(load "~/.emacs.d/my-org-config.el")

;; load denote config)
(load "~/.emacs.d/my-denote-config.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(@ cider company-jedi corfu denote-journal dired-subtree ef-themes
       flycheck format-all go-tag godoctor gruvbox-theme java-snippets
       just-mode justl lsp-java lsp-javacomp lsp-ui magit marginalia
       markdown-ts-mode nerd-icons-completion nerd-icons-corfu
       nerd-icons-dired orderless org-journal ox-typst python-mode
       trashed typst-preview vertico))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
