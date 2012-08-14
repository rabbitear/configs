;; woddfellow2's Emacs Config
;; by woddfellow2 | http://wlair.us.to/

;; load-path
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/twittering-mode-2.0.0")
(add-to-list 'load-path "~/.emacs.d/lisp/nyan-mode")

;; Disable those space-wasting toolbars; they are for n00bs anyway
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(menu-bar-mode -1)

;; Display time in mode line
(display-time-mode 1)
(setq display-time-24hr-format t)

;; Display column numbers in modeline
(column-number-mode t)

;; Fortune
(setq fortune-dir "/usr/share/fortune")
(setq fortune-file "/usr/share/fortune/fortunes")

;; Disable splash buffer
(setq inhibit-startup-screen t)

;; Change *scratch* buffer message
(setq initial-scratch-message ";; Emacs Scratch Buffer\n\n")

;; Change echo area message at start
(defun display-startup-echo-area-message ()
  (message "For plusgood info about FreeSoft, type C-h C-a."))

;; Make C-x C-c less dangerous
(setq confirm-kill-emacs 'yes-or-no-p)

;; Custom Keybindings (too many?)
(global-set-key (kbd "C-x M-p") 'previous-buffer)
(global-set-key (kbd "C-x M-n") 'next-buffer)

(global-set-key (kbd "C-x M-b") 'ibuffer)

(global-set-key (kbd "C-x M-c") 'compile)
(global-set-key (kbd "C-x M-e") 'eval-region)

(global-set-key (kbd "C-x M-s") 'eshell)
(global-set-key (kbd "C-x M-m") 'gnus)
(global-set-key (kbd "C-x M-w") 'w3m)
(global-set-key (kbd "C-x M-t") 'twit)
(global-set-key (kbd "C-x M-f") 'emms)

(global-set-key (kbd "C-x M-a") 'ansi-term)

(global-set-key (kbd "C-x M-d") 'image-dired)

(global-set-key (kbd "C-x M-l") 'calendar)
(global-set-key (kbd "C-x M-u") 'calculator)

(defun switch-to-scratch-buffer ()
  (interactive)
  (switch-to-buffer "*scratch*"))
(global-set-key (kbd "C-x M-z") 'switch-to-scratch-buffer)

;; Insert date of post update (BBCode)
(defun post-update ()
  (interactive)
  (shell-command "~/scripts/post-update.sh" t))

;; Scroll conservatively
(setq scroll-conservatively most-positive-fixnum)

;; Make ediff ratpoison-friendly
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Save backup and autosave files to a specific directory
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Fix Tetris and Snake high scores
(setq tetris-score-file "~/.emacs.d/tetris-scores"
      snake-score-file "~/.emacs.d/snake-scores")

;; Emacs-w3m
(require 'w3m-load)
(setq w3m-use-cookies t)

;; Nyan Mode
(require 'nyan-mode)

;; Twittering Mode
(require 'twittering-mode)
(setq twittering-use-master-password t)

;; Gnus
(setq mail-user-agent 'gnus-user-agent)
(setq gnus-directory "~/.emacs.d/gnus.d/News")
(setq message-directory "~/.emacs.d/gnus.d/Mail")

(require 'epa-file)

(require 'nnrss)

;; ERC
(load "~/.erc/config")

;; EMMS
(require 'emms-setup)
(emms-standard)
(emms-default-players)

(require 'emms-mode-line)
(require 'emms-playing-time)
(emms-mode-line 1)
(emms-playing-time 1)

;; C
(setq-default c-default-style "bsd"
	      indent-tabs-mode t
	      c-basic-offset 8
	      c-electric-flag nil)

(setq c-syntactic-indentation nil) ;; I would prefer to do this myself

;; Python Mode
(defun my-python-mode-hook ()
  (set-fill-column 79)
  (auto-fill-mode 1)) ;; As per PEP-8

(add-hook 'python-mode-hook 'my-python-mode-hook)

;; PHP Mode
(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode))
			      auto-mode-alist))

;; BB Code Mode <https://bitbucket.org/jfm/emacs-bbcode/>
(autoload 'bbcode-mode "bbcode-mode" "BBCode editing mode." t)
(add-to-list 'auto-mode-alist '("\\.bbc\\(ode\\)?\\'" . bbcode-mode))

;; FVWM Mode
(require 'fvwm-mode)

;; ratpoison
(require 'ratpoison)

;; Weblogger Mode
(require 'weblogger)
(setq weblogger-config-alist
      (quote (("default" "http://wlair.us.to/blog/xmlrpc.php" "wlair" "" "1")
	      ("wlair" "http://wlair.us.to/blog/xmlrpc.php" "wlair" "" "1"))))

;; AUCTeX
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; Calendar sunrise/sunset
(setq calendar-latitude 36.13139)
(setq calendar-longitude -95.93722)
(setq calendar-location-name "Tulsa, OK")

;; SLIME
(load (expand-file-name "~/apps/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
