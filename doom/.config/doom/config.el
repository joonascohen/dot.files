;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;; ;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "JetBrains Mono" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "JetBrains Mono" :size 14 :weight 'normal))
(after! doom-themes
	(setq doom-themes-enable-bold t
	      doom-themes-enable-italic t))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
;; (setq doom-theme 'sanityinc-tomorrow-eighties)
(setq doom-theme 'doom-gruvbox)


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


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
(global-set-key (kbd "C-c C-f") 'org-ql-find-in-agenda)


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

(setq org-agenda-todo-ignore-scheduled 'future)

;; emphasis markers
(setq org-hide-emphasis-markers t)

;; elfeed

;; work template
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
;; Make Org agenda dates and structure bold
(custom-set-faces!
  '(org-agenda-date :weight bold)
  '(org-agenda-date-today :weight bold)
  '(org-agenda-structure :weight bold)
  '(org-agenda-done :weight bold)
  '(org-agenda-todo :weight bold))
(custom-set-faces!
  '(org-link :weight bold)
  ;; For non-Org buffers, you can also set:
  '(link :weight bold))
;; transparency
(set-frame-parameter nil 'alpha-background 80)  ;; 90 = 90% opaque, 10% transparent
(add-to-list 'default-frame-alist '(alpha-background . 80))
;; org
(setq org-log-done 'time)
;; custom
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
;; Adding Org Roam to Agenda
(setq org-agenda-files (directory-files-recursively "~/org-roam" "~/.org"))

;; consult-org-roam
(use-package consult-org-roam
  :bind(("C-c o" . consult-org-roam-search ))
  )

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


;; super agenda
(setq org-agenda-todo-ignore-scheduled 'future)
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
                           (:name "Japanese"
                                  :tag "japanese"
                                  :scheduled today)
			  (:discard (:anything))))))))))
  :config
  (org-super-agenda-mode))

;; habits
;; (require 'org-habit)
;; (add-to-list 'org-modules 'org-habit)
(setq org-habit-graph-column 60)

;; header font changes
(custom-theme-set-faces
 'user
;; '(org-level-1 ((t (:height 1.25 :weight bold))))
;; '(org-level-2 ((t (:height 1.15 :weight bold))))
;; '(org-level-3 ((t (:height 1.1 :weight bold))))
;; '(org-level-4 ((t (:height 1.05 :weight bold))))
 '(org-document-title ((t (:height 1.5 :weight bold)))))

;; org download
(require 'org-download)

;; org elfeed
(require 'elfeed)
;; (require 'elfeed-org)
(setq elfeed-feeds 
      '(("http://www.spc.noaa.gov/products/spcrss.xml" weather)
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCcaTUtGzOiS4cqrgtcsHYWg"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA"))

; Configure Elfeed with org mode
(use-package elfeed-org
  :ensure t
  :init

  (setq elfeed-show-entry-switch 'display-buffer)
  ;; !! Change this to your elfeed.org file !! 
  (setq rmh-elfeed-org-files (list "~/org/elfeed.org"))

  :config
  (elfeed-org)
  )

;; (use-package elfeed-org
  ;; :after (elfeed)
  ;; :config
  ;; (setq rmh-elfeed-org-files '("~/org/elfeed.org"))
  ;; (elfeed-org))

;; elfeed tube and mpv
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

;; exports
(setq org-export-with-broken-links t)
(setq org-agenda-files '("~/org" "~/org-roam"))

;; org roam
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
;; registers
(set-register ?w (cons 'file "~/org/work-log.org"))

;; column-view from slawomir-grochowski
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

;; bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; line numbers
(display-line-numbers-mode nil)
(add-hook 'org-mode-hook #'doom-disable-line-numbers-h)
(add-hook 'org-mode-hook (lambda () (display-line-numbers-mode 0)))

;; fringe mode, removes the ~
(vi-tilde-fringe-mode -1)
(remove-hook 'org-mode-hook #'vi-tilde-fringe-mode)
(add-hook 'org-mode-hook (lambda () (set-fringe-mode 0)))

;; beacon
(setq beacon-mode 1)
