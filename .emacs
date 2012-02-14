;; woddfellow2's emacs config
;; by woddfellow2 | http://wlair.us.to/

(tool-bar-mode -1)
(toggle-scroll-bar -1)
(menu-bar-mode -1)

(setq tetris-score-file "~/.emacs.d/tetris-scores")

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/twittering-mode-2.0.0")
(add-to-list 'load-path "~/.emacs.d/lisp/nyan-mode")

(require 'w3m-load)

(require 'nyan-mode)

;; Twittering Mode
(require 'twittering-mode)
(setq twittering-username "woddfellow2"
      twittering-use-master-password t)

;; Email
(setq mail-user-agent 'gnus-user-agent)
(setq gnus-directory "~/.emacs.d/gnus.d/News")
(setq message-directory "~/.emacs.d/gnus.d/Mail")

(require 'epa-file)
(epa-file-enable)

;; ELIM
(require 'garak)
(setq elim-executable "/usr/bin/elim-client")

;; ERC
(setq erc-log-channels-directory "~/.erc/logs/")
(setq erc-save-buffer-on-part t)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(erc-modules (quote (autojoin button completion fill irccontrols list log match menu move-to-prompt netsplit networks noncommands readonly ring stamp track))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(defadvice save-buffers-kill-emacs (before save-logs (arg) activate)
(save-some-buffers t (lambda () (when (eq major-mode 'erc-mode) t))))
(setq erc-save-buffer-on-part nil
      erc-save-queries-on-quit nil
      erc-log-write-after-send t
      erc-log-write-after-insert t)
(and
 (require 'erc-highlight-nicknames)
 (add-to-list 'erc-modules 'highlight-nicknames)
 (erc-update-modules))

;; EMMS
(require 'emms-setup)
(emms-standard)
(emms-default-players)

;; PHP Mode
(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))
