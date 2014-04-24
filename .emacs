;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;General Setup;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; display matching parenteses
(show-paren-mode 1)

;; highlight marked area
(transient-mark-mode 1)

;; enable coloring of font
(global-font-lock-mode 1)

;; Prevent the cursor from blinking
(blink-cursor-mode 0)

;; don't show splash screen on startup
(setq inhibit-splash-screen t) 

;; Show an empty scratch pad
(setq initial-scratch-message "")

;; enable ido mode (for when searching for file, etc.)
(ido-mode 1)

;; change yes/no to y/n	       
(fset 'yes-or-no-p 'y-or-n-p)  

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Shortcut Definitions;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;  set C-; to delete char backwards
(global-set-key (kbd "C-;") 'backward-delete-char)
(global-set-key (kbd "M-;") 'backward-kill-word)
;;(define-key key-translation-map [?\C-,] [?\C-?])

;; invoke M-x with C-x C-m 
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; use ibuffer instead of ordinary boring buffer list
(global-set-key "\C-x\C-b" 'ibuffer)

;; Shortcuts for opening and compiling .emacs
(global-set-key "\C-c\C-o" (lambda() (interactive)(find-file "~/.emacs")))
(global-set-key "\C-c\C-l" (lambda() (interactive)(load-file "~/.emacs")))

;;Prefer backward-kill-word over Backspace (NOT SURE I LIKE THIS STUFF REALLY...)
;;(global-set-key "\C-w" 'backward-kill-word)
;;(global-set-key "\C-x\C-k" 'kill-region)
;;(global-set-key "\C-c\C-k" 'kill-region)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Colour Themes;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set color theme
(require 'color-theme)
(add-to-list 'load-path "~/.emacs.d/color-themes/emacs-color-theme-solarized")
(require 'color-theme-solarized)
(load "~/.emacs.d/color-themes/gedit-cobalt.el")
(load "~/.emacs.d/color-themes/color-theme-cobalt.el")
(load "~/.emacs.d/color-themes/zenburn.el")
(eval-after-load "color-theme"
  '(progn 
     (color-theme-initialize)
     (color-theme-gedit-cobalt)))

;; disable color theme when runing emacs in a terminal
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

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
			     (reftex-mode 1)) ;; Enables reftex-mode in latex mode
	  )		       

;;(LaTeX-command "pdflatex")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Misc;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			       
;; line for starting .m files in matlab-mode
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))

;; no idea what this one does...			       
(add-hook 'window-setup-hook 'on-after-init)

;; I need to find a pretty way of doing this..
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 83 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
