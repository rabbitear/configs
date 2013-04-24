;; woddfellow2's Emacs Config
;; by woddfellow2 | http://wlair.us.to/

;; load-path
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/twittering-mode-2.0.0")
(add-to-list 'load-path "~/.emacs.d/lisp/nyan-mode")

;; Disable those space-wasting training wheels
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(menu-bar-mode -1)

(setq use-dialog-box nil)

;; Disable splash buffer and change *scratch* buffer message
(setq inhibit-startup-screen t
      initial-scratch-message ";; Scratch Buffer\n\n")

;; Change echo area message at start
(defun display-startup-echo-area-message ()
  (message "Emacs: It's not just an editor, it's a way of life!"))

;; Display time and column numbers in mode line
(display-time-mode 1)
(setq display-time-24hr-format t)

(column-number-mode t)
(line-number-mode t)

;; Fortune
(setq fortune-dir "/usr/share/fortune"
      fortune-file "/usr/share/fortune/fortunes")

;; Make C-x C-c less dangerous
(setq confirm-kill-emacs 'yes-or-no-p)

;; To clean this init file, I have decided to move those custom functions here.
; (This is mainly because a line such as:
;    (global-set-key (kbd "C-x M-z") '(switch-to-buffer "*scratch*"))
; ...does not work for some reason.)
(defun switch-to-other-buffer ()
  "Switch to the other buffer in the current window."
  (interactive)
  (switch-to-buffer (other-buffer)))

(defun switch-to-other-buffer-other-window ()
  "Switch to the other buffer in another window."
  (interactive)
  (switch-to-buffer-other-window (other-buffer)))

(defun switch-to-other-buffer-other-frame ()
  "For the sake of completion, switch to the other buffer in another frame."
  (interactive)
  (switch-to-buffer-other-frame (other-buffer)))

(defun switch-to-scratch-buffer ()
  "Switch to the scratch buffer in the current window."
  (interactive)
  (switch-to-buffer "*scratch*"))

(defun switch-to-scratch-buffer-other-window ()
  "Switch to the scratch buffer in another window."
  (interactive)
  (switch-to-buffer-other-window "*scratch*"))

(defun switch-to-scratch-buffer-other-frame ()
  "Switch to the scratch buffer in another frame. This exists for
completion, due to switch-to-scratch-buffer-other-window."
  (interactive)
  (switch-to-buffer-other-frame "*scratch*"))

(defun post-update ()
  "This inserts a timestamp and the bold text 'Update:', useful for
editing forum posts."
  (interactive)
  (shell-command "~/scripts/post-update.sh" t))

;; Custom Keybindings (too many?)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "M-p") 'previous-buffer)
(global-set-key (kbd "M-n") 'next-buffer)

(global-set-key (kbd "C-x M-b") 'switch-to-other-buffer)
(global-set-key (kbd "C-x 4 M-b") 'switch-to-other-buffer-other-window)
(global-set-key (kbd "C-x 5 M-b") 'switch-to-other-buffer-other-frame)

(global-set-key (kbd "C-x M-v") 'view-file)
(global-set-key (kbd "C-x M-g") 'grep)
(global-set-key (kbd "C-x M-h") 'man)

(global-set-key (kbd "C-x M-f") 'auto-fill-mode)
(global-set-key (kbd "C-x M-j") 'whitespace-mode)

(global-set-key (kbd "C-x M-c") 'compile)
(global-set-key (kbd "C-x M-e") 'eval-region)

(global-set-key (kbd "C-x M-s") 'eshell)
(global-set-key (kbd "C-x M-m") 'gnus)
(global-set-key (kbd "C-x M-w") 'w3m)
(global-set-key (kbd "C-x M-t") 'twit)

(global-set-key (kbd "C-x M-a") 'ansi-term)

(global-set-key (kbd "C-x M-d") 'image-dired)

(global-set-key (kbd "C-x M-l") 'calendar)
(global-set-key (kbd "C-x M-[") 'sunrise-sunset)
(global-set-key (kbd "C-x M-]") 'lunar-phases)

(global-set-key (kbd "C-x M-u") 'calc)

(global-set-key (kbd "C-x M-z") 'switch-to-scratch-buffer)
(global-set-key (kbd "C-x 4 z") 'switch-to-scratch-buffer-other-window)
(global-set-key (kbd "C-x 5 z") 'switch-to-scratch-buffer-other-frame)

(global-set-key (kbd "C-x C-c") 'save-buffers-kill-emacs)

;; Scroll conservatively
(setq scroll-conservatively most-positive-fixnum)

;; Highlight trailing whitespace and empty lines
(setq-default indicate-empty-lines t)

;; Iswitchb mode
(iswitchb-mode 1)

;; Some cursor customisation
(setq x-stretch-cursor t)

;; Visible bell
(setq visible-bell t)

;; Make ediff ratpoison-friendly
(setq ediff-window-setup-function 'ediff-setup-windows-plain
      ediff-grab-mouse nil)

;; Save backup and autosave files to a specific directory (I hope one day to
;; change this to something other than /tmp.)
(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Emacs-w3m
(require 'w3m-load)
(setq w3m-use-cookies t)
(setq-default w3m-use-toolbar nil)
(setq browse-url-browser-function #'w3m-browse-url)

;; Nyan Mode
(require 'nyan-mode)

;; Twittering Mode
(require 'twittering-mode)
(setq twittering-use-master-password t)

;; Gnus
(setq read-mail-command 'gnus
      mail-user-agent 'gnus-user-agent
      gnus-directory "~/.emacs.d/gnus.d/News"
      message-directory "~/.emacs.d/gnus.d/Mail"
      user-mail-address "woddfellow2@gmail.com")

(require 'epa-file)

(require 'nnrss)

;; C
(setq c-default-style "bsd"
      indent-tabs-mode t
      c-basic-offset 8
      c-electric-flag nil
      c-syntactic-indentation nil)

;; Python
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(defun woddf2-python-mode-hook ()
  "At the moment, all this does is set-fill-column to 79 as per PEP 8."
  (set-fill-column 79)
  (auto-fill-mode 1))

(add-hook 'python-mode-hook 'woddf2-python-mode-hook)

;; Perl (cperl-mode is supposed to be better)
(defalias 'perl-mode 'cperl-mode)
(setq cperl-indent-level 8
      cperl-continued-statement-offset 0)

;; HTML
(add-hook 'html-mode-hook
	  (lambda ()
	    (setq sgml-basic-offset 8
		  indent-tabs-mode t)))

;; CSS
(setq css-indent-offset 8)

;; PHP
(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode))
			      auto-mode-alist))

;; BB Code <https://bitbucket.org/jfm/emacs-bbcode/>
(autoload 'bbcode-mode "bbcode-mode" "BBCode editing mode." t)
(add-to-list 'auto-mode-alist '("\\.bbc\\(ode\\)?\\'" . bbcode-mode))

;; FVWM
(require 'fvwm-mode)

;; StumpWM
(load "~/.emacs.d/lisp/stumpwm-mode.el")

;; Calendar (sunrise/sunset, 24-hour time, ISO 8601)
(setq calendar-latitude 40.57667
      calendar-longitude -122.37028
      calendar-location-name "Redding, CA"
      calendar-time-display-form
      '(24-hours ":" minutes (if time-zone " (") time-zone (if time-zone ")"))
      calendar-date-style 'iso)

;; Marmalade
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)
