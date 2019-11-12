;; globally show line numbers
(global-linum-mode 1)
;; disable toolbar
(tool-bar-mode 0)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; shift-arrow navigation between windows
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; ido mode
(ido-mode 1)

;; show matching parens
(show-paren-mode 1)

;; don't blink cursor
(blink-cursor-mode 0)

;; desktop save mode
;;(desktop-save-mode 1)
;; clojure:
 
;; rainbow delimiters

;;
;;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; allow melpa installs
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; package list
(setq my-package-list '(exec-path-from-shell recentf projectile org-journal))
(mapc #'package-install my-package-list)

(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files)
(add-to-list 'exec-path "~/bin")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(inhibit-startup-screen t)
 '(org-journal-dir "/srv/vmdata/karma/proj/blog/")
 '(package-selected-packages
   (quote
    (org-journal auto-complete recentf projectile spacemacs-theme exec-path-from-shell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
