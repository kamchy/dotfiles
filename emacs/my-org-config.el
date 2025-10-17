;; from https://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(require 'org)
(message "hello, my or config is loading...")
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(setq org-log-done t)

;; from crafters
(setq org-directory "~/Dokumenty/org-shared/org-files")
(setq org-agenda-files '("Tasks.org" "Birthdays.org" "Myśli.org" ))

;; If you only want to see the agenda for today
;; (setq org-agenda-span 'day)

(setq org-agenda-start-with-log-mode t)
;;(setq org-log-done 'time)
(setq org-log-into-drawer t)

(setq org-todo-keywords
      '((sequence "TODO(t!)" "|" "DONE(d)" "CANCELLED(c)")
        (sequence "GOAL(g)" "|" "ACCOMPLISHED(a)")
        (sequence "READ(r)" "|" "DONE(d)")
        (sequence "WATCH(W)" "|" "DONE(d)")
        ))
;; C-c C-c - insert tagl
(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l) ("outside" . ?o)))

(setq org-clock-out-when-done '("DONE"))

(setq org-capture-templates
      `(("t" "Todo" entry (file+headline ,(expand-file-name "Tasks.org" org-directory) "Inbox")
         "* TODO %?\n")
	("m" "Myśli" entry (file+headline ,(expand-file-name "Myśli.org" org-directory) "Myśli różne")
         "*%T  %^g\n%?") 
	))

(message "loaded!!")

;;https://www.reddit.com/r/emacs/comments/kpoiqi/how_to_follow_links_in_orgmode_without_using_mouse/
;; RETURN will follow links in org-mode files
(setq org-return-follows-link  t)
