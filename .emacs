;; woddfellow2's Emacs Config
;; by woddfellow2 | http://wlair.us.to/

;; load-path
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/twittering-mode-2.0.0")
(add-to-list 'load-path "~/.emacs.d/lisp/nyan-mode")

;; Disable those space-wasting toolbars
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(menu-bar-mode -1)

;; Display column numbers in modeline
(column-number-mode t)

;; Fortune
(setq fortune-dir "/usr/share/fortune")
(setq fortune-file "/usr/share/fortune/fortunes")

;; Disable splash buffer
(setq inhibit-startup-screen t)

;; Disable *scratch* buffer message
(setq initial-scratch-message "")

;; Disable echo area message at start
(defun display-startup-echo-area-message ()
  (message ""))

;; Save backup and autosave files to a specific directory
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Fix Tetris high scores
(setq tetris-score-file
      "~/.emacs.d/tetris-scores")

;; Emacs-w3m
(require 'w3m-load)
(setq w3m-use-cookies t)

;; Nyan Mode
(require 'nyan-mode)

;; Twittering Mode
(require 'twittering-mode)

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

;; PHP Mode
(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))

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
      (quote (("wlair" "http://wlair.us.to/blog/xmlrpc.php" "wlair" "" "1"))))

;; AUCTeX
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
