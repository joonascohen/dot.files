(setq doom-font (font-spec :family "Aporetic Serif Mono" :size 16 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Iosevka Comfy Duo" :size 16 :weight 'medium)
      doom-big-font (font-spec :family "Aporetic Serif" :size 24 :weight 'bold))
;; (setq doom-font "Iosevka Term-14")
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

;; (setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'ef-duo-light)
;; (setq doom-theme 'gruvbox-dark-soft)
(setq doom-theme 'ef-duo-light)

(defvar my-current-theme nil
  "Stores the currently active theme for toggling.")

(defun my/my-toggle-theme ()
  "Toggle between two predefined themes. SET: leuven & leuvan dark"
  (interactive)
  (mapc #'disable-theme custom-enabled-themes) ; Disable all currently enabled themes
  (setq my-current-theme
        (if (eq my-current-theme 'ef-duo-light)
          'ef-duo-light
          'ef-duo-dark))
  (load-theme my-current-theme t)
  (message "Loaded theme: %s" my-current-theme))

;; (setq leuven-scale-org-agenda-structure nil)
;; (setq leuven-scale-org-document-title nil)
(setq leuven-scale-outline-headlines nil)
(setq leuven-dark-scale-outline-headlines nil)

(setq display-line-numbers-type 'nil)
(setq line-number-mode nil)

(set-frame-parameter nil 'alpha-background 80)  ;; 90 = 90% opaque, 10% transparent
(add-to-list 'default-frame-alist '(alpha-background . 80))

(setq display-buffer-alist
      '(
        ("\\*org-capture\\*"
         (display-buffer-reuse-mode-window
          display-buffer-below-selected)
         (window-height . fit-window-to-buffer)
         )))

(add-to-list 'display-buffer-alist
        '("\\magit:"
         (display-buffer-reuse-mode-window
          display-buffer-below-selected)
        (window-height . fit-window-to-buffer)
        (dedicated . t)))

(after! doom-modeline
  ;; Customize the display to show date and time
  (setq display-time-string-forms
        '((propertize
           (concat
            " 📅 " year "/" month "/" day   ; e.g., 06/05/2025
            " 🕘 " 24-hours ":" minutes)))) ; e.g., 20:22
  (display-time-mode 1))

(setq org-directory "~/org/")

;; (after! org
    ;; (setq org-todo-keywords
        ;; '((sequence "TODO" "WAIT" "|" "DONE" "CANCELED"))))

(setq org-hide-emphasis-markers t)

;; Org Roam - setup from System Crafters Youtube
(use-package org-roam
  :ensure t
  :custom
  (org-roam-completion-everywhere t)
  (org-roam-dailies-capture-templates
      '(("d" "default" entry "* %<%H:%M %p>: %?"
       :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))
  (org-roam-capture-templates
   '(("d" "default" plain
   "%?"
   :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
   :unnarrowed t)
     ("b" "book notes" plain
 "\n* Source\n\nAuthor: %^{Author}\nTitle: ${title}\nYear: %^{Year}\n\n* Summary\n\n%?"
 :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
 :unnarrowed t)
     ("l" "programming language" plain
    "* Characteristics\n\n- Family: %?\n- Inspired by: \n\n* Reference:\n\n"
    :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
    :unnarrowed t)
   ("W" "watch notes" plain
 "\n* Source\n\nMake: %^{Make}\nPrice: $${Price}\nPurchased: %^{Purchased}\n\n* Additional Notes\n\n%?"
 :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
 :unnarrowed t)
   ("D" "daily" plain
   "* TODO\n- [ ] %?"
   :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+date: %U\n")
   :unnarrowed t)
   ("w" "weather watching" plain
    "* Details\n* Radar\n* Warnings"
   :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+date: %U\n")
   :unnarrowed t)))
  :bind(("C-c n l" . org-roam-buffer-toggle)
        ("C-c n f" . org-roam-node-find)
        ("C-c n w" . org-agenda-week-view)
        ("C-c n t" . org-agenda-day-view)
        ("C-c n i" . org-roam-node-insert)
        ("C-c n d n" . org-roam-dailies-capture-today)
        ("C-c n d d" . org-roam-dailies-goto-today)
        ("C-c n d Y" . org-roam-dailies-capture-yesterday)
        ("C-c n d y" . org-roam-dailies-goto-yesterday)
        ("C-c n d T" . org-roam-dailies-capture-tomorrow)
        ("C-c n d t" . org-roam-dailies-goto-tomorrow)
        ("C-c n d c" . org-roam-dailies-goto-date)
        ("C-c n d v" . org-roam-dailies-capture-date)
        ("C-c n d b" . org-roam-dailies-goto-next-note)
        ("C-c n d f" . org-roam-dailies-goto-previous-note)
        :map org-mode-map
        ("C-c i" . completion-at-point))
  :config
  (require 'org-roam-dailies)
  (org-roam-db-autosync-mode)
  (org-roam-setup))

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(setq org-agenda-files '("~/org" "~/org-roam" "~/.config/doom"))

(setq org-roam-mode-sections
      (list #'org-roam-backlinks-section
            #'org-roam-reflinks-section
            ;; #'org-roam-unlinked-references-section
            ))
(add-hook 'org-roam-node-visit-post-hook #'org-roam-buffer-refresh)
(add-to-list 'display-buffer-alist
             '("\\*org-roam\\*"
               (display-buffer-in-side-window)
               (side . right)
               (slot . 0)
               (window-width . 0.33)
               (window-parameters . ((no-other-window . t)
                                     (no-delete-other-windows . t)))))

(after! org
  (add-to-list 'org-capture-templates '("e" "Eating"))
  (add-to-list 'org-capture-templates
      '("eo" "eating out" entry
        (file+olp+datetree "~/org/eating.org")
        "* %U %? :@eatingout:\n:PROPERTIES:\n:EATINGOUT: [X]\n:END:" :kill-buffer t))
  (add-to-list 'org-capture-templates
      '("eb" "breakfast" entry
        (file+olp+datetree "~/org/eating.org")
        "* %U %? :@breakfast:\n:PROPERTIES:\n:BREAKFAST: [X]\n:END:" :kill-buffer t))
  (add-to-list 'org-capture-templates
      '("el" "lunch" entry
        (file+olp+datetree "~/org/eating.org")
        "* %U %? :@lunch:\n:PROPERTIES:\n:LUNCH: [X]\n:END:" :kill-buffer t))
  (add-to-list 'org-capture-templates
      '("ed" "dinner" entry
        (file+olp+datetree "~/org/eating.org")
        "* %U %? :@dinner:\n:PROPERTIES:\n:DINNER: [X]\n:END:" :kill-buffer t))
  (add-to-list 'org-capture-templates
      '("es" "snacking" entry
        (file+olp+datetree "~/org/eating.org")
        "* %U %? :@snack:\n:PROPERTIES:\n:SNACK: [X]\n:END:" :kill-buffer t))
  (add-to-list 'org-capture-templates
      '("eS" "Shopping" entry
        (file+olp+datetree "~/org/eating.org")
        "* %U %? :@shopping:\n:PROPERTIES:\n:SHOPPING: %^{What store?|%?|Staters|Sprouts}\n:END:" :kill-buffer t))
  (add-to-list 'org-capture-templates '("W" "Weather Watching"))
  (add-to-list 'org-capture-templates
      '("WW" "weather entry" entry
        (file+olp+datetree "~/org/weatherwatching.org")
        "* %U %?\n:PROPERTIES:\n:RAIN: %^{Rain?||[X]|}\n:TORNADO: %^{Tornado?||[X]}\n:HURRICANE: %^{Hurricane?||[X]}\n:END:":kill-buffer t))
  (add-to-list 'org-capture-templates '("k" "Mineral King"))
  (add-to-list 'org-capture-templates
      '("km" "Mineral Meeting" entry
        (file+headline "~/org/mk.org" "Meetings")
        "* TODO %^{Enter Mineral King Meeting: }\n SCHEDULED: %^t\n" :kill-buffer t))
  (add-to-list 'org-capture-templates
      '("kt" "Mineral Task" entry
        (file+headline "~/org/mk.org" "Tasks")
        "* TODO %^{Enter Mineral King Meeting: }\n SCHEDULED: %^t\n" :kill-buffer t))
  (add-to-list 'org-capture-templates
      '("kg" "Gig" entry
        (file+headline "~/org/mk.org" "Gigs and Events")
        "* TODO %^{Enter Mineral King Gig: }\n SCHEDULED: %^t\n" :kill-buffer t))
  (add-to-list 'org-capture-templates '("w" "Work"))
  (add-to-list 'org-capture-templates
      '("ww" "work entry" entry
        (file+datetree "~/org/work-log.org")
        "* %U %?\n%i\n%a" :kill-buffer t))
  (add-to-list 'org-capture-templates
      '("wt" "work task" entry
        (file+headline "~/org/worktasks.org" "Tasks")
        "* TODO %?\n SCHEDULED: %^t\n%i\n%a" :kill-buffer t))
  (add-to-list 'org-capture-templates
        '("wm" "Meeting" entry
          (file+olp+datetree "~/org/work-log.org")
          "* %U %^{What meeting?|%?|CRQ Meeting|SysOps Call|Joel One-on-One|RDM Weekly Agenda Touchbase|Bofa Team Discussion|RDM Team Briefings|SysOps TAR|MPS Card Readers - SOP} :@meeting: \n** Attendees\n-\n** Meetings Notes   :@note:\n-\n** Next Steps\n\n"
          :clock-in t :clock-resume t :jump-to-captured t)))

