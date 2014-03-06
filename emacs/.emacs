;; display matching parenteses
(show-paren-mode 1)

;; highlight marked area
(transient-mark-mode 1)

;; enable coloring of font
(global-font-lock-mode 1)

;;  set C-æ to delete char backwards
(global-set-key (kbd "C-æ") 'backward-delete-char)
(global-set-key (kbd "M-æ") 'backward-kill-word)
;;(define-key key-translation-map [?\C-,] [?\C-?])

;; enable ido mode (for when searching for file, etc.)
(ido-mode 1)

;; set color theme
(require 'color-theme)
(load "~/.emacs.d/color-themes/color-theme-cobalt.el")
(eval-after-load "color-theme"
  '(progn 
     (color-theme-initialize)
     (color-theme-cobalt)))


(setq load-path (cons  "/usr/lib/erlang/lib/tools-2.6.11/emacs"
load-path))
(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
(require 'erlang-start)

;; Latex stuff
(load "auctex.el" nil t t)     
(load "preview-latex.el" nil t t)
			       
(add-hook 'LaTeX-mode-hook (lambda () 
			     (flyspell-mode 1) ;; Enables flyspell-mode in latex mode. 
			     (reftex-mode 1)) ;; Enables reftex-mode in latex mode
	  )		       
			       
			       
			       
			       
;; line for starting .m files in matlab-mode
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
			       
;; change yes/no to y/n	       
(fset 'yes-or-no-p 'y-or-n-p)  
			       
;; don't show splash screen on startup
(setq inhibit-splash-screen t) 
			       
;;remove menu, buttons & scrollbar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode 0))
(if (fboundp 'tool-bar-mode) (tool-bar-mode 0))
(if (fboundp 'menu-bar-mode) (menu-bar-mode 0))
			       
;; invoke M-x with C-x C-m     
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(fringe-mode (quote (0)) nil (fringe))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
'(LaTeX-command "pdflatex")
 '(tool-bar-mode nil))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 83 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
