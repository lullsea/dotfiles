;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Lull"
      user-mail-address "lullseapoint@gmail.com")

(setq doom-font (font-spec :family "Source Code Pro" :size 14)
      doom-variable-pitch-font (font-spec :family "Source Code Pro" :size 15)
      doom-big-font (font-spec :family "Source Code Pro" :size 18)
      )
(setq doom-theme 'doom-tomorrow-night)

(after! doom-theme
  doom-themes-enable-bold t
  doom-themes-enable-italic t)

(setq display-line-numbers-type t)


;; startup
(after! centaur-tabs
  (setq centaur-tabs-style "wave"))

;; org mode
(setq org-directory "~/org/")
(after! org

  (setq org-return-follows-link t
        org-use-speed-commands t
        org-deadline-warning-days 30
        org-agenda-tags-column 75)

  (setq org-capture-templates
        '(("t" "Todo" entry (file "~/org/agenda/refile.org")
           "* TODO %?\n  %i\n")

          ("d" "Done" entry (file "~/org/agenda/refile.org")
           "* DONE %?\n  %i\n")
          ))

  (setq org-agenda-files '("~/org/agenda"))
  (setq org-archive-location '("~/org/archive"))

  (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))

  (setq org-todo-keywords
        '((sequence "TODO(t)" "INPROG(i)" "PROJ(p)" "STORY(s)" "WAIT(w)" "|" "DONE(d)" "KILL(k)")
          (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)"))

        org-todo-state-tags-triggers
        '(("KILL" ("killed" . t))
          ("WAIT" ("waiting" . nil))
          ("INPROG" ("inprog" . nil))
          (done ("waiting") ("hold"))
          ("TODO" ("waiting") ("cancelled") ("hold"))
          ("NEXT" ("waiting") ("cancelled") ("hold"))
          ("DONE" ("waiting") ("cancelled") ("hold")))

        )

  (setq org-agenda-start-with-log-mode t
        org-log-into-drawer t
        org-cycle-emulate-tab nil
        org-startup-folded 'content)

  (add-hook 'org-mode-hook 'org-appear-mode)
  (setq org-appear-autoemphasis t
        org-appear-autolinks t
        org-appear-autosubmarkers t))

(setq org-super-agenda-groups
      '((:log t)  ; Automatically named "Log"
        (:name "Trello"
         :tag "buffer"
         :order 0)
        (:name "In Progress"
         :tag "inprog"
         :order 1)
        (:name "Pending Review"
         :tag "review"
         :order 2)
        (:name "Schedule"
         :time-grid t
         :order 4)
        (:name "Today"
         :scheduled today
         :order 5)
        (:habit t)
        (:name "Due today"
         :deadline today
         :order 6)
        (:name "Overdue"
         :deadline past
         :order 7)
        (:name "Due soon"
         :deadline future
         :order 8)
        (:name "Unimportant"
         :todo ("SOMEDAY" "MAYBE" "CHECK" "TO-READ" "TO-WATCH")
         :order 100)
        (:name "Waiting..."
         :todo "WAITING"
         :order 98)
        )
      )
(setq org-superstar-headline-bullets-list
  '(
    "❂"
    "◈"
    "◌"
    "▶") ;; "?" "??" "?" "?"
    )
(setq org-superstar-item-bullet-alist '((?* . ?*)
                                        (?+ . ?▷)
                                        (?- . ?●)))
(setq org-ellipsis " ▼")

(add-hook `org-agenda-mode-hook `org-super-agenda-mode)

(beacon-mode 1)

;; Key bindings
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c l") #'org-agenda-list)

(global-set-key (kbd "C-c z") #'+zen/toggle)
(global-set-key (kbd "C-c f") #'+format/buffer)
(global-set-key (kbd "C-c F") #'focus-mode)


(global-set-key (kbd "C-c l") #'org-agenda-list)

(global-set-key (kbd "<f9>") #'eshell)
(global-set-key (kbd "<f8>") #'neotree)

(defun emacs-startup-screen ()
  "Display the weekly org-agenda and all todos."
  (org-agenda nil "n"))

;(add-hook 'emacs-startup-hook #'emacs-startup-screen)


(add-hook 'javascript-mode 'html-mode)
