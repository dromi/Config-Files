;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;General Setup;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; display matching parenteses
(show-paren-mode 1)
;; highlight entire bracket expression
(setq show-paren-style 'expression)

;; highlight marked area
(transient-mark-mode 1)

;; enable coloring of font
(global-font-lock-mode 1)

;; Prevent the cursor from blinking
(blink-cursor-mode 0)

;; Highlight current cursor line
(global-hl-line-mode 1)

;; don't show splash screen on startup
(setq inhibit-splash-screen t) 

;; Show an empty scratch pad
(setq initial-scratch-message "")

;; enable ido mode (for when searching for file, etc.)
(ido-mode 1)

;; change yes/no to y/n	       
(fset 'yes-or-no-p 'y-or-n-p)  

;; Insert brackets parwise
(electric-pair-mode 1)

;;remove menu, buttons & scrollbar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode 0))
(if (fboundp 'tool-bar-mode) (tool-bar-mode 0))
(if (fboundp 'menu-bar-mode) (menu-bar-mode 0))

;; Only have right side fringe
(fringe-mode '(0 . 1))

;; Show column-number in the mode line
(column-number-mode 1)

;; Set line-by-line scrolling instead of scrolling chuncks
(setq scroll-step 1)

;; Use tab to cycle buffers
(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "<C-S-iso-lefttab>") (lambda() (interactive) (other-window -1)))

;; setup backup
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;From Heinzy;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tab bar 
;; http://www.emacswiki.org/emacs/TabBarMode
(require 'tabbar)
(autoload 'tabbar-mode "tabbar" "Show tab bars." t)
(tabbar-mode t) ;; turn tabbar on
;;(require 'tabbar-ruler)

;; when closing a tab, show the last opened buffer, instead of the neighboring tab
'(tabbar-default-face ((t (:inherit variable-pitch :background "gray72" :foreground "blue" :height 0.8))))

'(tabbar-selected-face ((t (:inherit tabbar-default-face :background "bisque" :foreground "blue" :box (:line-width 2 :color "white" :style released-button)))))

'(tabbar-cycle-scope (quote tabs))

'(tabbar-mode t nil (tabbar))

					; define your own rule for grouping tabs. Se also line 1668 in tabber.el
(defun my-tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
 This function is a custom function for tabbar-mode's tabbar-buffer-groups.
 This function group all buffers into 3 groups:
 Those Dired, those user buffer, and those emacs buffer.
 Emacs buffer are those starting with "*"."
 (list
  (cond
   ((string-equal "*" (substring (buffer-name) 0 1))
    "Emacs Buffer"
    )
   ((eq major-mode 'dired-mode)
    "Dired"
    )
   (t
    "User Buffer"
    )
   )))

(setq tabbar-buffer-groups-function (quote tabbar-buffer-groups)); groups by major mode. Nessesary when using tabbar-ruler.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Things From byuskel;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Check https://github.com/byuksel/Emacs-as-a-C-Cplusplus-Editor-IDE-settings/blob/master/.emacs
;; or https://www.youtube.com/watch?v=HTUE03LnaXA for sources and explanations

;; start package.el with emacs
(require 'package)
;; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; initialize package.el
(package-initialize)

;; start auto-complete with emacs
(require 'auto-complete)
;; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)

  ;; NOTE TO SELF: Figure out about missing imports (eg. vector, float etc..)
)

; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

; Fix iedit bug 
(define-key global-map (kbd "C-,") 'iedit-mode)

;; start flymake-google-cpplint-load
;; let's define a function for flymake initialization
;(defun my:flymake-google-init () 
;  (require 'flymake-google-cpplint)
;  (custom-set-variables
;   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
;  (flymake-google-cpplint-load)
;)
;(add-hook 'c-mode-hook 'my:flymake-google-init)
;(add-hook 'c++-mode-hook 'my:flymake-google-init)
;
;; start google-c-style with emacs
;(require 'google-c-style)
;(add-hook 'c-mode-common-hook 'google-set-c-style)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)

; turn on Semantic
(semantic-mode 1)
; let's define a function which adds semantic as a suggestion backend to auto complete
; and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete() 
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
;; turn on ede mode 
;; (global-ede-mode 1)
;; create a project for our program.
;; (ede-cpp-root-project "MOM2D" :file "~/MOM2D_PROJECT/MOM2D/MOM2D/src/mom2d.cpp"
;; 		      :include-path '("/../include"))
; you can use system-include-path for setting up the system header file locations.
; turn on automatic reparsing of open buffers in semantic
;; (global-semantic-idle-scheduler-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Shortcut Definitions;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;  set C-; to delete char backwards
;; Old def
; (global-set-key (kbd "C-;") 'backward-delete-char)
; ( global-set-key (kbd "M-;") 'backward-kill-word)
;; New  experimental def
;; (global-set-key (kbd "C-;") 'backward-delete-char)
;; (global-set-key (kbd "M-;") 'backward-kill-word)

;;(define-key key-translation-map [?\C-,] [?\C-?])
;; invoke M-x with C-x C-m 
(global-set-key "\C-x\C-m" 'execute-extended-command)
;(global-set-key "\C-c\C-m" 'execute-extended-command)

;; use ibuffer instead of ordinary boring buffer list
(global-set-key "\C-x\C-b" 'ibuffer)

;; Shortcuts for opening and compiling .emacs
(global-set-key (kbd "C-x C-;") (lambda() (interactive)(find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-x C-'") (lambda() (interactive)(load-file "~/.emacs.d/init.el")))

;; rename buffer
(global-set-key (kbd "M-p") 'rename-buffer)

;; string replace
(global-set-key (kbd "M-[") 'replace-string)

;;navigation med arrows til tabbar
;; tabbar
(global-set-key (kbd "M-<up>") 'tabbar-backward-group)
(global-set-key (kbd "M-<down>") 'tabbar-forward-group)
(global-set-key (kbd "M-<left>") 'tabbar-backward)
(global-set-key (kbd "M-<right>") 'tabbar-forward)

;;Prefer backward-kill-word over Backspace (NOT SURE I LIKE THIS STUFF REALLY...)
;(global-set-key "\C-w" 'backward-kill-word)
;(global-set-key "\C-x\C-k" 'kill-region)
;(global-set-key "\C-c\C-k" 'kill-region)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Colour Themes;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set color theme
(require 'color-theme)
;(add-to-list 'load-path "~/.emacs.d/color-themes/emacs-color-theme-solarized")
;(require 'color-theme-solarized)
(load "~/.emacs.d/color-themes/gedit-cobalt.el")
;(load "~/.emacs.d/color-themes/color-theme-cobalt.el")
;(load "~/.emacs.d/color-themes/zenburn.el")
;(load "~/.emacs.d/elpa/monokai-theme-20140310.1330/monokai-theme.el")
;(load "~/.emacs.d/elpa/zonokai-theme-20140614.926/zonokai-theme.el")

(load-theme 'solarized-dark t)

(setq x-underline-at-descent-line t)

;(color-theme-gedit-cobalt)

;(eval-after-load "color-theme"
;  '(progn 
;     (color-theme-initialize)
;     (color-theme-gedit-cobalt)
;     (load-theme 'solarized-dark t)))


;; disable color theme when runing emacs in a terminal
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Erlang Stuff;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq load-path (cons  "/usr/lib/erlang/lib/tools-2.6.11/emacs"
;; load-path))
;; (setq erlang-root-dir "/usr/lib/erlang")
;; (setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
;; (require 'erlang-start)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;LaTeX Stuff;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Latex stuff
(load "auctex.el" nil t t) 
(load "preview-latex.el" nil t t)
			       
(add-hook 'LaTeX-mode-hook (lambda () 
			     (flyspell-mode 1) ;; Enables flyspell-mode in latex mode. 
                             (TeX-fold-mode 1) ;; Enables folding in latex mode
			     (reftex-mode 1)   ;; Enables reftex-mode in latex mode
			     (setq reftex-plug-into-AUCTeX t)
			     ))



(setq TeX-PDF-mode t)

;;(LaTeX-command "pdflatex")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Processing Stuff;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq processing-location "/opt/processing-2.1.2/processing-java")
(setq processing-application-dir "/opt/processing-2.1.2")
(setq processing-sketchbook-dir "/home/john/sketchbook")

;; Support for Auto-Complete
(defun processing-mode-init ()
  (make-local-variable 'ac-sources)
  (setq ac-sources '(ac-source-dictionary ac-source-yasnippet))
  (make-local-variable 'ac-user-dictionary)
  (setq ac-user-dictionary (append processing-functions
                                   processing-builtins
                                   processing-constants)))

(add-to-list 'ac-modes 'processing-mode)
(add-hook 'processing-mode-hook 'processing-mode-init)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Org-mode Stuff;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
;(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

(add-hook 'org-mode-hook (lambda ()
			  (flyspell-mode 1)
			  (auto-fill-mode 1)
			  (local-unset-key  (kbd "<C-tab>"))
			  )
	  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Cmake Stuff;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Add cmake listfile names to the mode list.
(require 'cmake-mode)
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))



(defun cmake-rename-buffer ()
  "Renames a CMakeLists.txt buffer to cmake-<directory name>."
  (interactive)
  ;(print (concat "buffer-filename = " (buffer-file-name)))
  ;(print (concat "buffer-name     = " (buffer-name)))
  (when (and (buffer-file-name) (string-match "CMakeLists.txt" (buffer-name)))
      ;(setq file-name (file-name-nondirectory (buffer-file-name)))
      (setq parent-dir (file-name-nondirectory (directory-file-name (file-name-directory (buffer-file-name)))))
      ;(print (concat "parent-dir = " parent-dir))
      (setq new-buffer-name (concat "cmake-" parent-dir))
      ;(print (concat "new-buffer-name= " new-buffer-name))
      (rename-buffer new-buffer-name t)
      )
  )
  
(add-hook 'cmake-mode-hook (function cmake-rename-buffer))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Misc;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			       
;; line for starting .m files in matlab-mode
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))

;; line for starting .h files in c++-mode
(setq auto-mode-alist (cons '("\\.h\\'" . c++-mode) auto-mode-alist))


;; Powerline (same thing as found in VIM)
(require 'powerline)
(powerline-default-theme)


;; I need to find a pretty way of doing this..
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(solarized-high-contrast-mode-line nil)
 '(solarized-use-less-bold nil)
 '(solarized-use-more-italic t)
 '(tool-bar-mode nil))
