;;; init.el --- My Emacs initialization script.

;;; Commentary:

;;; Code:

;; Check if packages are installed and, if not, install them.
(require 'cl)
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(defvar my-packages
  '(flycheck
    magit)
  "A list of packages to ensure are installed at launch.")

(defun my-install-packages ()
  "Install all packages listed in `my-packages'."
  (unless (every #'package-installed-p my-packages)
    ;; Check for new packages (package versions).
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")

    ;; Install the missing packages.
    (mapc (lambda (package)
            (unless (package-installed-p package)
              (package-install package)))
          my-packages)))

(my-install-packages)

;; Load personal libraries.
(add-to-list 'load-path "~/.emacs.d/personal")
(require 'format-spec)  ;; format-spec is required for git-blame to work.
(require 'git)
(require 'git-blame)
; (require 'google-c-style)
(require 'julia-mode)

;; Remove all Emacs starting messages and menus.
(toggle-scroll-bar 0)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq inhibit-splash-screen t)
(defun display-startup-echo-area-message () (message ""))

;; Make Emacs look like Sublime.
(setq custom-theme-directory "~/.emacs.d/themes/")
(load-theme 'zenblime t)

;; Make numbers purple like in Sublime.
;;
;; TODO: Move into theme file.
(setq font-lock-maximum-decoration nil)
(defun add-number-literal-constant ()
  "Highlight numbers as constants."
  (font-lock-add-keywords
   nil '(("nullptr" . font-lock-constant-face)

         ;; Hexadecimal numbers.
         ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)

         ;; Integer / float / scientific numbers.
         ("\\<[-\\+]?[0-9]*\\.?[0-9]+\\([ulfULF]+\\|[eE][-\\+]?[0-9]+f?\\)?\\>"
          . font-lock-constant-face))))
(add-hook 'c-mode-hook 'add-number-literal-constant)
(add-hook 'c++-mode-hook 'add-number-literal-constant)

;; Start in fullscreen mode.

;; ; X version:
;; (defun toggle-fullscreen ()
;;   (interactive)
;;   (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;                          '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
;;   (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;                          '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

; Mac version.
(defun toggle-fullscreen ()
  "Toggle full screen."
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(toggle-fullscreen)

;; Make scrolling smoother.
(setq redisplay-dont-pause t)
(setq auto-window-vscroll nil)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq scroll-margin 1)

;; Add line and column numbers and white space warnings.
(global-linum-mode 1)
(setq line-number-mode t)
(setq column-number-mode t)
(global-whitespace-mode 1)
(setq whitespace-style
      '(face spaces tabs empty lines-tail space-mark tab-mark trailing))
(setq-default indent-tabs-mode nil)
(show-paren-mode 1)

;; Set default font and font size.
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-11"))
(set-face-attribute 'default nil :family "DejaVu Sans Mono")
(set-face-attribute 'default nil :height 120)
(set-fontset-font t (cons (decode-char 'ucs #x1d70b)
                          (decode-char 'ucs #x1d6fc)) "DejaVu Sans Mono-22")

;; Turn-on spell checking and linting.
(require 'flyspell)
(add-hook 'prog-mode-hook (lambda () (flyspell-prog-mode)))
(add-hook 'prog-mode-hook 'flycheck-mode)
;; The Make checker was emitting excessive warning messages to the
;; mini-buffer.  I tried disabling the warnings with the following:
;;
;;   (setq flycheck-display-errors-function nil)
;;
;; but it didn't work, so I'm just disabling the flychecker for Make
;; for now.
(eval-after-load 'flycheck '(setq flycheck-checkers
                                  (delq 'make flycheck-checkers)))

;; Make doc-view work with PDFs.
(add-hook 'doc-view-mode-hook (lambda () (linum-mode -1)))
(setq doc-view-continuous t)

;; Add quicker file navigating in mini-buffer.
(ido-mode 1)

;; Enable moving between split screen buffers with [shift arrowkeys].
(require 'windmove)
(windmove-default-keybindings)

;; Reload files from disk when they change.
(global-auto-revert-mode t)

;; Put backups in their own directory.
(setq backup-directory-alist `((".*" . "~/.emacs_saves")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs_saves/" t)))

;; Disable buffer list, which I accidentally hit a bunch.
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)

;; Add function to sort lines in a paragraph.
;;
;; Note that the much simpler: "(save-excursion (mark-paragraph ..."
;; doesn't appear to work.
(defun sort-paragraph ()
  "Sort lines in a paragraph."
  (interactive)
  (let ((inhibit-modification-hooks t)
        (saved-point (point)))
    (mark-paragraph)
    (sort-lines nil (point) (mark))
    (goto-char saved-point)))
(global-set-key (kbd "M-s") 'sort-paragraph)

(defun close-all ()
  "Close all buffers."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; Add tab auto-completion.
(global-set-key [(backtab)] 'undo)
(global-set-key [(tab)]
                (lambda ()
                  (interactive)
                  (cond ((eq major-mode 'python-mode) (python-smart-tab))
                        ((eq major-mode 'octave-mode) (octave-smart-tab))
                        (t (smart-tab)))))
(setq hippie-expand-try-functions-list '(try-expand-dabbrev-visible
                                         try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers))
(defun smart-tab ()
  "Indent line or completes variable depending on position."
  (interactive)
  (if (minibufferp)
      (unless (minibuffer-complete)
        (dabbrev-expand nil))
    (if mark-active
        (indent-region (region-beginning)
                       (region-end))
      (if (eq (save-excursion
                (back-to-indentation)
                (current-column))
              (save-excursion
                (indent-for-tab-command)
                (back-to-indentation)
                (current-column)))
          (if (looking-at "\\_>")
              (hippie-expand nil)
            (indent-for-tab-command))
        (indent-for-tab-command)))))

(defun python-smart-tab ()
  "Python version of 'smart-tab'."
  (interactive)
  (if (minibufferp)
      (unless (minibuffer-complete) (dabbrev-expand nil))
    (let ((indentation-column (save-excursion
                                (back-to-indentation)
                                (current-column))))
      (cond (mark-active (indent-region (region-beginning) (region-end)))
            ((< (current-column) indentation-column) (back-to-indentation))
            ((eq (current-column) indentation-column) (indent-for-tab-command))
            ((looking-at "\\_>") (hippie-expand nil))
            (t (indent-for-tab-command))))))

(defun octave-smart-tab ()
  "Octave version of 'smart-tab'."
  (interactive)
  (if (minibufferp)
      (unless (minibuffer-complete)
        (dabbrev-expand nil))
    (if mark-active
        (indent-region (region-beginning)
                       (region-end))
      (if (looking-at "\\_>")
          (hippie-expand nil)
        (indent-for-tab-command)))))

(defadvice hippie-expand (around hippie-expand-case-fold)
  "Try to do case-sensitive matching (not effective with all functions)."
  (let ((case-fold-search nil))
    ad-do-it))
(ad-activate 'hippie-expand)

;; Set up mode defaults.

;; Use Google style for .c and .h files too.
(add-hook 'c-mode-hook (lambda () (setq comment-start "//"
                                        comment-end   "")))
(setq c-mode-common-hook 'google-set-c-style)
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

;; Use python-mode for Bazel build files.
(define-derived-mode bazel-mode python-mode "Bazel mode"
  "Major mode for Bazel files.")
(add-to-list 'auto-mode-alist '("BUILD$" . bazel-mode))

;; Set line length warning at 100 for julia-mode.
(add-hook 'julia-mode-hook '(lambda ()
                              (setq whitespace-line-column 100)))

;; Use two space indents in Bash.
(add-hook 'sh-mode-hook '(lambda ()
                           (setq sh-indentation 2)
                           (setq sh-basic-offset 2)))

;; Set up default behaviors for octave-mode.
;;
;; * Use octave-mode with MATLAB files.
;; * Use the normal MATLAB comment character.
;; * Set a two space indent.  The default octave-mode behavior with
;;   (setq octave-block-offset 2) is strange, so this reverts to a
;;   very basic tabbing behavior.
(setq auto-mode-alist (append '(("\\.m$" . octave-mode)) auto-mode-alist))
(add-hook 'octave-mode-hook
          '(lambda () (setq comment-start "% ")))
(add-hook 'octave-mode-hook (lambda ()
                              (setq tab-stop-list (number-sequence 2 200 2))
                              (setq tab-width 2)
                              (setq indent-for-tab-command 'insert-tab)
                              (setq indent-line-function 'insert-tab)))

;; Set up default behaviors for haskell-mode.
;;
;; * Use auto-indent with Haskell.
;; * Disable smart-tab, which doesn't play well with
;;   Haskell-indentation.
(add-hook 'haskell-mode-hook
          '(lambda ()
             (turn-on-haskell-indentation)
             (global-unset-key [(tab)])))

;; Run Emacs in server mode.
(server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit flycheck))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
