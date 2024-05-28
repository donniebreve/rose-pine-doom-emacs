;;; doom-rose-pine-dawn-theme.el --- A light port of Rose Piné Dawn theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: mvllow
;; Ported by: donniebreve
;; Keywords: custom themes, faces
;; Homepage: https://github.com/donniebreve/rose-pine-doom-emacs
;; Package-Requires: ((emacs "25.1") (cl-lib "0.5") (doom-themes "2.2.1"))
;;
;;; Commentary:
;;
;; Thanks to mvllow (https://github.com/rose-pine)
;; Thanks to hlissner (https://github.com/doomemacs/themes)
;;
;;; Code:

(require 'doom-themes)

;;; Variables
(defgroup doom-rose-pine-dawn-theme nil
  "Options for the `doom-rose-pine-dawn' theme."
  :group 'doom-themes)

(defcustom doom-rose-pine-dawn-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-rose-pine-dawn-theme
  :type 'boolean)

(defcustom doom-rose-pine-dawn-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-rose-pine-dawn-theme
  :type 'boolean)

(defcustom doom-rose-pine-dawn-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to determine the exact padding."
  :group 'doom-rose-pine-dawn-theme
  :type '(choice integer boolean))

;;; Theme definition
(def-doom-theme doom-rose-pine-dawn
  "A light port of Rosé Pine Dawn theme"

  ;; Main theme colors
  (
    ;; name           default   256       16
    (base           '("#faf4ed" "#faf4ed" "black"       ))
    (surface        '("#fffaf3" "#fffaf3" "brightblack" ))
    (overlay        '("#f2e9de" "#f2e9de" "brightblack" ))
    (muted          '("#9893a5" "#9893a5" "brightblack" ))
    (subtle         '("#797593" "#797593" "brightblack" ))
    (text           '("#575279" "#575279" "brightblack" ))
    (love           '("#b4637a" "#b4637a" "red"         ))
    (gold           '("#ea9d34" "#ea9d34" "white"       ))
    (rose           '("#d7827e" "#d7827e" "white"       ))
    (pine           '("#286983" "#286983" "white"       ))
    (foam           '("#56949f" "#56949f" "white"       ))
    (iris           '("#907aa9" "#907aa9" "white"       ))
    (highlightL     '("#f4ede8" "#f4ede8" "grey"        ))
    (highlightM     '("#dfdad9" "#dfdad9" "grey"        ))
    (highlightH     '("#cecacd" "#cecacd" "grey"        ))

    ;; Variables required by doom theme
    (bg             base)
    (fg             text)
    ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
    ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
    ;; or region), especially when paired with the `doom-darken', `doom-lighten',
    ;; and `doom-blend' helper functions.
    (bg-alt         surface)
    (fg-alt         text)
    ;; These should represent a spectrum from bg to fg, where base0 is a starker
    ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
    ;; dark grey, base0 should be white and base8 should be black.
    (base0          surface)
    (base1          base)
    (base2          highlightL)
    (base3          overlay)
    (base4          highlightM)
    (base5          highlightH)
    (base6          muted)
    (base7          subtle)
    (base8          text)
    (grey           muted)
    (red            love)
    (orange         gold)
    (green          pine)
    (teal           pine)
    (yellow         rose)
    (blue           pine)
    (dark-blue      pine)
    (magenta        iris)
    (violet         iris)
    (cyan           foam)
    (dark-cyan      foam)
    ;; Variables required by doom theme ends here

    ;; Required face categories for syntax highlighting
    (highlight      subtle)   ; cursor
    (selection      base)     ; can't figure out where this is used
    (region         overlay)  ; visual selection
    (vertical-bar   surface)  ; window split

    (comments       (if doom-rose-pine-dawn-brighter-comments subtle muted))
    (doc-comments   (if doom-rose-pine-dawn-brighter-comments subtle muted))

    (builtin        pine)
    (constants      iris)
    (functions      pine)
    (keywords       pine)
    (methods        foam)
    (numbers        rose)
    (operators      gold)
    (strings        gold)
    (type           rose)
    (variables      iris)

    (error          love)
    (success        foam)
    (warning        gold)

    (vc-added       foam)
    (vc-deleted     love)
    (vc-modified    gold)

    ;; Other categories
    ;; Modeline
    (modeline-bg                (if doom-rose-pine-dawn-brighter-modeline overlay surface))
    (modeline-fg                text)
    (modeline-bg-alt            (if doom-rose-pine-dawn-brighter-modeline muted overlay))
    (modeline-fg-alt            text) ; should this be darker or lighter?
    (modeline-bg-inactive       base)
    (modeline-fg-inactive       subtle)
    (modeline-bg-inactive-alt   base)
    (modeline-fg-inactive-alt   subtle)
    (modeline-pad
      (when doom-rose-pine-dawn-padded-modeline
        if (integerp doom-rose-pine-dawn-padded-modeline) doom-rose-pine-padded-modeline 4)))

  ;; Base theme face overrides
  (
    ;; Font
    ((font-lock-comment-face &override)
      :slant 'italic
      :background (if doom-rose-pine-dawn-brighter-comments (doom-blend teal base 0.07)))
    ((font-lock-type-face &override) :slant 'italic)
    ((font-lock-builtin-face &override) :slant 'italic)
    ((font-lock-function-name-face &override) :foreground type)
    ((font-lock-keyword-face &override) :weight 'bold)
    ((font-lock-constant-face &override) :weight 'bold)

    ;; Highlight line
    (hl-line
       :background highlightL)

    ;; Line numbers
    ((line-number &override) :foreground muted)
    ((line-number-current-line &override) :foreground text)

    ;; Mode line
    (mode-line
      :background modeline-bg
      :foreground modeline-fg
      :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg)))
    (mode-line-inactive
      :background modeline-bg-inactive
      :foreground modeline-fg-inactive
      :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-inactive)))
    (mode-line-emphasis
      :foreground (if doom-rose-pine-dawn-brighter-modeline text subtle))

    ;; Company
    (company-tooltip-selection :background blue :foreground muted)

    ;; CSS mode <built-in> / scss-mode
    (css-proprietary-property :foreground orange)
    (css-property             :foreground green)
    (css-selector             :foreground green)

    ;; Doom mode line
    (doom-modeline-bar :background green) ; The line to the left
    (doom-modeline-evil-emacs-state  :foreground magenta)  ; The dot color when in emacs mode
    (doom-modeline-evil-normal-state :foreground green)    ; The dot color when in normal mode
    (doom-modeline-evil-visual-state :foreground magenta)  ; The dot color when in visual mode
    (doom-modeline-evil-insert-state :foreground orange)   ; The dot color when in insert mode

    ;; Helm
    (helm-selection :foreground base :weight 'bold :background blue)

    ;; Ivy
    (ivy-current-match :background highlightL :distant-foreground fg)
    (ivy-minibuffer-match-face-1 :foreground pine :background nil :weight 'bold)
    (ivy-minibuffer-match-face-2 :foreground iris :background nil :weight 'bold)
    (ivy-minibuffer-match-face-3 :foreground gold :background nil :weight 'bold)
    (ivy-minibuffer-match-face-4 :foreground rose :background nil :weight 'bold)
    (ivy-minibuffer-match-highlight :foreground magenta :weight 'bold)
    (ivy-posframe :background modeline-bg-alt)

    ;; Markdown mode
    (markdown-markup-face :foreground text)
    (markdown-header-face :inherit 'bold :foreground red)
    ((markdown-code-face &override) :background surface)

    ;; org <built-in>
    (org-block :background (doom-blend yellow bg 0.04) :extend t)
    (org-block-background :background (doom-blend yellow bg 0.04))
    (org-block-begin-line :background (doom-blend yellow bg 0.08) :foreground comments :extend t)
    (org-block-end-line :background (doom-blend yellow bg 0.08) :foreground comments :extend t)
    (org-level-1 :foreground gold)
    (org-level-2 :foreground rose)
    (org-level-3 :foreground pine)
    (org-level-4 :foreground iris)
    (org-level-5 :foreground gold)
    (org-level-6 :foreground rose)
    (org-level-7 :foreground pine)
    (org-level-8 :foreground iris)

    ;; Solaire mode line
    (solaire-mode-line-face
      :inherit 'mode-line
      :background modeline-bg-alt
      :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-alt)))
    (solaire-mode-line-inactive-face
      :inherit 'mode-line-inactive
      :background modeline-bg-inactive-alt
      :box (if modeline-pad `(:line-width ,modeline-pad :color ,modeline-bg-inactive-alt)))

    ;; Widget
    (widget-field :foreground fg :background muted)
    (widget-single-line-field :foreground fg :background muted)

    ;; Swiper
    (swiper-line-face :background highlightM)
    (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
    (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
    (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
    (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)))

;;; doom-rose-pine-dawn-theme.el ends here
