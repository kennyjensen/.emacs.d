;;; zenblime-theme.el --- A Sublime-like color theme for Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; This is a modification of the Zenburn theme, created by Jani
;; Nurminen for Vim and ported to Emacs by Bozhidar Batsov.

;;; Code:

(deftheme zenblime "The Zenblime color theme")

(let ((class '((class color) (min-colors 89)))
      ;; Zenblime palette
      ;; colors with +x are lighter, colors with -x are darker
      (zenblime-fg "#f8f8f2")
      (zenblime-fg-1 "#e8e8e2")
      (zenblime-fg-2 "#8f908a")
      (zenblime-bg-1 "#171812")
      (zenblime-bg-05 "#1f201a")
      (zenblime-bg "#272822")
      (zenblime-bg+1 "#373832")
      (zenblime-bg+2 "#474842")
      (zenblime-bg+3 "#575852")
      (zenblime-red+1 "#ff3682")
      (zenblime-red "#f92672")
      (zenblime-red-1 "#e91662")
      (zenblime-red-2 "#d90652")
      (zenblime-red-3 "#c90042")
      (zenblime-red-4 "#b90032")
      (zenblime-orange "#fd971f")
      (zenblime-yellow "#e6db74")
      (zenblime-yellow-1 "#d6cb64")
      (zenblime-yellow-2 "#c6bb54")
      (zenblime-green-1 "#b6d21e")
      (zenblime-green "#a6e22e")
      (zenblime-green+1 "#b6f23e")
      (zenblime-green+2 "#c6ff4e")
      (zenblime-green+3 "#d6ff5e")
      (zenblime-green+4 "#e6ff6e")
      (zenblime-cyan "#93e0e3")
      (zenblime-blue+1 "#76e9ff")
      (zenblime-blue "#66d9ef")
      (zenblime-blue-1 "#56c9df")
      (zenblime-blue-2 "#46b9cf")
      (zenblime-blue-3 "#36c9bf")
      (zenblime-blue-4 "#26b9af")
      (zenblime-blue-5 "#16a99f")
      (zenblime-gray "#75715E")
      (zenblime-magenta "#ae81ff"))
  (custom-theme-set-faces
   'zenblime
   '(button ((t (:underline t))))
   `(link ((,class (:foreground ,zenblime-yellow :underline t :weight bold))))
   `(link-visited ((,class (:foreground ,zenblime-yellow-2 :underline t :weight normal))))

   ;;; basic coloring
   `(default ((,class (:foreground ,zenblime-fg :weight light :background ,zenblime-bg))))
   `(cursor ((,class (:foreground ,zenblime-fg))))
   `(escape-glyph-face ((,class (:foreground ,zenblime-red))))
   `(fringe ((,class (:foreground ,zenblime-fg :background ,zenblime-bg+1))))
   `(header-line ((,class (:foreground ,zenblime-yellow
                                       :background ,zenblime-bg-1
                                       :box (:line-width -1 :style released-button)))))
   `(highlight ((,class (:background ,zenblime-bg-05))))

   ;;; compilation
   `(compilation-column-face ((,class (:foreground ,zenblime-yellow))))
   `(compilation-enter-directory-face ((,class (:foreground ,zenblime-green))))
   `(compilation-error-face ((,class (:foreground ,zenblime-red-1 :weight bold :underline t))))
   `(compilation-face ((,class (:foreground ,zenblime-fg))))
   `(compilation-info-face ((,class (:foreground ,zenblime-blue))))
   `(compilation-info ((,class (:foreground ,zenblime-green+4 :underline t))))
   `(compilation-leave-directory-face ((,class (:foreground ,zenblime-green))))
   `(compilation-line-face ((,class (:foreground ,zenblime-yellow))))
   `(compilation-line-number ((,class (:foreground ,zenblime-yellow))))
   `(compilation-message-face ((,class (:foreground ,zenblime-blue))))
   `(compilation-warning-face ((,class (:foreground ,zenblime-yellow-1 :weight bold :underline t))))

   ;;; grep
   `(grep-context-face ((,class (:foreground ,zenblime-fg))))
   `(grep-error-face ((,class (:foreground ,zenblime-red-1 :weight bold :underline t))))
   `(grep-hit-face ((,class (:foreground ,zenblime-blue))))
   `(grep-match-face ((,class (:foreground ,zenblime-orange :weight bold))))
   `(match ((,class (:background ,zenblime-bg-1 :foreground ,zenblime-orange :weight bold))))

   ;; faces used by isearch
   `(isearch ((,class (:foreground ,zenblime-yellow :background ,zenblime-bg-1))))
   `(isearch-fail ((,class (:foreground ,zenblime-fg :background ,zenblime-red-4))))
   `(lazy-highlight ((,class (:foreground ,zenblime-yellow :background ,zenblime-bg+2))))

   `(menu ((,class (:foreground ,zenblime-fg :background ,zenblime-bg))))
   `(minibuffer-prompt ((,class (:foreground ,zenblime-yellow))))
   `(mode-line
     ((,class (:foreground ,zenblime-bg+3
                           :background ,zenblime-bg-1
                           :box (:line-width -1 :style released-button)))))
   `(mode-line-buffer-id ((,class (:foreground ,zenblime-yellow :weight bold))))
   `(mode-line-inactive
     ((,class (:foreground ,zenblime-bg+1
                           :background ,zenblime-bg-05
                           :box (:line-width -1 :style released-button)))))
   `(region ((,class (:background ,zenblime-bg-1))))
   `(secondary-selection ((,class (:background ,zenblime-bg+2))))
   `(trailing-whitespace ((,class (:background ,zenblime-red))))
   `(vertical-border ((,class (:foreground ,zenblime-fg))))

   ;;; font lock
   `(font-lock-builtin-face ((,class (:foreground ,zenblime-blue))))
   `(font-lock-comment-face ((,class (:foreground ,zenblime-gray))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,zenblime-gray))))
   `(font-lock-constant-face ((,class (:foreground ,zenblime-magenta))))
   `(font-lock-doc-face ((,class (:foreground ,zenblime-green+1))))
   `(font-lock-doc-string-face ((,class (:foreground ,zenblime-blue+1))))
   `(font-lock-function-name-face ((,class (:foreground ,zenblime-green))))
   `(font-lock-keyword-face ((,class (:foreground ,zenblime-red :weight light))))
   `(font-lock-negation-char-face ((,class (:foreground ,zenblime-fg))))
   `(font-lock-preprocessor-face ((,class (:foreground ,zenblime-red))))
   `(font-lock-string-face ((,class (:foreground ,zenblime-yellow))))
   `(font-lock-type-face ((,class (:foreground ,zenblime-blue :slant italic))))
   `(font-lock-variable-name-face ((,class (:foreground ,zenblime-orange))))
   `(font-lock-warning-face ((,class (:foreground ,zenblime-red :underline t))))

   `(c-annotation-face ((,class (:inherit font-lock-constant-face))))

   ;;; newsticker
   `(newsticker-date-face ((,class (:foreground ,zenblime-fg))))
   `(newsticker-default-face ((,class (:foreground ,zenblime-fg))))
   `(newsticker-enclosure-face ((,class (:foreground ,zenblime-green+3))))
   `(newsticker-extra-face ((,class (:foreground ,zenblime-bg+2 :height 0.8))))
   `(newsticker-feed-face ((,class (:foreground ,zenblime-fg))))
   `(newsticker-immortal-item-face ((,class (:foreground ,zenblime-green))))
   `(newsticker-new-item-face ((,class (:foreground ,zenblime-blue))))
   `(newsticker-obsolete-item-face ((,class (:foreground ,zenblime-red))))
   `(newsticker-old-item-face ((,class (:foreground ,zenblime-bg+3))))
   `(newsticker-statistics-face ((,class (:foreground ,zenblime-fg))))
   `(newsticker-treeview-face ((,class (:foreground ,zenblime-fg))))
   `(newsticker-treeview-immortal-face ((,class (:foreground ,zenblime-green))))
   `(newsticker-treeview-listwindow-face ((,class (:foreground ,zenblime-fg))))
   `(newsticker-treeview-new-face ((,class (:foreground ,zenblime-blue :weight bold))))
   `(newsticker-treeview-obsolete-face ((,class (:foreground ,zenblime-red))))
   `(newsticker-treeview-old-face ((,class (:foreground ,zenblime-bg+3))))
   `(newsticker-treeview-selection-face ((,class (:foreground ,zenblime-yellow))))

   ;;; external

   ;; full-ack
   `(ack-separator ((,class (:foreground ,zenblime-fg))))
   `(ack-file ((,class (:foreground ,zenblime-blue))))
   `(ack-line ((,class (:foreground ,zenblime-yellow))))
   `(ack-match ((,class (:foreground ,zenblime-orange :background ,zenblime-bg-1 :weigth bold))))

   ;; auctex
   `(font-latex-bold ((,class (:inherit bold))))
   `(font-latex-warning ((,class (:inherit font-lock-warning))))
   `(font-latex-sedate ((,class (:foreground ,zenblime-yellow :weight bold ))))
   `(font-latex-title-4 ((,class (:inherit variable-pitch :weight bold))))

   ;; auto-complete
   `(ac-candidate-face ((,class (:background ,zenblime-bg+3 :foreground "black"))))
   `(ac-selection-face ((,class (:background ,zenblime-blue-4 :foreground ,zenblime-fg))))
   `(popup-tip-face ((,class (:background ,zenblime-yellow-2 :foreground "black"))))
   `(popup-scroll-bar-foreground-face ((,class (:background ,zenblime-blue-5))))
   `(popup-scroll-bar-background-face ((,class (:background ,zenblime-bg-1))))
   `(popup-isearch-match ((,class (:background ,zenblime-bg :foreground ,zenblime-fg))))

   ;; diff
   `(diff-added ((,class (:foreground ,zenblime-green+4))))
   `(diff-changed ((,class (:foreground ,zenblime-yellow))))
   `(diff-removed ((,class (:foreground ,zenblime-red))))
   `(diff-header ((,class (:background ,zenblime-bg+2))))
   `(diff-file-header
     ((,class (:background ,zenblime-bg+2 :foreground ,zenblime-fg :bold t))))

   ;; ert
   `(ert-test-result-expected ((,class (:foreground ,zenblime-green+4 :background ,zenblime-bg))))
   `(ert-test-result-unexpected ((,class (:foreground ,zenblime-red :background ,zenblime-bg))))

   ;; eshell
   `(eshell-prompt ((,class (:foreground ,zenblime-yellow :weight bold))))
   `(eshell-ls-archive ((,class (:foreground ,zenblime-red-1 :weight bold))))
   `(eshell-ls-backup ((,class (:inherit font-lock-comment))))
   `(eshell-ls-clutter ((,class (:inherit font-lock-comment))))
   `(eshell-ls-directory ((,class (:foreground ,zenblime-blue+1 :weight bold))))
   `(eshell-ls-executable ((,class (:foreground ,zenblime-red+1 :weight bold))))
   `(eshell-ls-unreadable ((,class (:foreground ,zenblime-fg))))
   `(eshell-ls-missing ((,class (:inherit font-lock-warning))))
   `(eshell-ls-product ((,class (:inherit font-lock-doc))))
   `(eshell-ls-special ((,class (:foreground ,zenblime-yellow :weight bold))))
   `(eshell-ls-symlink ((,class (:foreground ,zenblime-cyan :weight bold))))

   ;; flymake
   `(flymake-errline ((,class (:foreground ,zenblime-red-1 :weight bold :underline t))))
   `(flymake-warnline ((,class (:foreground ,zenblime-yellow-1 :weight bold :underline t))))

   ;; flyspell
   `(flyspell-duplicate ((,class (:foreground ,zenblime-yellow-1 :weight bold :underline t))))
   `(flyspell-incorrect ((,class (:inherit font-lock-warning))))

   ;; erc
   `(erc-action-face ((,class (:inherit erc-default-face))))
   `(erc-bold-face ((,class (:weight bold))))
   `(erc-current-nick-face ((,class (:foreground ,zenblime-blue :weight bold))))
   `(erc-dangerous-host-face ((,class (:inherit font-lock-warning))))
   `(erc-default-face ((,class (:foreground ,zenblime-fg))))
   `(erc-direct-msg-face ((,class (:inherit erc-default))))
   `(erc-error-face ((,class (:inherit font-lock-warning))))
   `(erc-fool-face ((,class (:inherit erc-default))))
   `(erc-highlight-face ((,class (:inherit hover-highlight))))
   `(erc-input-face ((,class (:foreground ,zenblime-yellow))))
   `(erc-keyword-face ((,class (:foreground ,zenblime-blue :weight bold))))
   `(erc-nick-default-face ((,class (:foreground ,zenblime-yellow :weight bold))))
   `(erc-my-nick-face ((,class (:foreground ,zenblime-red :weigth bold))))
   `(erc-nick-msg-face ((,class (:inherit erc-default))))
   `(erc-notice-face ((,class (:foreground ,zenblime-green))))
   `(erc-pal-face ((,class (:foreground ,zenblime-orange :weight bold))))
   `(erc-prompt-face ((,class (:foreground ,zenblime-orange :background ,zenblime-bg :weight bold))))
   `(erc-timestamp-face ((,class (:foreground ,zenblime-green+1))))
   `(erc-underline-face ((t (:underline t))))

   ;; gnus
   `(gnus-group-mail-1 ((,class (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((,class (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((,class (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((,class (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((,class (:bold t :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((,class (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((,class (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((,class (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((,class (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((,class (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((,class (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((,class (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((,class (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((,class (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((,class (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((,class (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((,class (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((,class (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((,class (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((,class (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((,class (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((,class (:inherit message-header-other))))
   `(gnus-header-from ((,class (:inherit message-header-from))))
   `(gnus-header-name ((,class (:inherit message-header-name))))
   `(gnus-header-newsgroups ((,class (:inherit message-header-other))))
   `(gnus-header-subject ((,class (:inherit message-header-subject))))
   `(gnus-summary-cancelled ((,class (:foreground ,zenblime-orange))))
   `(gnus-summary-high-ancient ((,class (:foreground ,zenblime-blue))))
   `(gnus-summary-high-read ((,class (:foreground ,zenblime-green :weight bold))))
   `(gnus-summary-high-ticked ((,class (:foreground ,zenblime-orange :weight bold))))
   `(gnus-summary-high-unread ((,class (:foreground ,zenblime-fg :weight bold))))
   `(gnus-summary-low-ancient ((,class (:foreground ,zenblime-blue))))
   `(gnus-summary-low-read ((t (:foreground ,zenblime-green))))
   `(gnus-summary-low-ticked ((,class (:foreground ,zenblime-orange :weight bold))))
   `(gnus-summary-low-unread ((,class (:foreground ,zenblime-fg))))
   `(gnus-summary-normal-ancient ((,class (:foreground ,zenblime-blue))))
   `(gnus-summary-normal-read ((,class (:foreground ,zenblime-green))))
   `(gnus-summary-normal-ticked ((,class (:foreground ,zenblime-orange :weight bold))))
   `(gnus-summary-normal-unread ((,class (:foreground ,zenblime-fg))))
   `(gnus-summary-selected ((,class (:foreground ,zenblime-yellow :weight bold))))
   `(gnus-cite-1 ((,class (:foreground ,zenblime-blue))))
   `(gnus-cite-10 ((,class (:foreground ,zenblime-yellow-1))))
   `(gnus-cite-11 ((,class (:foreground ,zenblime-yellow))))
   `(gnus-cite-2 ((,class (:foreground ,zenblime-blue-1))))
   `(gnus-cite-3 ((,class (:foreground ,zenblime-blue-2))))
   `(gnus-cite-4 ((,class (:foreground ,zenblime-green+2))))
   `(gnus-cite-5 ((,class (:foreground ,zenblime-green+1))))
   `(gnus-cite-6 ((,class (:foreground ,zenblime-green))))
   `(gnus-cite-7 ((,class (:foreground ,zenblime-red))))
   `(gnus-cite-8 ((,class (:foreground ,zenblime-red-1))))
   `(gnus-cite-9 ((,class (:foreground ,zenblime-red-2))))
   `(gnus-group-news-1-empty ((,class (:foreground ,zenblime-yellow))))
   `(gnus-group-news-2-empty ((,class (:foreground ,zenblime-green+3))))
   `(gnus-group-news-3-empty ((,class (:foreground ,zenblime-green+1))))
   `(gnus-group-news-4-empty ((,class (:foreground ,zenblime-blue-2))))
   `(gnus-group-news-5-empty ((,class (:foreground ,zenblime-blue-3))))
   `(gnus-group-news-6-empty ((,class (:foreground ,zenblime-bg+2))))
   `(gnus-group-news-low-empty ((,class (:foreground ,zenblime-bg+2))))
   `(gnus-signature ((,class (:foreground ,zenblime-yellow))))
   `(gnus-x ((,class (:background ,zenblime-fg :foreground ,zenblime-bg))))

   ;; helm
   `(helm-header
     ((,class (:foreground ,zenblime-green
                           :background ,zenblime-bg
                           :underline nil
                           :box nil))))
   `(helm-source-header
     ((,class (:foreground ,zenblime-yellow
                           :background ,zenblime-bg-1
                           :underline nil
                           :weight bold
                           :box (:line-width -1 :style released-button)))))
   `(helm-selection ((,class (:background ,zenblime-bg+1 :underline nil))))
   `(helm-selection-line ((,class (:background ,zenblime-bg+1))))
   `(helm-visible-mark ((,class (:foreground ,zenblime-bg :background ,zenblime-yellow-2))))
   `(helm-candidate-number ((,class (:foreground ,zenblime-green+4 :background ,zenblime-bg-1))))

   ;; hl-line-mode
   `(hl-line-face ((,class (:background ,zenblime-bg-1))))

   ;; ido-mode
   `(ido-first-match ((,class (:foreground ,zenblime-yellow :weight bold))))
   `(ido-only-match ((,class (:foreground ,zenblime-orange :weight bold))))
   `(ido-subdir ((,class (:foreground ,zenblime-yellow))))

   ;; js2-mode
   `(js2-warning-face ((,class (:underline ,zenblime-orange))))
   `(js2-error-face ((,class (:foreground ,zenblime-red :weight bold))))
   `(js2-jsdoc-tag-face ((,class (:foreground ,zenblime-green-1))))
   `(js2-jsdoc-type-face ((,class (:foreground ,zenblime-green+2))))
   `(js2-jsdoc-value-face ((,class (:foreground ,zenblime-green+3))))
   `(js2-function-param-face ((,class (:foreground, zenblime-green+3))))
   `(js2-external-variable-face ((,class (:foreground ,zenblime-orange))))

   ;; jabber-mode
   `(jabber-roster-user-away ((,class (:foreground ,zenblime-green+2))))
   `(jabber-roster-user-online ((,class (:foreground ,zenblime-blue-1))))
   `(jabber-roster-user-dnd ((,class (:foreground ,zenblime-red+1))))
   `(jabber-rare-time-face ((,class (:foreground ,zenblime-green+1))))
   `(jabber-chat-prompt-local ((,class (:foreground ,zenblime-blue-1))))
   `(jabber-chat-prompt-foreign ((,class (:foreground ,zenblime-red+1))))
   `(jabber-activity-face((,class (:foreground ,zenblime-red+1))))
   `(jabber-activity-personal-face ((,class (:foreground ,zenblime-blue+1))))
   `(jabber-title-small ((,class (:height 1.1 :weight bold))))
   `(jabber-title-medium ((,class (:height 1.2 :weight bold))))
   `(jabber-title-large ((,class (:height 1.3 :weight bold))))

   ;; linum-mode
   `(linum ((,class (:foreground ,zenblime-bg+2 :background ,zenblime-bg))))

   ;; magit
   `(magit-section-title ((,class (:foreground ,zenblime-yellow :weight bold))))
   `(magit-branch ((,class (:foreground ,zenblime-orange :weight bold))))
   `(magit-item-highlight ((,class (:background ,zenblime-bg+1 :weight bold))))

   ;; message-mode
   `(message-cited-text ((,class (:inherit font-lock-comment))))
   `(message-header-name ((,class (:foreground ,zenblime-green+1))))
   `(message-header-other ((,class (:foreground ,zenblime-green))))
   `(message-header-to ((,class (:foreground ,zenblime-yellow :weight bold))))
   `(message-header-from ((,class (:foreground ,zenblime-yellow :weight bold))))
   `(message-header-cc ((,class (:foreground ,zenblime-yellow :weight bold))))
   `(message-header-newsgroups ((,class (:foreground ,zenblime-yellow :weight bold))))
   `(message-header-subject ((,class (:foreground ,zenblime-orange :weight bold))))
   `(message-header-xheader ((,class (:foreground ,zenblime-green))))
   `(message-mml ((,class (:foreground ,zenblime-yellow :weight bold))))
   `(message-separator ((,class (:inherit font-lock-comment))))

   ;; mew
   `(mew-face-header-subject ((,class (:foreground ,zenblime-orange))))
   `(mew-face-header-from ((,class (:foreground ,zenblime-yellow))))
   `(mew-face-header-date ((,class (:foreground ,zenblime-green))))
   `(mew-face-header-to ((,class (:foreground ,zenblime-red))))
   `(mew-face-header-key ((,class (:foreground ,zenblime-green))))
   `(mew-face-header-private ((,class (:foreground ,zenblime-green))))
   `(mew-face-header-important ((,class (:foreground ,zenblime-blue))))
   `(mew-face-header-marginal ((,class (:foreground ,zenblime-fg :weight bold))))
   `(mew-face-header-warning ((,class (:foreground ,zenblime-red))))
   `(mew-face-header-xmew ((,class (:foreground ,zenblime-green))))
   `(mew-face-header-xmew-bad ((,class (:foreground ,zenblime-red))))
   `(mew-face-body-url ((,class (:foreground ,zenblime-orange))))
   `(mew-face-body-comment ((,class (:foreground ,zenblime-fg :slant italic))))
   `(mew-face-body-cite1 ((,class (:foreground ,zenblime-green))))
   `(mew-face-body-cite2 ((,class (:foreground ,zenblime-blue))))
   `(mew-face-body-cite3 ((,class (:foreground ,zenblime-orange))))
   `(mew-face-body-cite4 ((,class (:foreground ,zenblime-yellow))))
   `(mew-face-body-cite5 ((,class (:foreground ,zenblime-red))))
   `(mew-face-mark-review ((,class (:foreground ,zenblime-blue))))
   `(mew-face-mark-escape ((,class (:foreground ,zenblime-green))))
   `(mew-face-mark-delete ((,class (:foreground ,zenblime-red))))
   `(mew-face-mark-unlink ((,class (:foreground ,zenblime-yellow))))
   `(mew-face-mark-refile ((,class (:foreground ,zenblime-green))))
   `(mew-face-mark-unread ((,class (:foreground ,zenblime-red-2))))
   `(mew-face-eof-message ((,class (:foreground ,zenblime-green))))
   `(mew-face-eof-part ((,class (:foreground ,zenblime-yellow))))

   ;; mic-paren
   `(paren-face-match ((,class (:foreground ,zenblime-cyan :background ,zenblime-bg :weight bold))))
   `(paren-face-mismatch ((,class (:foreground ,zenblime-bg :background ,zenblime-magenta :weight bold))))
   `(paren-face-no-match ((,class (:foreground ,zenblime-bg :background ,zenblime-red :weight bold))))

   ;; mumamo
   `(mumamo-background-chunk-major ((,class (:background nil))))
   `(mumamo-background-chunk-submode1 ((,class (:background ,zenblime-bg-1))))

   ;; nav
   `(nav-face-heading ((,class (:foreground ,zenblime-yellow))))
   `(nav-face-button-num ((,class (:foreground ,zenblime-cyan))))
   `(nav-face-dir ((,class (:foreground ,zenblime-green))))
   `(nav-face-hdir ((,class (:foreground ,zenblime-red))))
   `(nav-face-file ((,class (:foreground ,zenblime-fg))))
   `(nav-face-hfile ((,class (:foreground ,zenblime-red-4))))

   ;; mumamo
   `(mumamo-background-chunk-major ((,class (:background nil))))
   `(mumamo-background-chunk-submode1 ((,class (:background ,zenblime-bg-1))))
   `(mumamo-background-chunk-submode2 ((,class (:background ,zenblime-bg+2))))
   `(mumamo-background-chunk-submode3 ((,class (:background ,zenblime-bg+3))))
   `(mumamo-background-chunk-submode4 ((,class (:background ,zenblime-bg+1))))

   ;; org-mode
   `(org-agenda-date-today
     ((,class (:foreground "white" :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((,class (:inherit font-lock-comment-face))))
   `(org-archived ((,class (:foreground ,zenblime-fg :weight bold))))
   `(org-checkbox ((,class (:background ,zenblime-bg+2 :foreground "white"
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((,class (:foreground ,zenblime-blue :underline t))))
   `(org-deadline-announce ((,class (:foreground ,zenblime-red-1))))
   `(org-done ((,class (:bold t :weight bold :foreground ,zenblime-green+3))))
   `(org-formula ((,class (:foreground ,zenblime-yellow-2))))
   `(org-headline-done ((,class (:foreground ,zenblime-green+3))))
   `(org-hide ((,class (:foreground ,zenblime-bg-1))))
   `(org-level-1 ((,class (:foreground ,zenblime-orange))))
   `(org-level-2 ((,class (:foreground ,zenblime-green+1))))
   `(org-level-3 ((,class (:foreground ,zenblime-blue-1))))
   `(org-level-4 ((,class (:foreground ,zenblime-yellow-2))))
   `(org-level-5 ((,class (:foreground ,zenblime-cyan))))
   `(org-level-6 ((,class (:foreground ,zenblime-green-1))))
   `(org-level-7 ((,class (:foreground ,zenblime-red-4))))
   `(org-level-8 ((,class (:foreground ,zenblime-blue-4))))
   `(org-link ((,class (:foreground ,zenblime-yellow-2 :underline t))))
   `(org-scheduled ((,class (:foreground ,zenblime-green+4))))
   `(org-scheduled-previously ((,class (:foreground ,zenblime-red-4))))
   `(org-scheduled-today ((,class (:foreground ,zenblime-blue+1))))
   `(org-special-keyword ((,class (:foreground ,zenblime-yellow-1))))
   `(org-table ((,class (:foreground ,zenblime-green+2))))
   `(org-tag ((,class (:bold t :weight bold))))
   `(org-time-grid ((,class (:foreground ,zenblime-orange))))
   `(org-todo ((,class (:bold t :foreground ,zenblime-red :weight bold))))
   `(org-upcoming-deadline ((,class (:inherit font-lock-keyword-face))))
   `(org-warning ((,class (:bold t :foreground ,zenblime-red :weight bold))))

   ;; outline
   `(outline-8 ((,class (:inherit default))))
   `(outline-7 ((,class (:inherit outline-8 :height 1.0))))
   `(outline-6 ((,class (:inherit outline-7 :height 1.0))))
   `(outline-5 ((,class (:inherit outline-6 :height 1.0))))
   `(outline-4 ((,class (:inherit outline-5 :height 1.0))))
   `(outline-3 ((,class (:inherit outline-4 :height 1.0))))
   `(outline-2 ((,class (:inherit outline-3 :height 1.0))))
   `(outline-1 ((,class (:inherit outline-2 :height 1.0))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,zenblime-cyan))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,zenblime-yellow))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,zenblime-blue+1))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,zenblime-red+1))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,zenblime-orange))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,zenblime-blue-1))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,zenblime-green+4))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground ,zenblime-red-3))))
   `(rainbow-delimiters-depth-9-face ((,class (:foreground ,zenblime-yellow-2))))
   `(rainbow-delimiters-depth-10-face ((,class (:foreground ,zenblime-green+2))))
   `(rainbow-delimiters-depth-11-face ((,class (:foreground ,zenblime-blue+1))))
   `(rainbow-delimiters-depth-12-face ((,class (:foreground ,zenblime-red-4))))

   ;; rpm-mode
   `(rpm-spec-dir-face ((,class (:foreground ,zenblime-green))))
   `(rpm-spec-doc-face ((,class (:foreground ,zenblime-green))))
   `(rpm-spec-ghost-face ((,class (:foreground ,zenblime-red))))
   `(rpm-spec-macro-face ((,class (:foreground ,zenblime-yellow))))
   `(rpm-spec-obsolete-tag-face ((,class (:foreground ,zenblime-red))))
   `(rpm-spec-package-face ((,class (:foreground ,zenblime-red))))
   `(rpm-spec-section-face ((,class (:foreground ,zenblime-yellow))))
   `(rpm-spec-tag-face ((,class (:foreground ,zenblime-blue))))
   `(rpm-spec-var-face ((,class (:foreground ,zenblime-red))))

   ;; rst-mode
   `(rst-level-1-face ((,class (:foreground ,zenblime-orange))))
   `(rst-level-2-face ((,class (:foreground ,zenblime-green+1))))
   `(rst-level-3-face ((,class (:foreground ,zenblime-blue-1))))
   `(rst-level-4-face ((,class (:foreground ,zenblime-yellow-2))))
   `(rst-level-5-face ((,class (:foreground ,zenblime-cyan))))
   `(rst-level-6-face ((,class (:foreground ,zenblime-green-1))))

   ;; show-paren
   `(show-paren-mismatch ((,class (:foreground ,zenblime-red-3 :background ,zenblime-bg :weight bold))))
   `(show-paren-match ((,class (:foreground ,zenblime-blue-1 :background ,zenblime-bg :weight bold))))

   ;; SLIME
   `(slime-repl-inputed-output-face ((,class (:foreground ,zenblime-red))))

   ;; volatile-highlights
   `(vhl/default-face ((,class (:background ,zenblime-bg+1))))

   ;; whitespace-mode
   `(whitespace-space ((,class (:background ,zenblime-bg :foreground ,zenblime-bg+1))))
   `(whitespace-hspace ((,class (:background ,zenblime-bg :foreground ,zenblime-bg+1))))
   `(whitespace-tab ((,class (:background ,zenblime-bg :foreground ,zenblime-red))))
   `(whitespace-newline ((,class (:foreground ,zenblime-bg+1))))
   `(whitespace-trailing ((,class (:foreground ,zenblime-red :background ,zenblime-bg))))
   `(whitespace-line ((,class (:background ,zenblime-bg-05 :foreground ,zenblime-magenta))))
   `(whitespace-space-before-tab ((,class (:background ,zenblime-orange :foreground ,zenblime-orange))))
   `(whitespace-indentation ((,class (:background ,zenblime-yellow :foreground ,zenblime-red))))
   `(whitespace-empty ((,class (:background ,zenblime-yellow :foreground ,zenblime-red))))
   `(whitespace-space-after-tab ((,class (:background ,zenblime-yellow :foreground ,zenblime-red))))

   ;; wanderlust
   `(wl-highlight-folder-few-face ((,class (:foreground ,zenblime-red-2))))
   `(wl-highlight-folder-many-face ((,class (:foreground ,zenblime-red-1))))
   `(wl-highlight-folder-path-face ((,class (:foreground ,zenblime-orange))))
   `(wl-highlight-folder-unread-face ((,class (:foreground ,zenblime-blue))))
   `(wl-highlight-folder-zero-face ((,class (:foreground ,zenblime-fg))))
   `(wl-highlight-folder-unknown-face ((,class (:foreground ,zenblime-blue))))
   `(wl-highlight-message-citation-header ((,class (:foreground ,zenblime-red-1))))
   `(wl-highlight-message-cited-text-1 ((,class (:foreground ,zenblime-red))))
   `(wl-highlight-message-cited-text-2 ((,class (:foreground ,zenblime-green+2))))
   `(wl-highlight-message-cited-text-3 ((,class (:foreground ,zenblime-blue))))
   `(wl-highlight-message-cited-text-4 ((,class (:foreground ,zenblime-blue+1))))
   `(wl-highlight-message-header-contents-face ((,class (:foreground ,zenblime-green))))
   `(wl-highlight-message-headers-face ((,class (:foreground ,zenblime-red+1))))
   `(wl-highlight-message-important-header-contents ((,class (:foreground ,zenblime-green+2))))
   `(wl-highlight-message-header-contents ((,class (:foreground ,zenblime-green+1))))
   `(wl-highlight-message-important-header-contents2 ((,class (:foreground ,zenblime-green+2))))
   `(wl-highlight-message-signature ((,class (:foreground ,zenblime-green))))
   `(wl-highlight-message-unimportant-header-contents ((,class (:foreground ,zenblime-fg))))
   `(wl-highlight-summary-answered-face ((,class (:foreground ,zenblime-blue))))
   `(wl-highlight-summary-disposed-face ((,class (:foreground ,zenblime-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((,class (:foreground ,zenblime-blue))))
   `(wl-highlight-summary-normal-face ((,class (:foreground ,zenblime-fg))))
   `(wl-highlight-summary-thread-top-face ((,class (:foreground ,zenblime-yellow))))
   `(wl-highlight-thread-indent-face ((,class (:foreground ,zenblime-magenta))))
   `(wl-highlight-summary-refiled-face ((,class (:foreground ,zenblime-fg))))
   `(wl-highlight-summary-displaying-face ((,class (:underline t :weight bold))))

   ;; which-func-mode
   `(which-func ((,class (:foreground ,zenblime-green+4))))

   ;; yascroll
   `(yascroll:thumb-text-area ((,class (:background ,zenblime-bg-1))))
   `(yascroll:thumb-fringe ((,class (:background ,zenblime-bg-1 :foreground ,zenblime-bg-1))))
   )

  ;;; custom theme variables
  (custom-theme-set-variables
   'zenblime
   `(ansi-color-names-vector [,zenblime-bg ,zenblime-red ,zenblime-green ,zenblime-yellow
                                           ,zenblime-blue ,zenblime-magenta ,zenblime-cyan ,zenblime-fg])

   ;; fill-column-indicator
   `(fci-rule-color ,zenblime-bg-05)))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'zenblime)

;;; zenblime-theme.el ends here
