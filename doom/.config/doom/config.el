(setq doom-font (font-spec :family "Iosevka Comfy Duo" :size 16)
      doom-variable-pitch-font (font-spec :family "Iosevka Aile" :size 16)
      doom-big-font (font-spec :family "Iosevka Term" :size 24 :weight 'semibold))
;; (setq doom-font "Iosevka Term-14")
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

;; (setq doom-theme 'doom-gruvbox)
(setq doom-theme 'ef-duo-light)

(setq display-line-numbers-type t)

(set-frame-parameter nil 'alpha-background 80)  ;; 90 = 90% opaque, 10% transparent
(add-to-list 'default-frame-alist '(alpha-background . 80))

(setq display-buffer-alist
      '(
        ("\\*Consult\\*"
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

(setq org-directory "~/org/")

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

(setq org-agenda-files (directory-files-recursively "~/org-roam" "~/.org" "~/.config/doom"))

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
  (add-to-list 'org-capture-templates
    '("w" "work" entry
      (file+datetree "~/org/work-log.org")
      "* %U %?\n%i\n%a" :kill-buffer t))
    (add-to-list 'org-capture-templates
        '("m" "Meeting" entry
        (file+datetree "~/org/work-log.org")
        "* %U %? :MEETING: \n** Attendees\n-\n** Meetings Notes   :NOTE:\n-\n** Next Steps\n\n"
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

(setq org-log-done 'time)

(setq org-M-RET-may-split-line '((default . nil)))
(setq org-insert-heading-respect-content t)
(setq org-log-into-drawer t)
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
      org-agenda-span 1
      org-agenda-start-on-weekday nil)
  (setq org-agenda-custom-commands
        '(("d" "Simple day view"
           ((agenda "" ((org-agenda-overriding-header "")
                        (org-super-agenda-groups
                         '((:name "Today"
                                  :time-grid t
                                  :date today
                                  :scheduled today
                                  :order 1)
                           (:name "Bills"
                                  :date today
                                  :scheduled today
                                  :tag "bills"
                                  :order 2)
                           (:name "Configuration"
                                  :tag "config"
                                  :date today)
			 (:discard (:anything))))))))
        ("c" "Config view"
            ((tags-todo "config"
            ((org-agenda-verriding-header "Configurations to do")
                (org-super-aenda-groups
                '((:name "Cnfigs to do"
                    :tag "config")))))))
        ("o" "Overdue tasks"
                agenda ""
                ((org-super-agenda-groups
                '((:name "Overdue"
                            :and (:not (:todo "DONE")
                                    (:scheduled past))
                            :and (:not (:todo "DONE")
                                    (:deadline past)))))))))
  :config
  (org-super-agenda-mode))

(setq org-agenda-todo-ignore-scheduled 'future)

(setq org-agenda-custom-commands
      '(("d" "Daily Agenda"
         ((agenda "" (org-agenda-span 'day))))))

(setq org-tag-alist
      '(
        ("meeting" . ?m)
        ("walking" . ?W)
        ("riding" . ?r)
        ("weights" . ?w)
        ("band" . ?b)
        ("dogs" . ?d)
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

(global-set-key (kbd "C-c C-a") 'org-agenda)
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

(after! org
(map! :leader
      :desc "QL Agenda Search" "f a" #'org-ql-find-in-agenda))

(set-register ?w (cons 'file "~/org/work-log.org"))

(display-line-numbers-mode nil)
(add-hook 'org-mode-hook #'doom-disable-line-numbers-h)
(add-hook 'org-mode-hook (lambda () (display-line-numbers-mode 0)))

(vi-tilde-fringe-mode -1)
(remove-hook 'org-mode-hook #'vi-tilde-fringe-mode)
(add-hook 'org-mode-hook (lambda () (set-fringe-mode 0)))

(setq org-agenda-include-diary t)
(setq diary-file "~/org/diary.org")
(setq calendar-view-diary-initially-flag t
      diary-number-of-entries 7
      diary-display-function #'diary-fancy-display)
(add-hook 'calendar-today-visible-hook 'calendar-mark-today)

(use-package consult-org-roam
  :bind(("C-c o" . consult-org-roam-search ))
  )



(require 'org-download)

(require 'elfeed)

(setq elfeed-feeds
      '(("http://www.spc.noaa.gov/products/spcrss.xml" weather)
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCcaTUtGzOiS4cqrgtcsHYWg"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA"))

(use-package elfeed-org
  :ensure t
  :init

  (setq elfeed-show-entry-switch 'display-buffer)
  ;; !! Change this to your elfeed.org file !!
  (setq rmh-elfeed-org-files (list "~/org/elfeed.org"))

  :config
  (elfeed-org)
  )

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

(setq beacon-mode 1)

(require 'org-contacts)
(setq org-contacts-files '("~/org/contacts.org"))