;; bold headers
(custom-set-faces!
  '(org-level-1 :inherit outline-1 :weight bold)
  '(org-level-2 :inherit outline-2 :weight bold)
  '(org-level-3 :inherit outline-3 :weight bold)
  '(org-level-4 :inherit outline-4 :weight bold))

(custom-set-faces!
  '(org-agenda-date :weight bold)
  '(org-agenda-date-today :weight bold)
  '(org-agenda-structure :weight bold)
  '(org-agenda-done :weight bold)
  '(org-agenda-todo :weight bold))

(custom-theme-set-faces
 'user
;; '(org-level-1 ((t (:height 1.25 :weight bold))))
;; '(org-level-2 ((t (:height 1.15 :weight bold))))
;; '(org-level-3 ((t (:height 1.1 :weight bold))))
;; '(org-level-4 ((t (:height 1.05 :weight bold))))
 '(org-document-title ((t (:height 1.5 :weight bold)))))

(setq org-agenda-start-with-log-mode 't)

(setq org-log-done 'time)

(setq org-M-RET-may-split-line '((default . nil)))
(setq org-insert-heading-respect-content t)
(setq org-log-into-drawer t)
(after! org
    (use-package org-super-agenda
    :ensure t
    :after org-agenda
    :init
    (setq org-agenda-skip-scheduled-if-done nil
        org-agenda-skip-deadline-if-done nil
        org-agenda-include-deadlines t
        org-agenda-block-separator nil
        org-agenda-compact-blocks t
        org-agenda-start-day nil ;; i.e. today
        org-deadline-warning-days 7
        org-agenda-start-on-weekday nil)
    (setq org-agenda-custom-commands
            '(("d" "Simple day view"
            ((agenda "" ((org-agenda-overriding-header "")
                            (org-agenda-span 1)
                            (org-super-agenda-groups
                            '((:name "Overdue"
                               :scheduled past
                               :face error)
                              (:name "💵 Bills"
                                :tag "bills")
                              (:name "🗓 Today"
                                    :time-grid t
                                    :date today
                                    :order 2)
                            (:name "Configuration"
                                    :tag "config"
                                    :order 2)
                            (:name "Done"
                                    :todo "DONE"
                                    :order 4)
                            (:discard (:anything))))))))
            ("w" "work view"
                ((tags-todo "@work"
                ((org-agenda-overriding-header "Work Stuff")
                    (org-super-agenda-groups
                    '((:name "Tasks"
                        :tag "@work")))))
                (tags-todo "@meeting"
                ((org-agenda-overriding-header "")
                    (org-super-agenda-groups
                    '((:name "Meetings"
                    :tag "@meeting")))))))
            ("i" "inbox"
            ((tags-todo "inbox"
                        ((org-agenda-overriding-header "Inbox")))))
            ("t" "to start"
            ((tags-todo "+@planning"
                        ((org-agenda-overriding-header "planning")))
            (tags-todo "-{.*}"
                        ((org-agenda-overriding-header "untagged tasks")))))
            ("p" "personal view"
                ((tags-todo "journaling"
                ((org-agenda-overriding-header "personal Stuff")
                    (org-super-agenda-groups
                    '((:name "writing"
                        :tag "journaling")))))
                (tags-todo "reading"
                ((org-agenda-overriding-header "")
                    (org-super-agenda-groups
                    '((:name "reading"
                    :tag "reading")))))
                (tags-todo "certifications"
                ((org-agenda-overriding-header "")
                    (org-super-agenda-groups
                    '((:name "certifications"
                    :tag "certifications")))))
                (tags-todo "trips"
                ((org-agenda-overriding-header "")
                    (org-super-agenda-groups
                    '((:name "trips"
                    :tag "trips")))))
                (tags-todo "@moving"
                ((org-agenda-overriding-header "" )
                    (org-super-agenda-groups
                    '((:name "moving"
                    :tag "@moving")))))))
            ("o" "Overdue tasks"
                    agenda ""
                    ((org-super-agenda-groups
                    '((:name "Overdue"
                                :and (:not (:todo "DONE")
                                        (:scheduled past))
                                :and (:not (:todo "DONE")
                                        (:deadline past)))))))
            ("q" "My QL Agenda"
                ((org-ql-block
                '(and (or (ts-active :on today)
                            (deadline auto)
                            (scheduled :to today))
                        (not (done)))
                ((org-ql-block-header "My Agenda View")
                (org-super-agenda-groups
                    '((:name "Bills" :tag "bills" :date today)
                    (:todo ("STRT" "WAIT" "CHECK" "TO-WATCH" "WATCHING") :order 7)
                    (:name "Personal" :habit t :tag "personal" :order 3)
                    (:name "Work" :tag ("@work" "@meeting" "@crq"))
                    (:todo "WAIT" :order 6)
                    (:priority "A" :order 1)
                    (:priority "B" :order 2)
                    (:priority "C" :order 2)))))))
            ("W" "Moving Tasks"
            ((org-ql-block
                '(and (tags "@moving") (not (done)))
                ((org-ql-block-header "Moving to Washington")
                (org-super-agenda-groups
                '(
                    (:name "❗High Priority" :priority "A")
                    (:name "Next Priority" :priority "B")
                    (:name "🗑Trash" :tag "@trash")
                    (:name "💸Selling" :tag "@sell")
                    (:name "📦Packing in U-box" :tag "@taking")
                    (:name "📦Packing in Car" :tag "@cars")
                    (:name "Giving away" :tag "@give")
                    (:name "✔Washington Tasks" :tag "@moving")
                    ;; Add more groups here if needed
                    (:discard (:anything t))))))))
            ("R" "Grouped by REQUESTS property"
            ((org-ql-block
                '(property "REQUESTS")
                ((org-ql-block-header "Tasks with REQUESTS property")
                (org-super-agenda-group-property-name "REQUESTS")
                (org-super-agenda-groups
                '((:auto-group t)))))))))
    :config
    (org-super-agenda-mode)))

(setq org-agenda-todo-ignore-scheduled 'future)

(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-timestamp-if-done t)
(setq org-agenda-skip-function-global
      '(org-agenda-skip-entry-if 'todo 'done))



(setq org-tag-alist
      '(
        ("@work" . ?w)
        ("@meeting" . ?m)
        ("@band" . ?b)
        ("@planning" . ?p)
        ("@reading" . ?r)
        ("@family" . ?f)
        ("@crq" . ?c)
        ("@wo" . ?W)
        ))

(setq org-habit-graph-column 60)

(setq org-export-with-broken-links t)

(defun org-columns-switch-columns ()
  (interactive)
  (save-excursion
    (org-columns-goto-top-level)
    (re-search-forward ":PROPERTIES:")
    (let* ((folded-p (org-fold-folded-p))
           (beg (re-search-forward ":COLUMNS:"))
           (end (re-search-forward ":END:"))
           (num-of-columns (count-matches ":COLUMNS:" beg end)))
      (when folded-p
        (org-fold-hide-drawer-toggle))
      (goto-char beg)
      (dotimes (_ num-of-columns)
        (org-metadown))
      (re-search-backward ":PROPERTIES:")
      (when folded-p
        (org-fold-hide-drawer-toggle))
      (org-columns))))

(with-eval-after-load 'org-colview
  (org-defkey org-columns-map "x" #'org-columns-switch-columns))

(defun my/org-columns-get-format (&optional fmt-string)
  "Return columns format specifications.
When optional argument FMT-STRING is non-nil, use it as the
current specifications.  This function also sets
`org-columns-current-fmt-compiled' and
`org-columns-current-fmt'."
  (interactive)
  (let ((format
         (or fmt-string
             (progn
               (save-excursion (re-search-forward ":COLUMNS:\\s-*.*" nil t)
                               (replace-regexp-in-string ":COLUMNS:\\s-*" ""
                                                         (buffer-substring-no-properties
                                                          (line-beginning-position) (line-end-position)))))
             (org-with-wide-buffer
              (goto-char (point-min))
              (catch :found
                (let ((case-fold-search t))
                  (while (re-search-forward "^[ \t]*#\\+COLUMNS: .+$" nil t)
                    (let ((element (org-element-at-point)))
                      (when (org-element-type-p element 'keyword)
                        (throw :found (org-element-property :value element)))))
                  nil)))
             org-columns-default-format)))
    (setq org-columns-current-fmt format)
    (org-columns-compile-format format)
    format))

(with-eval-after-load 'org
  (advice-add 'org-columns-get-format :override 'my/org-columns-get-format))

(setq org-agenda-time-grid
      '((daily today require-timed)
        (600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2100 2200)
        "......" "----------------"))

(global-set-key (kbd "C-c C-l") 'org-store-link)
(global-set-key (kbd "C-c C-c") 'org-capture)
(global-set-key (kbd "C-d") 'org-agenda-day-view)
(global-set-key (kbd "C-w") 'org-agenda-week-view)
(global-set-key (kbd "C-c C-a") 'org-ql-search)
(global-set-key (kbd "C-x w") 'elfeed)
(global-set-key (kbd "C-c b") 'org-mark-ring-goto)
(global-set-key (kbd "C-c i") 'org-download-clipboard)
(global-set-key (kbd "C-c m") 'elfeed-tube-mpv)
(global-set-key (kbd "C-c C-g") 'consult-grep)
(global-set-key (kbd "C-.") 'embark-act)

;; unbinding embark
(map! :leader
      :desc "unmapping embark-act" "a" nil)

;; hydra
(map! :leader
 (:prefix "w"
  :desc "Hydra resize" :n "SPC" #'doom-window-resize-hydra/body))

(after! org
    (map! :leader
        :desc "toggle themes" "t t" #'my/my-toggle-theme)
    (map! :leader
        :desc "toggle themes" "t h" #'doric-themes-toggle)
    (map! :leader
        :desc "toggle themes" "t o" #'modus-themes-toggle)
    (map! :leader
        :desc "Variable Pitch mode" "p m" #'variable-pitch-mode)
    (map! :leader
        :desc "Olivetti mode" "o m" #'olivetti-mode)
    (map! :leader
        :desc "QL Agenda Search" "f a" #'org-ql-find-in-agenda)
    (map! :leader
        :desc "Consult find" "c l" #'consult-line)
    (map! :leader
        :desc "Org QL open link" "o l" #'org-ql-open-link)
    (map! :leader
        :desc "Org Agenda" "a" #'org-agenda))

(set-register ?w (cons 'file "~/org/work-log.org"))

(display-line-numbers-mode nil)
(add-hook 'org-mode-hook #'doom-disable-line-numbers-h)
(add-hook 'org-mode-hook (lambda () (display-line-numbers-mode 0)))

(setq vi-tilde-fringe-mode nil)
(remove-hook 'org-mode-hook #'vi-tilde-fringe-mode)
(add-hook 'org-mode-hook (lambda () (set-fringe-mode 0)))

(setq org-agenda-include-diary t)
(setq diary-file "~/org/diary.org")
(setq calendar-view-diary-initially-flag t
      diary-number-of-entries 7
      diary-display-function #'diary-fancy-display)
(add-hook 'calendar-today-visible-hook 'calendar-mark-today)

(add-hook 'org-mode-hook
          (lambda ()
            (setq-local text-mode-ispell-word-completion t)))

(setq calendar-date-style 'iso)
(setq calendar-mark-diary-entries-flag t)
(setq calendar-week-start-day 1)

(use-package consult-org-roam
  :bind(("C-c o" . consult-org-roam-search ))
  )

(require 'org-download)

;; (require 'elfeed)

(setq elfeed-feeds
      '(("http://www.spc.noaa.gov/products/spcrss.xml" weather)
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCcaTUtGzOiS4cqrgtcsHYWg"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA"
        ("https://protesilaos.com/master.xml" protesilaoshttps://protesilaos.com/master.xml)))

(use-package elfeed
	:defer t)
(use-package elfeed-org
  :after (elfeed)
  :config
  (elfeed-org)
  (setq elfeed-show-entry-switch 'display-buffer)
  (setq rmh-elfeed-org-files (list "~/org/elfeed.org")))
;; !! Change this to your elfeed.org file !!

(use-package elfeed-tube
  :ensure t ;; or :straight t
  :after elfeed
  :demand t
  :config
  ;; (setq elfeed-tube-auto-save-p nil) ; default value
  ;; (setq elfeed-tube-auto-fetch-p t)  ; default value
  (elfeed-tube-setup)

  :bind (:map elfeed-show-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)
         :map elfeed-search-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)))
(use-package elfeed-tube-mpv
  :ensure t ;; or :straight t
  :bind (:map elfeed-show-mode-map
              ("C-c C-f" . elfeed-tube-mpv-follow-mode)
              ("C-c C-w" . elfeed-tube-mpv-where)))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-mode t)

(setq beacon-mode 1)

(require 'org-contacts)
(setq org-contacts-files '("~/org/contacts.org"))



(setq newsticker-url-list
      '(("Proteslaos" "https://protesilaos.com/master.xml")))

(setq newsticker-groups
      `(("Emacs"
         ("Protesilaos"))))

(use-package ace-window
  :init
  (setq aw-dispatch-always t)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :config
  (global-set-key (kbd "M-o") 'ace-window))

(require 'org-alert)
(setq alert-default-style 'libnotify)
(setq org-alert-interval 300)
(setq org-alert-notification-title "org alert")
(org-alert-enable)

(defhydra doom-window-resize-hydra (:hint nil)
  "
Resize window: _h_ left  _j_ down  _k_ up  _l_ right
"
  ("h" evil-window-decrease-width)
  ("j" evil-window-increase-height)
  ("k" evil-window-decrease-height)
  ("l" evil-window-increase-width)
  ("q" nil "quit"))

(setq global-colorful-mode t)
(setq colorful-mode-major-mode t)

(setq ob-mermaid-cli-path "/usr/bin/mmdc")

(require 'org-collector)
