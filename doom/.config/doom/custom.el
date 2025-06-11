;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-safe-remote-resources
   '("\\`https://fniessen\\.github\\.io/org-html-themes/org/theme-readtheorg\\.setup\\'"))
 '(package-selected-packages
   '(anti-zenburn-theme beacon colorful-mode doric-themes ef-themes elfeed-org
     elfeed-tube elfeed-tube-mpv ewal-spacemacs-themes flatui-theme fontaine
     gruvbox-theme helm-org-ql leuven-theme lsp-mode markdownfmt minimap
     modus-themes nix-mode ob-mermaid olivetti org-alert org-bullets
     org-contacts org-contrib org-download org-inline-anim org-present org-roam
     org-super-agenda ox-twbs ox-twiki simple-httpd solarized-gruvbox-theme
     solo-jazz-theme spacemacs-theme spacious-padding standard-themes wombag
     zenburn-theme))
 '(safe-local-variable-values
   '((org-publish-project-alist
      ("org-blog-site" :base-directory "/home/joonas/testwebsite/org/"
       :base-extension "org" :publishing-directory
       "/home/joonas/testwebsite/jekyll/" :recursive t :publishing-function
       org-html-publish-to-html :headline-levels 4 :html-extension "html"
       :body-only t)
      ("assets-blog-site" :base-directory "/home/joonas/testwebsite/org/"
       :base-extension
       "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
       :publishing-directory "/home/joonas/testwebsite/jekyll/" :recursive t
       :publishing-function org-publish-attachment)
      ("blog-site" :components ("org-blog-site" "assets-blog-site")))
     (org-publish-project-alist
      ("org-blog-site" :base-directory "~/testwebsite/org/" :base-extension
       "org" :publishing-directory "~/testwebsite/jekyll/" :recursive t
       :publishing-function org-html-publish-to-html :headline-levels 4
       :html-extension "html" :body-only t)
      ("assets-blog-site" :base-directory "~/testwebsite/org/" :base-extension
       "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
       :publishing-directory "~/testwebsite/jekyll/" :recursive t
       :publishing-function org-publish-attachment)
      ("blog-site" :components ("org-blog-site" "assets-blog-site"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:height 1.5 :weight bold)))))
